import QtQuick 2.0
import Felgo 3.0
import "../common"
import ".."

EntityBase {
    entityId: "enemy"
    entityType: "customEntity"
    id: enemyOrkki

    //    x: originX
    //    y: originY
    width: 30
    height: 30
    rotation: getRandomCoords()

    transformOrigin: Item.TopLeft


    property double originX
    property double originY
    property int hitPoints: GameSettings.enemyLife
    property bool playerInSight: false
    property int areaWidth: GameSettings.areaWidth
    property int areaHeight: GameSettings.areaHeight
    property int speed: GameSettings.enemyMaxSpeed
    property point velocity



    Image {
        id: orkki
        width: 30
        height: 30
        anchors.fill: circleCollider
        source: "../../assets/Orkki.png"
    }

    Text {
        id: hp
        anchors.centerIn: circleCollider
        text: parent.hitPoints
    }

    CircleCollider {
        id: circleCollider
        bodyType: Body.Dynamic
        radius: enemyOrkki.width/2
        x: -radius
        y: -radius
        //categories: Circle.Category2
        collidesWith: Box.Category1 | Circle.Category1
        sleepingAllowed: false
    }

    MovementAnimation {
        target: enemyOrkki
        property: "x"
        running: true
        velocity: enemyOrkki.velocity.x //(Math.cos((enemyOrkki.rotation-90) * Math.PI / 180.0) * speed)
    }

    MovementAnimation {
        target: enemyOrkki
        property: "y"
        running: true
        velocity: enemyOrkki.velocity.y //(Math.sin((enemyOrkki.rotation-90) * Math.PI / 180.0) * speed)
    }

    Timer {
        id: enemyMovementTimer
        interval: 2000 + (Math.random()*1000)
        running: true
        repeat: true
        onTriggered: getRandomCoords()

    }

    function getHit(dmg) {
        if(hitPoints - dmg <= 0) {
            enemyOrkki.destroy()
            GameSettings.enemyCount --
        }

        else {
            hitPoints = hitPoints - dmg
            console.log(hitPoints)
            hp.text = hitPoints
        }
    }

    function getRandomCoords () {
        //            var xDest = Math.random() * levelBase.width
        //            var yDest = Math.random() * levelBase.height
        var Dest = Qt.point(Math.random() * areaWidth, Math.random() * areaHeight)

        var trueX = Dest.x - enemyOrkki.x
        var trueY = enemyOrkki.y - Dest.y
        var angle = Math.atan2(trueX, trueY)
        var strictAngle = parseInt(angle * 180 / Math.PI);

        var rotation = enemyOrkki.rotation-90

        var xDirection = Math.cos(rotation * Math.PI / 180.0) * speed
        var yDirection = Math.sin(rotation * Math.PI / 180.0) * speed

        enemyOrkki.velocity = Qt.point(xDirection, yDirection)
        enemyOrkki.rotation = strictAngle
    }
}
