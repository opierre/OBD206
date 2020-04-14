import QtQuick 2.9

Item {
    id: valueSource
    property real kph: 0
    property real rpm: 1
    property real fuel: 0
    property string gear: {
        var g;
        if (kph == 0) {
            return "P";
        }
        if (kph < 30) {
            return "1";
        }
        if (kph < 50) {
            return "2";
        }
        if (kph < 80) {
            return "3";
        }
        if (kph < 120) {
            return "4";
        }
        if (kph < 160) {
            return "5";
        }
    }
    property int turnSignal: gear == "P" && !start ? randomDirection() : -1
    property real temperature: 50
    property real kms: 179845
    property real kmsLeft: 351
    property bool start: true

    function randomDirection() {
        return Math.random() > 0.5 ? Qt.LeftArrow : Qt.RightArrow;
    }

    SequentialAnimation {
        running: true
        loops: 1

        // We want a small pause at the beginning, but we only want it to happen once.
        PauseAnimation {
            duration: 1000
        }

        PropertyAction {
            target: valueSource
            property: "start"
            value: false
        }

        SequentialAnimation {
            loops: Animation.Infinite
            ParallelAnimation {
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.InOutSine
                    from: 0
                    to: 30
                    duration: 3000
                }
                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    from: 1
                    to: 6.1
                    duration: 3000
                }
                NumberAnimation {
                    target: valueSource
                    property: "fuel"
                    easing.type: Easing.InOutSine
                    from: 0
                    to: 0.3
                    duration: 3000
                }
                NumberAnimation {
                    target: valueSource
                    property: "temperature"
                    easing.type: Easing.InOutSine
                    from: 50
                    to: 50
                    duration: 3000
                }
                NumberAnimation {
                    target: valueSource
                    property: "kms"
                    easing.type: Easing.InOutSine
                    from: 179846
                    to: 179850
                    duration: 3000
                }
                NumberAnimation {
                    target: valueSource
                    property: "kmsLeft"
                    easing.type: Easing.InOutSine
                    from: 351
                    to: 800
                    duration: 3000
                }
            }
            ParallelAnimation {
                // We changed gears so we lost a bit of speed.
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.InOutSine
                    from: 30
                    to: 26
                    duration: 600
                }
                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    from: 6
                    to: 2.4
                    duration: 600
                }
                NumberAnimation {
                    target: valueSource
                    property: "fuel"
                    easing.type: Easing.InOutSine
                    to: 0.7
                    duration: 600
                }
                NumberAnimation {
                    target: valueSource
                    property: "temperature"
                    easing.type: Easing.InOutSine
                    to: 70
                    duration: 600
                }
                NumberAnimation {
                    target: valueSource
                    property: "kms"
                    easing.type: Easing.InOutSine
                    from: 179850
                    to: 179852
                    duration: 600
                }
                NumberAnimation {
                    target: valueSource
                    property: "kmsLeft"
                    easing.type: Easing.InOutSine
                    from: 800
                    to: 500
                    duration: 600
                }
            }
            ParallelAnimation {
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.InOutSine
                    to: 60
                    duration: 3000
                }
                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    to: 5.6
                    duration: 3000
                }
                NumberAnimation {
                    target: valueSource
                    property: "fuel"
                    easing.type: Easing.InOutSine
                    to: 0.9
                    duration: 3000
                }
                NumberAnimation {
                    target: valueSource
                    property: "temperature"
                    easing.type: Easing.InOutSine
                    to: 70
                    duration: 3000
                }
                NumberAnimation {
                    target: valueSource
                    property: "kms"
                    easing.type: Easing.InOutSine
                    from: 179852
                    to: 179860
                    duration: 3000
                }
                NumberAnimation {
                    target: valueSource
                    property: "kmsLeft"
                    easing.type: Easing.InOutSine
                    from: 500
                    to: 654
                    duration: 3000
                }
            }
            ParallelAnimation {
                // We changed gears so we lost a bit of speed.
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.InOutSine
                    to: 56
                    duration: 600
                }
                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    to: 2.3
                    duration: 600
                }
                NumberAnimation {
                    target: valueSource
                    property: "temperature"
                    easing.type: Easing.InOutSine
                    to: 70
                    duration: 600
                }
                NumberAnimation {
                    target: valueSource
                    property: "kms"
                    easing.type: Easing.InOutSine
                    from: 179860
                    to: 179912
                    duration: 600
                }
                NumberAnimation {
                    target: valueSource
                    property: "kmsLeft"
                    easing.type: Easing.InOutSine
                    from: 654
                    to: 220
                    duration: 600
                }
            }
            ParallelAnimation {
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.InOutSine
                    to: 100
                    duration: 3000
                }
                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    to: 5.1
                    duration: 3000
                }
                NumberAnimation {
                    target: valueSource
                    property: "fuel"
                    easing.type: Easing.InOutSine
                    to: 1
                    duration: 3000
                }
                NumberAnimation {
                    target: valueSource
                    property: "temperature"
                    easing.type: Easing.InOutSine
                    to: 90
                    duration: 3000
                }
                NumberAnimation {
                    target: valueSource
                    property: "kms"
                    easing.type: Easing.InOutSine
                    from: 179912
                    to: 179920
                    duration: 3000
                }
                NumberAnimation {
                    target: valueSource
                    property: "kmsLeft"
                    easing.type: Easing.InOutSine
                    from: 220
                    to: 567
                    duration: 3000
                }
            }
            ParallelAnimation {
                // We changed gears so we lost a bit of speed.
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.InOutSine
                    to: 96
                    duration: 600
                }
                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    to: 2.2
                    duration: 600
                }
                NumberAnimation {
                    target: valueSource
                    property: "fuel"
                    easing.type: Easing.InOutSine
                    to: 0.8
                    duration: 600
                }
                NumberAnimation {
                    target: valueSource
                    property: "temperature"
                    easing.type: Easing.InOutSine
                    to: 90
                    duration: 600
                }
                NumberAnimation {
                    target: valueSource
                    property: "kms"
                    easing.type: Easing.InOutSine
                    from: 179920
                    to: 179934
                    duration: 600
                }
            }

            ParallelAnimation {
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.InOutSine
                    to: 140
                    duration: 3000
                }
                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    to: 6.2
                    duration: 3000
                }
                NumberAnimation {
                    target: valueSource
                    property: "fuel"
                    easing.type: Easing.InOutSine
                    to: 0.5
                    duration: 3000
                }
                NumberAnimation {
                    target: valueSource
                    property: "temperature"
                    easing.type: Easing.InOutSine
                    to: 110
                    duration: 3000
                }
                NumberAnimation {
                    target: valueSource
                    property: "kms"
                    easing.type: Easing.InOutSine
                    from: 179934
                    to: 178054
                    duration: 3000
                }
            }

            // Start downshifting.

            // Fifth to fourth gear.
            ParallelAnimation {
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.Linear
                    to: 100
                    duration: 5000
                }

                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    to: 3.1
                    duration: 5000
                }
                NumberAnimation {
                    target: valueSource
                    property: "fuel"
                    easing.type: Easing.InOutSine
                    to: 0.3
                    duration: 5000
                }
                NumberAnimation {
                    target: valueSource
                    property: "temperature"
                    easing.type: Easing.InOutSine
                    to: 110
                    duration: 5000
                }
            }

            // Fourth to third gear.
            NumberAnimation {
                target: valueSource
                property: "rpm"
                easing.type: Easing.InOutSine
                to: 5.5
                duration: 600
            }

            ParallelAnimation {
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.InOutSine
                    to: 60
                    duration: 5000
                }
                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    to: 2.6
                    duration: 5000
                }
                NumberAnimation {
                    target: valueSource
                    property: "fuel"
                    easing.type: Easing.InOutSine
                    to: 0
                    duration: 5000
                }
                NumberAnimation {
                    target: valueSource
                    property: "kmsLeft"
                    easing.type: Easing.InOutSine
                    from: 567
                    to: 800
                    duration: 5000
                }
            }

            // Third to second gear.
            NumberAnimation {
                target: valueSource
                property: "rpm"
                easing.type: Easing.InOutSine
                to: 6.3
                duration: 600
            }

            ParallelAnimation {
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.InOutSine
                    to: 30
                    duration: 5000
                }
                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    to: 2.6
                    duration: 5000
                }
            }

            NumberAnimation {
                target: valueSource
                property: "rpm"
                easing.type: Easing.InOutSine
                to: 6.5
                duration: 600
            }

            // Second to first gear.
            ParallelAnimation {
                NumberAnimation {
                    target: valueSource
                    property: "kph"
                    easing.type: Easing.InOutSine
                    to: 0
                    duration: 5000
                }
                NumberAnimation {
                    target: valueSource
                    property: "rpm"
                    easing.type: Easing.InOutSine
                    to: 1
                    duration: 4500
                }
            }

            PauseAnimation {
                duration: 5000
            }
        }
    }
}
