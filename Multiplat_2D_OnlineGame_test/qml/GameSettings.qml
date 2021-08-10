pragma Singleton
import QtQuick 2.0
import Felgo 3.0

QtObject {
    id: gameSettings

    //Movement Speeds
    property int playerMaxSpeed: 200
    property int enemyMaxSpeed: 100
    property int akBulletSpeed: 400
    property int monsterBulletSpeed: 300

    //Lifes
    property int playerLife: 100
    property int enemyLife: 50

    //gameArea
    property int areaWidth: 0
    property int areaHeight: 0

    //enemycount
    property int enemyCount: 0
}
