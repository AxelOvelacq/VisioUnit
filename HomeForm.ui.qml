import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    width: stackView.height
    height: stackView.width
    background: Rectangle{
        anchors.fill: stackView
        //color: "red"
    }

    title: qsTr("Home")

    Label {
        text: qsTr("You are on the home page.")
        anchors.centerIn: parent
    }
}
