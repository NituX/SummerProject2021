import QtQuick 2.0
import Felgo 3.0
import "../common" as Common
import "../entities"

Common.LevelBase {
    id: level2
    levelName: "Hell"
    width: 1200
    height: 1200

    Image {
        z: -2
        source: "../../assets/Hell.png"
        anchors.fill: level2
    }
}
