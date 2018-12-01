import QtQuick 2.11
import QtQuick.Controls 2.2

/*
    COLORS
    ------
    Background status bar :     474c59
    Background menu button:     474c59
                    hovered:    62574c
    Background recipe list :    1f2126
                    hovered:    403220
    Background save button :    1f2126
                    hovered :   403220
*/

ToolBar {
    id: idStatusBar
    property int p_minHeight: 50
    contentHeight: window.height * 125/1080 > p_minHeight ? window.height * 125/1080 : p_minHeight
    background: Rectangle{
        id: idBackgroundStatusBar
        color: "#474C59"
    }

    ToolButton {
        id: idMenuButtonStatusBar
        height:parent.height
        width:height
        background: Rectangle{
            id: idBackgroundMenuButtonStatusBar
            color:  idMenuButtonStatusBar.hovered ? "#62574c" : "#474c59"
        }
        Image {
            asynchronous: true
            source: stackView.depth > 1 ? "/StatusBar/images/StatusBar/StatusBar_PrevPage.png" : "/StatusBar/images/StatusBar/StatusBar_OpenMenuBar.png"
            fillMode: Image.PreserveAspectFit
            height: parent.height
            width: parent.width
            anchors.centerIn: parent
        }
        MouseArea{
            id:idMouseAreaMenuButtonStatusBar
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                } else {
                    drawer.open()
                }
            }
        }
    }

    ComboBox{
        id: idRecipeListStatusBar
        anchors.left: idMenuButtonStatusBar.right
        anchors.leftMargin: 30
        anchors.verticalCenter: parent.verticalCenter
        height: idStatusBar.height/2
        width: idStatusBar.width/5

        //displayText: "Size: " + currentText
        model: ["Prg1 : Test", "Prg2 : Test test test", "Prg3 : Visio Unit VisioUnit"]

        delegate: ItemDelegate {
            width: idRecipeListStatusBar.width
            contentItem: Text {
                text: modelData
                color: "#FF9500"
                font: idRecipeListStatusBar.font
                elide: Text.ElideRight
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
            highlighted: idRecipeListStatusBar.highlightedIndex === index

        }
        indicator: Canvas {
            id: canvas
            x: idRecipeListStatusBar.width - width - idRecipeListStatusBar.rightPadding
            y: idRecipeListStatusBar.topPadding + (idRecipeListStatusBar.availableHeight - height) / 2
            width: height
            height: idRecipeListStatusBar.height/3
            contextType: "2d"

            Connections {
                target: idRecipeListStatusBar
                onPressedChanged: canvas.requestPaint()
            }

            onPaint: {
                context.reset();
                context.moveTo(0, 0);
                context.lineTo(width, 0);
                context.lineTo(width / 2, height);
                context.closePath();
                context.fillStyle = idRecipeListStatusBar.pressed ? "#CC7700" : "#ff9500";
                context.fill();
            }
        }

        contentItem: Text {
            text: idRecipeListStatusBar.displayText
            font: idRecipeListStatusBar.font
            color: idRecipeListStatusBar.pressed ? "#CC7700" : "#ff9500"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            leftPadding: idRecipeListStatusBar.height/2
            rightPadding: idRecipeListStatusBar.height/2
            elide: Text.ElideRight

        }

        background: Rectangle {
            id : idBackgroundRecipeListStatusBar
            color: idRecipeListStatusBar.hovered ? "#403220" : "#1f2126"
            implicitWidth: 120
            implicitHeight: 40
            border.color: "#ff9500"
            border.width: idRecipeListStatusBar.visualFocus ? 5 : 2
            radius: parent.height / 2
        }

        popup: Popup {
            y: idRecipeListStatusBar.height
            width: idRecipeListStatusBar.width
            //implicitHeight: idRecipeListStatusBar.count * contentItem.implicitHeight

            contentItem: ListView {
                clip: true
                implicitHeight: contentHeight
                model: idRecipeListStatusBar.popup.visible ? idRecipeListStatusBar.delegateModel : null
                currentIndex: idRecipeListStatusBar.highlightedIndex
                ScrollIndicator.vertical: ScrollIndicator { }
            }

            background: Rectangle {
                color: "#1f2126"
                border.color: "#ff9500"
                radius: 5
            }
        }
    }

    ToolButton{
        id: idSaveButtonStatusBar
        height: idRecipeListStatusBar.height
        width: height
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: idRecipeListStatusBar.right
        anchors.leftMargin: 30
        Image {
            id: save
            asynchronous: true
            source: "/StatusBar/images/StatusBar/StatusBar_Save.png"
            fillMode: Image.PreserveAspectFit
            height: parent.height
            width: parent.width
            anchors.centerIn: parent

        }
        background: Rectangle{
            anchors.fill: parent
            color: idSaveButtonStatusBar.hovered ? "#403220" : "#1f2126"
            radius: parent.height/2
        }

    }

    Image {
        id: idLogoStatusBar
        asynchronous: true
        source: "/StatusBar/images/StatusBar/StatusBar_Logo.png"
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 30
        fillMode: Image.PreserveAspectFit
        height: parent.height

    }
}
