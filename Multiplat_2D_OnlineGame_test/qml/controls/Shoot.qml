import QtQuick 2.0
import Felgo 3.0
import "../entities"
import ".."


Item {
    id: shoot

    property var character
    property var charImg
    property var world

    function rotatePlayer(mX, mY) {
        var cv = character
        var mapped = mapToItem(gameWindowAnchorItem,cv.x,cv.y, cv.width, cv.height)
//        var truex = mX - (mapped.x+mapped.width/2);
//        var truey = (mapped.y+mapped.height/2) - mY;
        var truex = mX - mapped.x;
        var truey = mapped.y - mY;
        var angle = Math.atan2(truex, truey);
        var strictangle = parseInt(angle * 180 / Math.PI);
        character.rotation = strictangle
    }


//    function shoot() {
////        console.log("shoot", charImg[0].x, charImg[0].y)
//        var start = mapToItem(world,charImg.x,charImg.y)
//        console.log("shoot", start.x, start.y)
//        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../entities/Bullet.qml"), {
//                                                            "x" : start.x,
//                                                            "y" : start.y,
//                                                            "rotation" : character.rotation-90})
//        var rotation = character.rotation - 90

//        // calculate a bullet movement vector with the rotation and the speed
//        var xDirection = Math.cos(rotation * Math.PI / 180.0) * speed
//        var yDirection = Math.sin(rotation * Math.PI / 180.0) * speed

//        //var offsetX = (Math.cos((rotation+90) * Math.PI / 180)) + 5
//        //var offsetY = (Math.sin((rotation+90) * Math.PI / 180)) + 5


////        if(offsetX < 0 && offsetY < 0) {
////            offsetX = character.x + (character.height / 2) - 5
////            offsetY = character.y + (character.height / 2)  - 5

////        }

////        else if (offsetX < 0 && offsetY >= 0){
////            offsetX = character.x + (character.height / 2) - 5
////            offsetY = character.y + (character.height / 2) + 5
////        }

////        else if( offsetX >= 0 && offsetY < 0) {
////            offsetX = character.x + (character.height / 2) + 5
////            offsetY = character.y + (character.height / 2) - 5
////        }

////        else {
////            offsetX = character.x + (character.height / 2) + 5
////            offsetY = character.y + (character.height / 2) + 5
////        }

//        // calculate the bullet spawn point: start at the center of the tank translate it outside of the body towards the final direction
//        var startX = (20*Math.cos((rotation) * Math.PI / 180)) + character.x// + offsetX// + character.x + character.width / 2
//        var startY = (20*Math.sin((rotation) * Math.PI / 180)) + character.y// + offsetY// + character.y + character.height / 2

//    }
}
