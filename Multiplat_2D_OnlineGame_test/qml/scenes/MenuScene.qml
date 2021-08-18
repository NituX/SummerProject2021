import QtQuick 2.0
import Felgo 3.0
import"../common"

BaseScene {
    id: menuScene

    signal selectWeaponPressed
    signal networkPressed
    signal settingsPressed
    signal matchmakingPressed

    Rectangle {
        anchors.fill: menuScene
        color: "#47688e"
    }

    Text {
        anchors.horizontalCenter: menuScene.horizontalCenter
        y: 30
        font.pixelSize: 30
        color: "#e9e9e9"
        text: "Menu Scene"
    }

    // menu
    Column {
        anchors.centerIn: menuScene
        spacing: 10

        MenuButton {
            text: "Play"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                selectWeaponPressed()
            }
        }

        MenuButton {
            text: "Settings"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                settingsPressed()
            }
        }


        MenuButton {
            text: "Quit"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                backButtonPressed()
            }
        }
    }
}
