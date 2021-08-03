import QtQuick 2.0
import Felgo 3.0

EntityBase {
    entityId: "AK"
    entityType: "Weapon"
    id: wpn
    width: akBody.width
    height: akBody.height

    property alias akHead: akHead
    property alias akBody: akBody
    property int shotVelocity: 400

    Image {
        id: akBody
        width: 5
        height: 40
        source: "../../assets/AK-47.png"

    }

    Rectangle {
        id: akHead
        x: wpn.x + 2
        y: wpn.y
        z: 2
        width: 1
        height: 1
        transformOrigin: Item.Center
        color: "red"
        }
    }
