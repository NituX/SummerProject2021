import QtQuick 2.0
import Felgo 3.0
import"../common"
import".."

EntityBase {
    id: player

    property alias character: character
    property alias characterWeapon: character.characterWeapon

    Character{
        id: character
        rotation: 0
    }
}

//EntityBase {
//    id: player
//    transformOrigin: Item.Center
//    entityId: "player"
//    entityType: "player"
//    width: playerImage.width
//    height: playerImage.height

//    property alias controller: twoAxisController
//    property alias rotateController: twoAxisControllerForRotate
//    property alias wpn: wpn
//    property alias shotVelocity: wpn.shotVelocity

//    Image {
//        id: playerImage
//        source: "../../assets/Kypara.png"
//        width: 30
//        height: 30
//    }

//    Weapon_AK {
//        id: wpn
//        //anchors.centerIn: player
//        //anchors.verticalCenterOffset: -10
//        //anchors.horizontalCenterOffset: 10
//        //x: player.x + 20
//        //y: player.y - 10
//        //rotation: player.rotation
//        transformOrigin: Item.Center
//        z:2
//    }

//    TwoAxisController {
//        id: twoAxisController
//    }

//    TwoAxisController {
//        id: twoAxisControllerForRotate
//    }


//    MovementAnimation {
//        target: player
//        property: "x"
//        running: true
//        //velocity: (parent.controller.xAxis)/(Math.sqrt(parent.controller.xAxis*parent.controller.xAxis+parent.controller.yAxis*parent.controller.yAxis))*100
//        velocity: (controller.xAxis)/(Math.sqrt(controller.xAxis*controller.xAxis+controller.yAxis*controller.yAxis))*200

//    }

//    MovementAnimation {
//        target: player
//        property: "y"
//        running: true
//        //velocity: (parent.controller.yAxis)/(Math.sqrt(parent.controller.xAxis*parent.controller.xAxis+parent.controller.yAxis*parent.controller.yAxis))*(-100)
//        velocity: (controller.yAxis)/(Math.sqrt(controller.xAxis*controller.xAxis+controller.yAxis*controller.yAxis))*(-200)
//    }

//    CircleCollider {
//        id: circleCollider
//        bodyType: Body.Dynamic
//        radius: 15
//        x: -radius
//        y: -radius
//        categories: Circle.Category1
//        collidesWith: Box.Category1
//        bullet: false
//        sleepingAllowed: false
//    }

//    function rotatePlayer(mX, mY) {
//        var cv = player.childrenRect
//        var mapped = player.mapToItem(gameWindowAnchorItem,cv.x,cv.y, cv.width, cv.height)
//        var truex = mX - (mapped.x+mapped.width/2);
//        var truey = (mapped.y+mapped.height/2) - mY;
//        var angle = Math.atan2(truex, truey);
//        var strictangle = parseInt(angle * 180 / Math.PI);
//        player.rotation = strictangle
//    }

//    function calcAngle(mX, mY) {
//        return -180 / Math.PI * Math.atan2(mX, mY)
//    }

//    function shoot() {
//        var speed = wpn.shotVelocity
//        var rotation = wpn.rotation


//        // calculate a bullet movement vector with the rotation and the speed
//        var xDirection = Math.cos(rotation * Math.PI / 180.0) * speed
//        var yDirection = Math.sin(rotation * Math.PI / 180.0) * speed

//        // calculate the bullet spawn point: start at the center of the tank translate it outside of the body towards the final direction
//        var startX = (16 * Math.cos((rotation) * Math.PI / 180)) + wpn.x + wpn.width / 2
//        var startY = (16 * Math.sin((rotation) * Math.PI / 180)) + wpn.y + wpn.height / 2


//        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../entities/Bullet.qml"), {
//                                                            "start" : Qt.point(startX, startY),
//                                                            "velocity" : Qt.point(xDirection, yDirection)})
//    }

//}
