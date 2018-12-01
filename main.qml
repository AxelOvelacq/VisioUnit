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
        width: header.height //window.width * idStatusBar.contentHeight/1920
        height: window.height-header.height
        y: header.height

        Column {
            anchors.fill: parent

            ItemDelegate {
                text: qsTr("Page 1")
                width: parent.width
                onClicked: {
                    stackView.push("Page1Form.ui.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Page 2")
                width: parent.width
                onClicked: {
                    stackView.push("Page2Form.ui.qml")
                    drawer.close()
                }
            }
        }
    }

    StackView {
        id: stackView
        initialItem: "HomeForm.ui.qml"
        anchors.fill: parent
    }
}
