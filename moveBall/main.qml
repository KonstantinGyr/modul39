import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id:root
    width: 640
    height: 480
    visible: true
    Rectangle{
        id:field
        anchors.fill: parent
        state: "LeftState"
        Rectangle{
            id:leftRectangle
            x: 100
            y: 200
            color: "lightgrey"
            width: 100
            height: 100
            border.color: "black"
            border.width: 3
            radius: 5
            Text {
                id: nameLeftRect
                anchors.centerIn: parent
                text: "move"
            }
            //
            MouseArea{
                anchors.fill: parent
                onClicked:
                    if(ball.x+100 >= rightRectangle.x ){
                        field.state = "LeftState"
                    }
                    else{
                        ball.x += 30
                        field.state = "OtherState"
                    }
            }
        }
        Rectangle{
            id:rightRectangle
            x: 300
            y: 200
            color: "lightgrey"
            width: 100
            height: 100
            border.color: "black"
            border.width: 3
            radius: 5
            Text {
                id: nameRightRect
                anchors.centerIn: parent
                text: "return"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: field.state = "LeftState"
            }
        }

        Rectangle{
           id:ball
           color: "darkgreen"
           x: leftRectangle.x + 5
           y: leftRectangle.y + 5
           width: leftRectangle.width-10
           height: leftRectangle.height - 10
           radius: width / 2
        }
        states: [
            State {
                name: "OtherState"
                PropertyChanges {
                    target: ball
                    x: ball.x
                }
            },
            State {
                name: "LeftState"
                PropertyChanges {
                    target: ball
                    x: leftRectangle.x + 5
                }
            }
        ]
        transitions: [
            Transition {
                from: "OtherState"
                to: "LeftState"
                NumberAnimation {
                    easing.amplitude: 1.5
                    properties: "x,y"
                    duration: 1500
                    easing.type: Easing.InOutBounce
                }
            }
        ]
    }
}
