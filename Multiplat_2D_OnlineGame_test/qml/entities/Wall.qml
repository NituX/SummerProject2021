import QtQuick 2.0
import Felgo 3.0
import "../common" as Common

EntityBase {
    id: wall
    entityType: "obstacle"
    transformOrigin: Item.TopLeft
    width: 100
    height: 40

    Image {
        anchors.fill: boxCollider
        source: "../../assets/wall-1.png"
    }

    BoxCollider {
        id: boxCollider
        x: -width/2
        y: -height/2
        bodyType: Body.Static
        categories: Box.Category1
    }
}
