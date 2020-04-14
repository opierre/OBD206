import QtQuick 2.9
import QtQuick.Controls 2.2
import QtLocation 5.9
import QtPositioning 5.9

Item {
    id: navig

    property var coords

    PositionSource {
        id: src
        updateInterval: 10
        active: true

        Component.onCompleted: {
            src.preferredPositioningMethods =
                                PositionSource.SatellitePositioningMethods
            coords = src.position.coordinate;
            console.log("Coordinate:", coords.longitude, coords.latitude);
        }

        onValidChanged: {
            console.log("moved")}
    }

//    Image {
//           id: hereMarker
//           source: "qrc:placeholder.png"
//           scale: 0.5
//    }

    Plugin {
        id: mapboxPlugin
        name: "mapboxgl"
        PluginParameter {   name: "mapboxgl.access_token";
                            value: "" }
        PluginParameter {   name: "mapboxgl.mapping.additional_style_urls";
                            value: "" }
    }

    Map {
        id: mapP
        anchors.fill: parent
        plugin: mapboxPlugin
        center: QtPositioning.coordinate(46.1667,
                                         -1.15)
        zoomLevel: 14
        copyrightsVisible: false
        z: 0

//        MapQuickItem {
//             id: marker
//             sourceItem: hereMarker
//             coordinate {
//                 latitude: src.position.coordinate.latitude;
//                 longitude:  src.position.coordinate.longitude;
//             }
//        }
    }

//    MapWindow {
//        id: mapP

//        anchors.fill: parent

//        z: 0

//        traffic: bottomBar.traffic
//        night: bottomBar.night
//    }

    BottomBar {
        id: bottomBar

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        z: 1
    }
}
