#include "mainwindow.h"
#include <QJsonArray>

MainWindow::MainWindow()
{
    timerId = startTimer(5000);

    sqlLiteDB.databaseConnect();
    sqlLiteDB.databaseInit();
}

void MainWindow::timerEvent(QTimerEvent *event)
{
    apirest.setAptRequest("https://api.coincap.io/v2/assets");
    if(apirest.onResult())
    {
        QJsonObject jsonObj = apirest.JsonData();

        QJsonArray dataObject = jsonObj["data"].toArray();

        qDebug() << dataObject.size();

        qDebug() << QString::number(jsonObj["timestamp"].toInteger());

        QString timestamp = "";

        QString nid = "";
        QString rank = "";
        QString symbol = "";
        QString name = "";
        QString supply = "";
        QString maxSupply = "";
        QString marketCapUsd = "";
        QString volumeUsd24Hr = "";
        QString priceUsd = "";
        QString changePercent24Hr = "";
        QString vwap24Hr = "";
        QString explorer = "";

        QStringList allDBdata;

        if(QString::number(jsonObj["timestamp"].toInteger())!=nullptr) timestamp = QString::number(jsonObj["timestamp"].toInteger());

        for(int i = 0; i<dataObject.size(); i++)
        {
            QJsonObject obj = dataObject[i].toObject();

            qDebug() << obj["id"].toString();

            if(obj["id"].toString()!=nullptr) nid = obj["id"].toString();
            if(obj["rank"].toString()!=nullptr) rank = obj["rank"].toString();
            if(obj["symbol"].toString()!=nullptr) symbol = obj["symbol"].toString();
            if(obj["name"].toString()!=nullptr) name = obj["name"].toString();
            if(obj["supply"].toString()!=nullptr) supply = obj["supply"].toString();
            if(obj["maxSupply"].toString()!=nullptr) maxSupply = obj["maxSupply"].toString();
            if(obj["marketCapUsd"].toString()!=nullptr) marketCapUsd = obj["marketCapUsd"].toString();
            if(obj["volumeUsd24Hr"].toString()!=nullptr) volumeUsd24Hr = obj["volumeUsd24Hr"].toString();
            if(obj["priceUsd"].toString()!=nullptr) priceUsd = obj["priceUsd"].toString();
            if(obj["changePercent24Hr"].toString()!=nullptr) changePercent24Hr = obj["changePercent24Hr"].toString();
            if(obj["vwap24Hr"].toString()!=nullptr) vwap24Hr = obj["vwap24Hr"].toString();
            if(obj["explorer"].toString()!=nullptr) explorer = obj["explorer"].toString();

            allDBdata = { nid, rank, symbol, name, supply, maxSupply, marketCapUsd, volumeUsd24Hr, priceUsd, changePercent24Hr, vwap24Hr, explorer, timestamp};
            sqlLiteDB.databasePopulate(allDBdata);
        }
    }
}


