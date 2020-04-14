import QtQuick 2.9
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0

ApplicationWindow {
    id: app
    visible: true
    title: qsTr("OBD 206")
    visibility: ApplicationWindow.FullScreen

    Units {
        id: gUnits
        currentResX : app.width
        currentResY: app.height
    }

    FontLoader {
        id: ubuntuFont
        source:"qrc:Ubuntu-R.ttf"
    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Navigation {
        }

        Dashboard {
            id: dashboard
        }

        Page4Form {
        }

        ReverseCamera {

        }
    }

    header: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        contentHeight: app.height * 0.1

        background: Rectangle {
            color: "#0D1016"
        }

        TabButton {
            id: tabButtonGPS
            contentItem: Image {
                id: imageGPS
                source: tabBar.currentIndex == 0 ? "qrc:gps_light.svg" : "qrc:gps_grey.svg"
                scale: 0.9
                fillMode: Image.PreserveAspectFit
                smooth: true
            }
            background: Rectangle {
                color: "#0D1016"
            }
            Glow {
                anchors.fill: imageGPS
                visible: tabBar.currentIndex == 0 ? true : false
                radius: 10
                samples: 27
                color: "#03FFCF"
                scale: 0.9
                source: imageGPS
                opacity: 0.4
            }
        }
        TabButton {
            id: tabButtonDash
            contentItem: Image {
                id: imageHome
                source: tabBar.currentIndex == 1 ? "qrc:home_light.svg" : "qrc:home_grey.svg"
                scale: 0.9
                fillMode: Image.PreserveAspectFit
                smooth: true
            }
            background: Rectangle {
                color: "#0D1016"
            }
            Glow {
                anchors.fill: imageHome
                visible: tabBar.currentIndex == 1 ? true : false
                radius: 10
                samples: 27
                color: "#03FFCF"
                scale: 0.9
                source: imageHome
                opacity: 0.4
            }
        }
        TabButton {
            id: tabButtonMusic
            contentItem: Image {
                id: imageMusic
                source: tabBar.currentIndex == 2 ? "qrc:music_light.svg" : "qrc:music_grey.svg"
                scale: 0.9
                fillMode: Image.PreserveAspectFit
                smooth: true
            }
            background: Rectangle {
                color: "#0D1016"
            }
            Glow {
                anchors.fill: imageMusic
                visible: tabBar.currentIndex == 2 ? true : false
                radius: 10
                samples: 27
                color: "#03FFCF"
                scale: 0.9
                source: imageMusic
                opacity: 0.4
            }
        }
        TabButton {
            id: tabButtonCamera
            contentItem: Image {
                id: imageCamera
                source: tabBar.currentIndex == 3 ? "qrc:reverse_light.svg" : "qrc:reverse_grey.svg"
                scale: 0.9
                fillMode: Image.PreserveAspectFit
                smooth: true
            }
            background: Rectangle {
                color: "#0D1016"
            }
            Glow {
                anchors.fill: imageCamera
                visible: tabBar.currentIndex == 3 ? true : false
                radius: 10
                samples: 27
                color: "#03FFCF"
                scale: 0.9
                source: imageCamera
                opacity: 0.4
            }
        }
    }

    Button {
        id: buttonSettings
        anchors.bottom: swipeView.bottom
        anchors.bottomMargin: -18
        anchors.right: swipeView.right
        anchors.rightMargin: -20
        contentItem: Image {
            id: settings
            source: "qrc:more.png"
            scale: 0.38
            opacity: 0.3
            fillMode: Image.PreserveAspectFit
            smooth: true
        }
        background: Rectangle {
            height: settings.height
            width: settings.width
            color: "transparent"
        }
        onClicked: {
            drawerSettings.open()
        }
    }

    Drawer {
        id: drawerSettings
        y: tabBar.contentHeight
        width: app.width * 0.6
        height: swipeView.height
        interactive: true
        edge: Qt.RightEdge
        visible: false

        background: Image {
            id: backgroundDrawer
            source: "qrc:drawerBackground.png"
//            rotation: 180
            scale: 1
            z: 0
        }

        contentItem: DrawerContent {
            id: content
//            onCloseDrawerChanged: {
//                if(closeDrawer) {
//                    drawerSettings.close()
//                    content.closeDrawer = false;
//                } else {
//                    drawerSettings.open()
//                    content.closeDrawer = true;
//                }
//            }
        }
    }

    Component.onCompleted: {
        swipeView.setCurrentIndex(1)
    }
}
