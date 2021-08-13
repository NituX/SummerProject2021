import QtQuick 2.0
import Felgo 3.0
import ".."
import "../entities"
import "../controls"

Item {
    id: levelBase

    property alias character: character
    property alias moveWithKeys: movement.movementController //player.character.controller
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

    EntityManager {
        id: entityManager
        entityContainer: levelBase
    }

    PhysicsWorld {
        id: world
        running: true
        z: 0
        // these are performance settings to avoid boxes colliding too far together
        // set them as low as possible so it still looks good
        updatesPerSecondForPhysics: 60
        velocityIterations: 5
        positionIterations: 5
        // set this to true to see the debug draw of the physics system
        // this displays all bodies, joints and forces which is great for debugging
        debugDrawVisible: false

        onStepped: {
            movement.updateMovement()
            var vector = Qt.point(character.controller.xAxis*32*5, character.controller.yAxis*32*5)
            character.circleCollider.applyLinearImpulse(vector, character.circleCollider.body.getWorldCenter());
        }
    }


    Character {
        id: character
        x: 100
        y: 100
        world: world
    }

    Movement {
        id: movement
        character: character
    }

    Shoot {
        id: shoot
        character: character
        charImg: character.characterBodyImP
        world: world
    }

    MouseArea {
        id: gameMA
        anchors.fill: levelBase
        //propagateComposedEvents: true
        hoverEnabled: true
        onClicked: character.shoot()

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
        interval: 1000
        running: true
        repeat: true

        onTriggered: {
            if (GameSettings.enemyCount <= 5) {

                var newEntityProperties = {
                    x: Math.random()*(levelBase.width-100)+50,
                    y: Math.random()*(levelBase.height-100)+50,
                    "target": character,
                    "world": world
                }

            entityManager.createEntityFromUrlWithProperties(
                Qt.resolvedUrl("../entities/Enemy.qml"),
                newEntityProperties);

                GameSettings.enemyCount ++;
            }
        }
    }

}
