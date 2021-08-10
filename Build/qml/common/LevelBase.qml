import QtQuick 2.0
import Felgo 3.0
import ".."
import "../entities"
import "../controls"

Item {
    id: levelBase

    property alias player: player
    property alias character: player.character
    property alias moveWithKeys: movement.movementController
    //property alias weapon: weapon
    property string levelName
    property int enemyCount: GameSettings.enemyCount

    Item {
        id: gameWindowAnchorItem
        x: gameScene.gameWindowAnchorItem.x
        y: gameScene.gameWindowAnchorItem.y
        width: gameScene.gameWindowAnchorItem.width
        height: gameScene.gameWindowAnchorItem.height
    }


    Player {
        z: 2
        id: player
        entityType: "player"
        character.entityId: "character"
        character.originX: 100
        character.originY: 100
        character.rotation: 90
        //        x: 100
        //        y: 100
    }

    Movement {
        id: movement
        player: player
        character: player.character
    }

    Shoot {
        id: shoot
        player: player
        character: player.character
        //weapon: player.characterWeapon
    }

    MouseArea {
        id: gameMA
        anchors.fill: levelBase
        //propagateComposedEvents: true
        hoverEnabled: true
        onClicked: shoot.shoot()

        onPositionChanged: {
            //console.log("mouse position changed", mouse.x, mouse.y);
            //console.log(gameScene.calculatePlayerRotation(mouse.x, mouse.y))
            //            gameScene.rotatePlayer(mouse.x, mouse.y)
            //            mouse.accepted = false;
            //player.rotatePlayer(mouse.x, mouse.y)
            shoot.rotatePlayer(mouse.x, mouse.y)
        }
    }

    Timer {
        id: enemyCreationTimer
        interval: 5000
        running: true
        repeat: true

        onTriggered: {
            if (GameSettings.enemyCount <= 5) {

                var newEntityProperties = {
                    x: Math.random()*(levelBase.width-100)+50,
                    y: Math.random()*(levelBase.height-100)+50
                }

            entityManager.createEntityFromUrlWithProperties(
                Qt.resolvedUrl("../entities/Enemy.qml"),
                newEntityProperties);

                GameSettings.enemyCount ++;
            }
        }
    }

}