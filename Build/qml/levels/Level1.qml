import QtQuick 2.0
import Felgo 3.0
import "../common" as Common
import "../entities"
import ".."

Common.LevelBase {
    id: level1
    levelName: "SandRock"
    width: 1200
    height: 1200

    Image {
        z: -2
        source: "../../assets/SandRock.png"
        anchors.fill: level1
    }

    Borders {
        width: 1
        height: level1.height
        anchors.left: level1.left
    }
    Borders {
        width: 1
        height: level1.height
        anchors.right: level1.right
    }
    Borders {
        width: level1.width
        height: 1
        anchors.top: level1.top
    }
    Borders {
        width: level1.width
        height: 1
        anchors.bottom: level1.bottom
    }

    Wall {
        x: 150
        y: 150
    }

    Wall {
        x: 300
        y: 200
    }

    Wall {
        x: 1000
        y: 300
    }

    Wall {
        x: 100
        y: 400
        rotation: 50
    }
}
