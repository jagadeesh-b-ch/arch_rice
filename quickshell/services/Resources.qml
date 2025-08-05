pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property int cpuUsage: 0
    property var prev: [0, 0] // [idle, total]
    property real cpuTemp: 0
    property real usedRam: 0
    property real availableRam: 0
    property real totalRam: 0

    Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: {
            ramProcess.running = true
            tempProcess.running = true
        }
    }

    Timer {
        interval: 500
        running: true
        repeat: true
        onTriggered: statReader.running = true
    }

    Process {
        id: ramProcess
        command: ["bash", "-c", "awk '/MemTotal/ { total=$2 } /MemAvailable/ { avail=$2 } END { used=total-avail; printf \"%.2f %.2f %.2f\", used/1024/1024, avail/1024/1024, total/1024/1024 }' /proc/meminfo"]
        stdout: StdioCollector {
            onStreamFinished: {
                var ramParts = text.trim().split(" ")
                usedRam = parseFloat(ramParts[0])
                availableRam = parseFloat(ramParts[1])
                totalRam = parseFloat(ramParts[2])
            }
        }
    }
    Process {
        id: tempProcess
        command: ["bash", "-c", "cat /sys/class/thermal/thermal_zone0/temp"]
        stdout: StdioCollector {
            onStreamFinished: {
                cpuTemp = parseInt(text.trim()) / 1000
            }
        }
    }
    Process {
        id: statReader
        command: ["bash", "-c", "awk '/^cpu / {idle=$5+$6; total=0; for (i=2; i<=NF; i++) total+=$i; printf \"%d %d\", idle, total }' /proc/stat"]

        stdout: StdioCollector {
            onStreamFinished: {
                var parts = text.split(" ")
                let idle = parseInt(parts[0])
                let total = parseInt(parts[1])

                let deltaIdle = idle - prev[0]
                let deltaTotal = total - prev[1]

                cpuUsage = deltaTotal > 0 ? Math.round(100 * (deltaTotal - deltaIdle) / deltaTotal) : 0
                prev = [idle, total]
            }
        }
    }
}
