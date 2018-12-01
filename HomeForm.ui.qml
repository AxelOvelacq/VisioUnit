import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
//    width: window.width
//    height: window.height
    background: Rectangle {
        anchors.fill: parent
        color: "red"
    }

    title: qsTr("Home")

    Label {
        text: qsTr("You are on the home page.")
        anchors.centerIn: parent
    }
}
