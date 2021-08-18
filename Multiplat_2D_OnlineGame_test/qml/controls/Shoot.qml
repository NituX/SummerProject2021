import QtQuick 2.0
import Felgo 3.0
import "../entities"
import ".."


Item {
    id: shoot

    property var character
    property var charImg
    property var world
    property var rotateStick
    property var shootTimer

    TwoAxisController {
        id: rotateController

        xAxis: rotateStick.controllerXPosition
        yAxis: rotateStick.controllerYPosition

        onXAxisChanged: {
            rotateWithStick();
        }

        onYAxisChanged: {
            rotateWithStick();
        }

    }

    function rotatePlayer(mX, mY) {
        var cv = character
        var mapped = mapToItem(gameWindowAnchorItem,cv.x,cv.y, cv.width, cv.height)
        var truex = mX - mapped.x;
        var truey = mapped.y - mY;
        var angle = Math.atan2(truex, truey);
        var strictangle = parseInt(angle * 180 / Math.PI);
        character.rotation = strictangle
    }

    function rotateWithStick() {
        var angle = Math.atan2(rotateController.xAxis, rotateController.yAxis);
        var strictangle = parseInt(angle * 180 / Math.PI);
        character.rotation = strictangle

        if(rotateController.xAxis != 0 || rotateController.yAxis != 0) {
            shootTimer.continousShoot = true;
        }

        else {
            shootTimer.continousShoot = false;
        }

    }
}
