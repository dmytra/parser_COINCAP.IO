import QtQml
import QtQuick 2.0
import QtQuick.Controls
import QtQuick.Window 2.15


import QtQuick.Layouts 1.3


import Finance2 1.0
import org.mydb 1.0

Rectangle {
    id:recMain
    width: parent.width
    height: parent.height

// ############ START prepare API data to array ##############

    property string timestamp1: ""
    property string timestamp2: ""
    property string timestamp3: ""
    property string timestamp4: ""
    property string timestamp5: ""
    property string timestamp6: ""
    property string timestamp7: ""
    property string timestamp8: ""
    property string timestamp9: ""
    property string timestamp10: ""
    property string timestamp11: ""
    property string timestamp12: ""

    property string timestampCorrent: ""

    property int timeIntStamp1: 0
    property int timeIntStamp2: 0
    property int timeIntStamp3: 0
    property int timeIntStamp4: 0
    property int timeIntStamp5: 0
    property int timeIntStamp6: 0
    property int timeIntStamp7: 0
    property int timeIntStamp8: 0
    property int timeIntStamp9: 0
    property int timeIntStamp10: 0
    property int timeIntStamp11: 0
    property int timeIntStamp12: 0
    property int timeIntStampAll: 0


    property variant timestamp: ["1","2","3","","","","","","","","",""]

    property int timestampInt: 0

    property string timestampTime: ""

// ############ FIN prepare API data to array ##############


    SqlLiteDatabase {
        id: mydb
    }


//// ############### START API ##################

//    ApiRest {
//        id: appBridge1
//    }

//    Connections {
//        target: appBridge1

//        function onDataChanged()
//        {
//            var n=98;
//            for (var i = 0; i <= n; ++i)
//            {
//            //                    console.log("button click event")
//            //                    mOutputText.text = mydb.search(mInputText.text)
//            //                }

//            //weather0.timestamp[0]

//            if (weather0.timestamp1!=null)      weather0.timestamp1   = appBridge1.JsonData.data[i].id;
//            if (weather0.timestamp2!=null)      weather0.timestamp2   = appBridge1.JsonData.data[i].rank;
//            if (weather0.timestamp3!=null)      weather0.timestamp3   = appBridge1.JsonData.data[i].symbol;
//            if (weather0.timestamp4!=null)      weather0.timestamp4   = appBridge1.JsonData.data[i].name;
//            if (weather0.timestamp5!=null)      weather0.timestamp5   = appBridge1.JsonData.data[i].supply;
//            if (weather0.timestamp6!=null)      weather0.timestamp6   = appBridge1.JsonData.data[i].maxSupply;
//            if (weather0.timestamp7!=null)      weather0.timestamp7   = appBridge1.JsonData.data[i].marketCapUsd;
//            if (weather0.timestamp8!=null)      weather0.timestamp8   = appBridge1.JsonData.data[i].volumeUsd24Hr;
//            if (weather0.timestamp9!=null)      weather0.timestamp9   = appBridge1.JsonData.data[i].priceUsd	;
//            if (weather0.timestamp10!=null)      weather0.timestamp10   = appBridge1.JsonData.data[i].changePercent24Hr;
//            if (weather0.timestamp11!=null)      weather0.timestamp11   = appBridge1.JsonData.data[i].vwap24Hr;
//            if (weather0.timestamp12!=null)      weather0.timestamp12   = appBridge1.JsonData.data[i].explorer;

//            if (weather0.timestampTime!=null)      weather0.timestampTime   = appBridge1.JsonData.timestamp;


//            timestamp[0] = weather0.timestamp1;
//            timestamp[1] = weather0.timestamp2;
//            timestamp[2] = weather0.timestamp3;
//            timestamp[3] = weather0.timestamp4;
//            timestamp[4] = weather0.timestamp5;
//            timestamp[5] = weather0.timestamp6;
//            timestamp[6] = weather0.timestamp7;
//            timestamp[7] = weather0.timestamp8;
//            timestamp[8] = weather0.timestamp9;
//            timestamp[9] = weather0.timestamp10;
//            timestamp[10] = weather0.timestamp11;
//            timestamp[11] = weather0.timestamp12;

//            //mydb.da .databasePopulate(timestamp1);

//            //console.log(timestamp[i][0]);
//            //console.log("i=",i);
//            }

//            if (timestampTime!=null) timestampTime   = appBridge1.JsonData.timestamp;
//        }
//    }

//    Rectangle {
//        Component.onCompleted: appBridge1.setAptRequest("https://api.coincap.io/v2/assets");
//    }

//// ####################### end API ##########


    SwipeView {
        id: view
        anchors.fill: parent
        currentIndex: 0

        Item {
            id: appBridgeItem1

            Rectangle {
                anchors.fill: parent

                MouseArea {
                    anchors.fill: parent
                    onClicked:   {
                        if (spinbox.value == 0) spinbox.value+=1;
                            timestamp[0] = mydb.searchMaxDatatime("nid", spinbox.value.toString());
                            timestamp[1] = mydb.searchMaxDatatime("rank", spinbox.value.toString());
                            timestamp[2] = mydb.searchMaxDatatime("symbol", spinbox.value.toString());
                            timestamp[3] = mydb.searchMaxDatatime("name", spinbox.value.toString());
                            timestamp[4] = mydb.searchMaxDatatime("supply", spinbox.value.toString());
                            timestamp[5] = mydb.searchMaxDatatime("maxSupply", spinbox.value.toString());
                            timestamp[6] = mydb.searchMaxDatatime("marketCapUsd", spinbox.value.toString());
                            timestamp[7] = mydb.searchMaxDatatime("volumeUsd24Hr", spinbox.value.toString());
                            timestamp[8] = mydb.searchMaxDatatime("priceUsd", spinbox.value.toString());
                            timestamp[9] = mydb.searchMaxDatatime("changePercent24Hr", spinbox.value.toString());
                            timestamp[10] = mydb.searchMaxDatatime("vwap24Hr", spinbox.value.toString());
                            timestamp[11] = mydb.searchMaxDatatime("explorer", spinbox.value.toString());
                            timestampTime = mydb.searchMaxDatatime("DATETIME", spinbox.value.toString());


                        weather0.timestamp1 = timestamp[0];
                        weather0.timestamp2 = timestamp[1];
                        weather0.timestamp3 = timestamp[2];
                        weather0.timestamp4 = timestamp[3];
                        weather0.timestamp5 = timestamp[4];
                        weather0.timestamp6 = timestamp[5];
                        weather0.timestamp7 = timestamp[6];
                        weather0.timestamp8 = timestamp[7];
                        weather0.timestamp9 = timestamp[8];
                        weather0.timestamp10 = timestamp[9];
                        weather0.timestamp11 = timestamp[10];
                        weather0.timestamp12 = timestamp[11];

                        spinbox.value = spinbox.value +1;
                        timestampInt = spinbox.value;
                    }
                }


                SpinBox {
                    id: spinbox
                    anchors.top: appBridgeItem1.bottom
                    from: 0
                    value: 0
                    to: 98
                    editable : true
                    stepSize: 1
                    font.pixelSize: 44

                    property int oldValue: 0

                    onValueChanged: {
                        if (value > oldValue)
                        {
                            //console.log("up")
                        }
                        else
                        {
                            //console.log("down")
                        }
                        oldValue = value
                        timestampInt = value;
                        //appBridge1.setAptRequest("https://api.coincap.io/v2/assets");
                    }

                }

//                SpinBox {
//                    id: spinbox2
//                    anchors.top: spinbox.bottom
//                    from: 0
//                    value: 0
//                    to: 98
//                    editable : true
//                    stepSize: 1
//                    font.pixelSize: 44

//                    property int oldValue: 0

//                    onValueChanged: {
//                        if (value > oldValue) { console.log("up") }
//                        else { console.log("down") }
//                        oldValue = value
//                    }

//                }


                Text {
                    id: nameTimestampTime
                    anchors.top: spinbox.bottom
                    text: "timestamp = " + timestampTime
                }



                Text {
                    id: appBridgeText1
                    anchors.top: nameTimestampTime.bottom
                    text: "id = " + timestamp1
                }

                Text {
                    id: appBridgeText2
                    anchors.top: appBridgeText1.bottom
                    text: "rank = " + timestamp2
                }

                Text {
                    id: appBridgeText3
                    anchors.top: appBridgeText2.bottom
                    text: "symbol = " + timestamp3
                }

                Text {
                    id: appBridgeText4
                    anchors.top: appBridgeText3.bottom
                    text: "name = " + timestamp4
                }

                Text {
                    id: appBridgeText5
                    anchors.top: appBridgeText4.bottom
                    text: "supply = " + timestamp5
                }

                Text {
                    id: appBridgeText6
                    anchors.top: appBridgeText5.bottom
                    text: "maxSupply = " + timestamp6
                }

                Text {
                    id: appBridgeText7
                    anchors.top: appBridgeText6.bottom
                    text: "marketCapUsd = " + timestamp7
                }

                Text {
                    id: appBridgeText8
                    anchors.top: appBridgeText7.bottom
                    text: "volumeUsd24Hr = " + timestamp8
                }

                Text {
                    id: appBridgeText9
                    anchors.top: appBridgeText8.bottom
                    text: "priceUsd = " + timestamp9
                }

                Text {
                    id: appBridgeText10
                    anchors.top: appBridgeText9.bottom
                    text: "changePercent24Hr = " + timestamp10
                }

                Text {
                    id: appBridgeText11
                    anchors.top: appBridgeText10.bottom
                    text: "vwap24Hr = " + timestamp11
                }

                Text {
                    id: appBridgeText12
                    anchors.top: appBridgeText11.bottom
                    text: "explorer = " + timestamp12
                }

                Text {
                    id: appBridgeTextCorrent
                    anchors.top: appBridgeText12.bottom
                    anchors.centerIn: parent.Center
                    font.bold: true
                    font.pixelSize: 12
                    text: "  Corrent USD: " + timestampCorrent
                }

                Button {
                    id: appBottonText13
                    text: "GET MAX DATA  api.coincap.io/v2/assets"
                    anchors.top: appBridgeTextCorrent.bottom
                    onClicked:   {
                    if (spinbox.value == 0) spinbox.value+=1;
                    timestamp[0] = mydb.searchMaxDatatime("nid", spinbox.value.toString());
                    timestamp[1] = mydb.searchMaxDatatime("rank", spinbox.value.toString());
                    timestamp[2] = mydb.searchMaxDatatime("symbol", spinbox.value.toString());
                    timestamp[3] = mydb.searchMaxDatatime("name", spinbox.value.toString());
                    timestamp[4] = mydb.searchMaxDatatime("supply", spinbox.value.toString());
                    timestamp[5] = mydb.searchMaxDatatime("maxSupply", spinbox.value.toString());
                    timestamp[6] = mydb.searchMaxDatatime("marketCapUsd", spinbox.value.toString());
                    timestamp[7] = mydb.searchMaxDatatime("volumeUsd24Hr", spinbox.value.toString());
                    timestamp[8] = mydb.searchMaxDatatime("priceUsd", spinbox.value.toString());
                    timestamp[9] = mydb.searchMaxDatatime("changePercent24Hr", spinbox.value.toString());
                    timestamp[10] = mydb.searchMaxDatatime("vwap24Hr", spinbox.value.toString());
                    timestamp[11] = mydb.searchMaxDatatime("explorer", spinbox.value.toString());
                    timestampTime = mydb.searchMaxDatatime("DATETIME", spinbox.value.toString());

                        weather0.timestamp1 = timestamp[0];
                        weather0.timestamp2 = timestamp[1];
                        weather0.timestamp3 = timestamp[2];
                        weather0.timestamp4 = timestamp[3];
                        weather0.timestamp5 = timestamp[4];
                        weather0.timestamp6 = timestamp[5];
                        weather0.timestamp7 = timestamp[6];
                        weather0.timestamp8 = timestamp[7];
                        weather0.timestamp9 = timestamp[8];
                        weather0.timestamp10 = timestamp[9];
                        weather0.timestamp11 = timestamp[10];
                        weather0.timestamp12 = timestamp[11];

                        spinbox.value = spinbox.value;
                        timestampInt = spinbox.value;
                    }
                }


//                Button {
//                    id: appBottonText16
//                    text: "GET minimal DATA  api.coincap.io/v2/assets"
//                    anchors.top: appBottonText13.bottom
//                    onClicked:   {
//                    if (spinbox.value == 0) spinbox.value+=1;
//                        timestamp[0] = mydb.searchMinDatatime("nid", spinbox.value.toString());
//                        timestamp[1] = mydb.searchMinDatatime("rank", spinbox.value.toString());
//                        timestamp[2] = mydb.searchMinDatatime("symbol", spinbox.value.toString());
//                        timestamp[3] = mydb.searchMinDatatime("name", spinbox.value.toString());
//                        timestamp[4] = mydb.searchMinDatatime("supply", spinbox.value.toString());
//                        timestamp[5] = mydb.searchMinDatatime("maxSupply", spinbox.value.toString());
//                        timestamp[6] = mydb.searchMinDatatime("marketCapUsd", spinbox.value.toString());
//                        timestamp[7] = mydb.searchMinDatatime("volumeUsd24Hr", spinbox.value.toString());
//                        timestamp[8] = mydb.searchMinDatatime("priceUsd", spinbox.value.toString());
//                        timestamp[9] = mydb.searchMinDatatime("changePercent24Hr", spinbox.value.toString());
//                        timestamp[10] = mydb.searchMinDatatime("vwap24Hr", spinbox.value.toString());
//                        timestamp[11] = mydb.searchMinDatatime("explorer", spinbox.value.toString());
//                        timestampTime = mydb.searchMinDatatime("DATETIME", spinbox.value.toString());

//                        weather0.timestamp1 = timestamp[0];
//                        weather0.timestamp2 = timestamp[1];
//                        weather0.timestamp3 = timestamp[2];
//                        weather0.timestamp4 = timestamp[3];
//                        weather0.timestamp5 = timestamp[4];
//                        weather0.timestamp6 = timestamp[5];
//                        weather0.timestamp7 = timestamp[6];
//                        weather0.timestamp8 = timestamp[7];
//                        weather0.timestamp9 = timestamp[8];
//                        weather0.timestamp10 = timestamp[9];
//                        weather0.timestamp11 = timestamp[10];
//                        weather0.timestamp12 = timestamp[11];
//                    }
//                }


//                Button {
//                    id: appBottonText17
//                    text: "GET minimal DATA  api.coincap.io/v2/assets"
//                    anchors.top: appBottonText13.bottom
//                    onClicked:   {
//                        if (spinbox.value == 0) spinbox.value+=1;
//                        timestamp[0] = mydb.searchIndexDatatime("nid", spinbox.value.toString(), spinbox2.value.toString());
//                        timestamp[1] = mydb.searchIndexDatatime("rank", spinbox.value.toString(), spinbox2.value.toString());
//                        timestamp[2] = mydb.searchIndexDatatime("symbol", spinbox.value.toString(), spinbox2.value.toString());
//                        timestamp[3] = mydb.searchIndexDatatime("name", spinbox.value.toString(), spinbox2.value.toString());
//                        timestamp[4] = mydb.searchIndexDatatime("supply", spinbox.value.toString(), spinbox2.value.toString());
//                        timestamp[5] = mydb.searchIndexDatatime("maxSupply", spinbox.value.toString(), spinbox2.value.toString());
//                        timestamp[6] = mydb.searchIndexDatatime("marketCapUsd", spinbox.value.toString(), spinbox2.value.toString());
//                        timestamp[7] = mydb.searchIndexDatatime("volumeUsd24Hr", spinbox.value.toString(), spinbox2.value.toString());
//                        timestamp[8] = mydb.searchIndexDatatime("priceUsd", spinbox.value.toString(), spinbox2.value.toString());
//                        timestamp[9] = mydb.searchIndexDatatime("changePercent24Hr", spinbox.value.toString(), spinbox2.value.toString());
//                        timestamp[10] = mydb.searchIndexDatatime("vwap24Hr", spinbox.value.toString(), spinbox2.value.toString());
//                        timestamp[11] = mydb.searchIndexDatatime("explorer", spinbox.value.toString(), spinbox2.value.toString());
//                        timestampTime = mydb.searchIndexDatatime("DATETIME", spinbox.value.toString(), spinbox2.value.toString());

//                        spinbox2.value++;
//                        weather0.timestamp1 = timestamp[0];
//                        weather0.timestamp2 = timestamp[1];
//                        weather0.timestamp3 = timestamp[2];
//                        weather0.timestamp4 = timestamp[3];
//                        weather0.timestamp5 = timestamp[4];
//                        weather0.timestamp6 = timestamp[5];
//                        weather0.timestamp7 = timestamp[6];
//                        weather0.timestamp8 = timestamp[7];
//                        weather0.timestamp9 = timestamp[8];
//                        weather0.timestamp10 = timestamp[9];
//                        weather0.timestamp11 = timestamp[10];
//                        weather0.timestamp12 = timestamp[11];
//                    }
//                }



                Rectangle {
                    anchors.top: appBottonText13.bottom
                    width: parent.width
                    y:550
                    height: parent.height-350
//                    width: app.width
//                    height: app.height
                    color: Qt.darker("white", 1.1)
                    radius: 10
                    border.width: 1
                    border.color: "#ccc"
                    Layout.row: 0
                    Layout.column: 1

                    Chart{
                        id: _line
                        anchors.fill: parent
                        anchors.margins: 2

                            property var dataA: [] //[65,59,90,81,56,55,40,11]
                            property var dataB: [] // [65,59,90,81,56,55,40,11]]
                            property string tmp: ""
                            property string tmp2: ""
                        property string tmp3: ""
                            property int numberCount: 0

                        onPaint: {
                            numberCount = mydb.searchCountDatatime(11);
                            for (let i = numberCount-40; i < numberCount; i++) {
                        // timestamp[0] = mydb.searchIndexDatatime("nid", spinbox.value.toString(), i);
                        // timestamp[1] = mydb.searchIndexDatatime("rank", spinbox.value.toString(), i);
                        // timestamp[2] = mydb.searchIndexDatatime("symbol", spinbox.value.toString(), i);
                        // timestamp[3] = mydb.searchIndexDatatime("name", spinbox.value.toString(), i);
                        // timestamp[4] = mydb.searchIndexDatatime("supply", spinbox.value.toString(), i);
                        // timestamp[5] = mydb.searchIndexDatatime("maxSupply", spinbox.value.toString(), i);
                        // timestamp[6] = mydb.searchIndexDatatime("marketCapUsd", spinbox.value.toString(), i);
                        // timestamp[7] = mydb.searchIndexDatatime("volumeUsd24Hr", 11.toString(), i);

                            tmp = mydb.searchMaxDatatime("priceUsd", spinbox.value.toString());
                            tmp2 =  mydb.searchIndexDatatime("priceUsd", spinbox.value.toString(), i);

                        // timestamp[9] = mydb.searchIndexDatatime("changePercent24Hr", spinbox.value.toString(), i);
                        // timestamp[10] = mydb.searchIndexDatatime("vwap24Hr", spinbox.value.toString(), i);
                        // timestamp[11] = mydb.searchIndexDatatime("explorer", spinbox.value.toString(), i);
                        // timeIntStampAll = mydb.searchIndexDatatime("DATETIME", spinbox.value.toString(), i);

                            dataA[i] = i;
                            dataB[i] = tmp - tmp2;
                            timestampCorrent = tmp2;
//                            console.log(tmp);
//                            console.log(dataB[i]);

                            }

                            line({
                                     labels : [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1 ],
                                     datasets : [
                                         {
                                             fillColor : "rgba(220,220,220,0.5)",
                                             strokeColor : "rgba(220,220,220,1)",
                                             pointColor : "rgba(220,220,220,1)",
                                             pointStrokeColor : "#fff",
                                             data : dataA
                                         },
                                         {
                                             fillColor : "rgba(151,187,205,0.5)",
                                             strokeColor : "rgba(151,187,205,1)",
                                             pointColor : "rgba(151,187,205,1)",
                                             pointStrokeColor : "#fff",
                                             data : dataB
                                         }
                                     ]
                                 });
                        }
                    }
                }





            Timer{
                id:t
                interval: 1000
                repeat: true
                running: true
                onTriggered:{
                    // Update the line chart
                    var x;
                    x = _line.dataA.shift();
                    _line.dataA.push(x)
                    x = _line.dataB.shift();
                    _line.dataB.push(x)
                    _line.requestPaint()
                }
            }


            }
        }


        Item {
            id: appBridgeItem2

            Rectangle {
                anchors.fill: parent

                Text {
                    id: appBridgeItem2Text1
                    anchors.top: parent.top
                    textFormat: Text.RichText
                    anchors.centerIn: parent.Center
                    text:  "<div>online database 100 coin DATA API<br>
                            <a href=https://api.coincap.io/v2/assets>https://api.coincap.io/v2/assets</a><br>
                            1 TASK: get data from API apirest.cpp<br>
                            2 TASK: write data to MySQL database SqlLiteDatabase.cpp<br>
                            3 TASK: prepare all MVC process in mainwindow.cpp<br>
                            4 TASK: view data in QML (prepare QML controller in main.cpp)<br>
                            5 TASL: view data in chart.js<br>
                            <a href=https://github.com/qyvlik/Chart.qml>https://github.com/qyvlik/Chart.qml</a><br>
                            </div>"
                }

                Text {
                    id: appBridgeItem2Text2
                    anchors.top: appBridgeItem2Text1.bottom
                    text: ""
                }
            }
        }

    }

        PageIndicator {
            id: pageIndicator

            height: 20

            count: view.count
            currentIndex: view.currentIndex

            anchors.bottom: view.bottom
            anchors.horizontalCenter: view.horizontalCenter

            background:    Rectangle {
                width: width
                height: height
                color: "white"
                border.color: "red"
                border.width: 0
                radius: 5
            }
        }


}
