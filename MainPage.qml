import QtQuick 2.2

Rectangle
{
    anchors.fill: parent
    color: "#b1b1b1"

    property bool listOn: false

    Rectangle
    {
        width: parent.width
        height: parent.height * 0.1
        anchors.bottom: parent.bottom

        color: "gray"

        ListView
        {
            id: view
            width: parent.width * 0.65
            height: parent.height
            x: {(listOn) ? parent.width * 0.2 : -width * 1.5}
            orientation: ListView.Horizontal
            spacing: -view.width * 0.07

            Behavior on x
            {
                NumberAnimation {}
            }

            model: 9
            delegate: Image
            {
                width: view.width * 0.5
                height: view.height
                source: ((index == view.currentIndex) ? "Images/sheet_covered.png" : "Images/sheet.png")
                MouseArea
                {
                    anchors.fill: parent
                    onClicked:
                    {
                        view.currentIndex = index
                    }

                    Text
                    {
                        anchors.centerIn: parent
                        text: "Sheet " + index
                    }
                }
            }
        }


        Text
        {
            x: parent.width * 0.5 - width * 0.5
            y: {(!listOn) ? parent.height * 0.5 - height * 0.5 : parent.height}
            text: "Text Cell"
            font.pointSize: 30
            color: "white"

            Behavior on y
            {
                NumberAnimation {}
            }
        }

        Image
        {
            width: parent.width * 0.2
            height: parent.height
            source: {(listOn) ? "Images/left.png" : "Images/left_hovered.png"}

            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    listOn = !listOn
                }
            }
        }

        Image
        {
            width: parent.width * 0.15
            height: parent.height
            source: "Images/right.png"
            x: {(listOn) ? parent.width - width : parent.width}
            Behavior on x
            {
                NumberAnimation {}
            }
        }

    }

}