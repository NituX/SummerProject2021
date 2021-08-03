import QtQuick 2.0
import Felgo 3.0
import "../common" as Common

EntityBase {
    entityId: "wall1"
    entityType: "box"
    width: 100
    height: 20

    Image {
        anchors.fill: parent
        source: "../../assets/wall-1.png"
    }
    
    BoxCollider {
        anchors.fill: parent
        bodyType: Body.Static
        categories: Box.Category1
        collidesWith: Circle.Category1 | Box.Category2
        sleepingAllowed: false
    }
}
