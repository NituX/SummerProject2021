import QtQuick 2.0
import Felgo 3.0
import "../common"
import ".."

EntityBase {
    entityId: "enemy"
    entityType: "enemy"
    id: enemyOrkki
    transformOrigin: Item.TopLeft

    property int hitPoints: GameSettings.enemyLife
    property int areaWidth: GameSettings.areaWidth
    property int areaHeight: GameSettings.areaHeight
    property var creator
    property var target
    property var world
    property var levelBase
    property real lastTime: 0

    MultiResolutionImage {
        id: orkki
        width: 30
        height: 30
        rotation: 90
        anchors.centerIn: parent
        source: "../../assets/Orkki.png"

        property list<Item> imagePoints: [
            // this imagePoint can be used for creation of the rocket
            // it must be far enough in front of the car that they don't collide upon creation
            // the +30 might have to be adapted if the size of the rocket is changed
            Item {x: orkki.width/2+20}
        ]
    }

    Text {
        id: hp
        anchors.centerIn: enemyOrkki
        font.pixelSize: 10
        text: parent.hitPoints
    }

    MoveToPointHelper {
        id: targetHelper
        targetObject: enemyOrkki.target
        rotationThreshold: 10
        stopForwardMovementAtDifferentDirections: true
        onDistanceToTargetChanged: {
            if(distanceToTarget < 200){
                shoot();
            }
        }
    }

    CircleCollider {
        id: circleCollider
        bodyType: Body.Dynamic
        radius: orkki.width/2
        body.fixedRotation: false
        density: 0.2
        x: -radius
        y: -radius
        categories: Circle.Category1
        collidesWith: Box.Category1 | Circle.Category1
        force: Qt.point(targetHelper.outputYAxis * GameSettings.enemyMaxSpeed * 32, 0)
        torque: targetHelper.outputXAxis*1500 * 32 * 32
        body.linearDamping: 10
        body.angularDamping: 15
    }

    //        onLinearVelocityChanged: {
    //            if(targetHelper.outputYAxis === 0){
    //                circleCollider.linearDamping = 10
    //            }
    //            else {
    //                circleCollider.linearDamping = 0
    //            }

    //            //        linearVelocity: Qt.point(targetHelper.outputYAxis * GameSettings.enemyMaxSpeed, targetHelper.outputXAxis*GameSettings.enemyMaxSpeed)
    //        }



    //    Timer {
    //        id: enemyMovementTimer
    //        interval: 500
    //        running: true
    //        repeat: true
    //        onTriggered: console.log(circleCollider.linearVelocity)
    //    }

    function shoot() {
        var curTime = new Date().getTime()
        var timeDiff = curTime - lastTime

        if (timeDiff > 700) {
            lastTime = curTime

            var start = mapToItem(world,orkki.imagePoints[0].x, orkki.imagePoints[0].y)
            console.log("MonsterShoot", start.x, start.y)
            entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../entities/MonsterBullet.qml"), {
                                                                "x" : start.x,
                                                                "y" : start.y,
                                                                "rotation" : enemyOrkki.rotation})
        }
    }

    function getHit(dmg) {
        if(hitPoints - dmg <= 0) {
            enemyOrkki.destroy()
            levelBase.score ++
            creator.enemyCount --
        }

        else {
            hitPoints = hitPoints - dmg
            console.log(hitPoints)
            //            hp.text = hitPoints
        }
    }

    //    function getRandomCoords () {
    //        //roamHelper.targetPoint =
    //        return Qt.point(Math.random() * areaWidth, Math.random() * areaHeight)
    //    }

    //    function calcEnemyMovement() {
    //        var Dest = Qt.point(Math.random() * areaWidth, Math.random() * areaHeight)

    //        var trueX = Dest.x - enemyOrkki.x
    //        var trueY = enemyOrkki.y - Dest.y
    //        var angle = Math.atan2(trueX, trueY)
    //        var strictAngle = parseInt(angle * 180 / Math.PI);

    //        var rotation = enemyOrkki.rotation-90

    //        var xDirection = Math.cos(rotation * Math.PI / 180.0) * speed
    //        var yDirection = Math.sin(rotation * Math.PI / 180.0) * speed

    //        enemyOrkki.velocity = Qt.point(xDirection, yDirection)
    //        enemyOrkki.rotation = strictAngle
    //    }
}
