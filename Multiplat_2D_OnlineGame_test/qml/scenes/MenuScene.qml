import QtQuick 2.0
import Felgo 3.0
import"../common"

BaseScene {
    id: menuScene

    signal selectWeaponPressed
    signal networkPressed
    signal settingsPressed
    signal matchmakingPressed

    // background
    Rectangle {
        anchors.fill: parent.gameWindowAnchorItem
        color: "#47688e"
    }

    // the "logo"
    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 30
        font.pixelSize: 30
        color: "#e9e9e9"
        text: "Menu Scene"
    }

    // menu
    Column {
        anchors.centerIn: parent
        spacing: 10

        // TODO replace the buttons with your custom styled buttons
        MenuButton {
            text: "Play"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                // TODO load your levelselection scene here or start the game
                selectWeaponPressed()
            }
        }

        MenuButton {
            text: "Settings"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                // TODO load your settings scene here
                settingsPressed()
            }
        }

        MenuButton {
            text: "Network"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                networkPressed()
            }
        }

        MenuButton {
            text: "Multiplayer"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                matchmakingPressed()
            }
        }

    }
}
