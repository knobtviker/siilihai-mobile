import QtQuick 1.0
import com.nokia.meego 1.0

Page {
    tools: commonTools
    anchors.fill: parent
    property int selectionMode: 0 // 0=nothing 1=url 2=list

    ListView {
        model: forumList
        anchors.fill: parent
        id: forumListView
        header: Column {
            spacing: 30
            Label {
                text: "Subscribe to a forum"
                wrapMode: Text.Wrap
                width: subscribeWizardPage.width
            }
            Button {
                text: "Enter URL"
                visible: selectionMode == 0
                onClicked: selectionMode = 1
            }
            Button {
                text: "Select from list"
                visible: selectionMode == 0
                onClicked: selectionMode = 2
            }
            TextInput {
                id: urlInput
                visible: selectionMode == 1
                font.pointSize: 30
                width: parent.width
                color: "black"
                text: "http://"
//                inputMask: "\http://XXX"
                Rectangle {
                    color: "white"
                    anchors.fill: parent
                    z: -10
                }
            }
            Button {
                text: "Continue"
                visible: selectionMode == 1
                onClicked: {
                    forumCredentialsPage.forumname = "Getting forum.."
                    forumCredentialsPage.forumid = 0
                    forumCredentialsPage.subscribeError = ""
                    appWindow.getForumUrlDetails(urlInput.text);
                }
            }
        }
        delegate: Column {
            visible: selectionMode == 2
            ButtonWithUnreadCount {
                label: alias
                width: subscribeWizardPage.width
                icon: faviconUrl
                onClicked:  {
                    forumCredentialsPage.forumname = alias
                    forumCredentialsPage.forumid = forumId
                    forumCredentialsPage.subscribeError = ""
                    appWindow.pageStack.push(forumCredentialsPage)
                    appWindow.getForumDetails(forumId)
                }
            }
        }
    }
}
