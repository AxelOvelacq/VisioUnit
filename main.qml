import QtQuick 2.11
import QtQuick.Controls 2.2

ApplicationWindow {
    id: window
    visible: true
    width: 1920
    height: 1080
    title: qsTr("Visio Unit - v1.0")

    header: StatusBar{}

    Drawer {
        id: drawer
        width: window.width * 200/1920 // header.height //window.width * idStatusBar.contentHeight/1920
        height: window.height-header.height
        y: header.height
        background: Rectangle{
            color: "#3d414d"
            anchors.fill: parent
        }

        ItemDelegate {
            id: idMenuButtonMenuBar
            width: parent.width
            height: width
            anchors.top: parent.top
            background: Rectangle{
                anchors.fill: parent
                color: idMenuButtonMenuBar.hovered ? "#5a4e42" : "transparent"
            }

            Image {
                asynchronous: true
                id: idMenuButtonImageMenuBar
                source: "/MenuBar/images/MenuBar/Menu.png"
                fillMode: Image.PreserveAspectFit
                anchors.fill: parent
            }
            Text {
                color: "#ff9500"
                text: qsTr("Menu")
                font.capitalization: Font.SmallCaps
                font.bold: true
                font.pointSize: 28
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: idMenuButtonImageMenuBar.bottom
                anchors.topMargin: -40
            }
            onClicked: {
                stackView.push("Page1Form.ui.qml")
                drawer.close()
            }
        }
        ItemDelegate {
            id: idRunStopButtonMenuBar
            width: parent.width
            height: width
            anchors.bottom: parent.bottom
            background: Rectangle{
                anchors.fill: parent
                color: idRunStopButtonMenuBar.hovered ? "#5a4e42" : "transparent"
            }
            Image {
                asynchronous: true
                id: idRunStopButtonImageMenuBar
                source: "/MenuBar/images/MenuBar/Run.png"
                fillMode: Image.PreserveAspectFit
                anchors.fill: parent
            }
            Text {
                color: "#ff9500"
                text: qsTr("Run")
                font.capitalization: Font.SmallCaps
                font.bold: true
                font.pointSize: 28
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: idRunStopButtonImageMenuBar.bottom
                anchors.topMargin: -40
            }
            onClicked: {
                stackView.push("Page2Form.ui.qml")
                drawer.close()
            }
        }
    }

    StackView {
        id: stackView
        initialItem: "HomeForm.ui.qml"
        anchors.fill: parent
    }
}
