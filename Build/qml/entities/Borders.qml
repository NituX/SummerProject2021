import QtQuick 2.0
import Felgo 3.0


EntityBase{
    entityType: "border"
    id: border

    Rectangle {
        color: "black"
        anchors.fill: borderCollider
    }

    BoxCollider {
        id: borderCollider
        bodyType: Body.Static
        anchors.fill: parent
        categories: Box.Category1
    }
}
