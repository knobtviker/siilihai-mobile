import QtQuick 1.0
Rectangle {
    id: message
    property string subject: "?"
    property string author: "?"
    property string messageBody: "xxx"
    property bool messageRead: false
    width: mainPage.width
    height: subjectLine.height + body.height + 40
    radius: 15
    smooth: true
    Text {
        id: subjectLine
        text: message.subject + " (" + message.author + ")"
        color: "white"
        width: message.width
        wrapMode: Text.WordWrap
    }
    Text {
        id: toolLine
        text: (messageRead?"Read":"Unread") + " by " + message.author
        color: "white"
        width: message.width
        font.pointSize: 8
        anchors.top: subjectLine.bottom
    }
    Text {
        id: body
        text: message.messageBody
        font.pointSize: 8
        color: "black"
        width: message.width
        anchors.top: toolLine.bottom
        wrapMode: Text.WordWrap
        z: 10
    }
    Rectangle {
        radius: 5
        smooth: true
        color: "white"
        width: message.width
        height: body.height
        anchors.top: body.top
    }

    gradient: Gradient {
        GradientStop {
            position: 0.0
            color: "#555555"
        }
        GradientStop {
            position: 0.2
            color: "#333333"
        }
        GradientStop {
            position: 0.8
            color: "#000000"
        }
        GradientStop {
            position: 1.0
            color: "#333333"
        }
    }
}