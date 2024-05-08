#include "sqllitedatabase.h"

#include "apirest.h"
#include <QStandardPaths>

SqlLiteDatabase::SqlLiteDatabase(QObject *parent) : QObject(parent)
{

}

// TODO: Make this a static function of class Database.
void SqlLiteDatabase::databaseConnect()
{
    const QString DRIVER("QSQLITE");

    if(QSqlDatabase::isDriverAvailable(DRIVER))
    {
        QSqlDatabase db = QSqlDatabase::addDatabase(DRIVER);

        //https://stackoverflow.com/questions/52337354/how-to-write-files-to-an-android-device-using-qt
        QString path = QStandardPaths::writableLocation(QStandardPaths::DownloadLocation);
        db.setDatabaseName(path+"/"+"APICOINCAPIO.db");

        //db.setDatabaseName("APICOINCAPIO.db"); //(":memory:");

        if(!db.open())
            qWarning() << "MainWindow::DatabaseConnect - ERROR: " << db.lastError().text();
    }
    else
            qWarning() << "MainWindow::DatabaseConnect - ERROR: no driver " << DRIVER << " available";

}


// TODO: Make this a static function of class Database.
void SqlLiteDatabase::databaseInit()
{
    QSqlQuery query;
    if(!query.exec("CREATE TABLE APICOINCAPIO ("
                    "ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
                    "nid                 TEXT    NOT NULL,"
                    "rank               TEXT    NOT NULL,"
                    "symbol             TEXT    NOT NULL,"
                    "name               TEXT    NOT NULL,"
                    "supply             TEXT    NOT NULL,"
                    "maxSupply          TEXT    NOT NULL,"
                    "marketCapUsd       TEXT    NOT NULL,"
                    "volumeUsd24Hr      TEXT    NOT NULL,"
                    "priceUsd           TEXT    NOT NULL,"
                    "changePercent24Hr  TEXT    NOT NULL,"
                    "vwap24Hr           TEXT    NOT NULL,"
                    "explorer           TEXT    NOT NULL,"
                    "DATETIME           TEXT    NOT NULL"
                    ")")){
        qDebug()<<query.lastError().text();
    }
}

// TODO: Make this a static function of class Database.
void SqlLiteDatabase::databasePopulate(QStringList allDBdata)
{
    QSqlQuery query;

    QString nid = allDBdata.at(0);
    QString rank = allDBdata.at(1);
    QString symbol = allDBdata.at(2);
    QString name = allDBdata.at(3);
    QString supply = allDBdata.at(4);
    QString maxSupply = allDBdata.at(5);
    QString marketCapUsd = allDBdata.at(6);
    QString volumeUsd24Hr = allDBdata.at(7);
    QString priceUsd = allDBdata.at(8);
    QString changePercent24Hr = allDBdata.at(9);
    QString vwap24Hr = allDBdata.at(10);
    QString explorer = allDBdata.at(11);
    QString timestamp = allDBdata.at(12);

        query.prepare("insert into APICOINCAPIO(nid, rank, symbol, name, supply, maxSupply, marketCapUsd, volumeUsd24Hr, "
                      "priceUsd, changePercent24Hr, vwap24Hr, explorer,DATETIME) "
                      "values(:nid, :rank, :symbol, :name, :supply, :maxSupply, :marketCapUsd, :volumeUsd24Hr, "
                      ":priceUsd, :changePercent24Hr, :vwap24Hr, :explorer, :datetime)");
        query.bindValue(":nid", nid);
        query.bindValue(":rank",  rank);
        query.bindValue(":symbol", symbol);
        query.bindValue(":name", name);
        query.bindValue(":supply", supply);
        query.bindValue(":maxSupply", maxSupply);
        query.bindValue(":marketCapUsd", marketCapUsd);
        query.bindValue(":volumeUsd24Hr",  volumeUsd24Hr);
        query.bindValue(":priceUsd", priceUsd);
        query.bindValue(":changePercent24Hr", changePercent24Hr);
        query.bindValue(":vwap24Hr", vwap24Hr);
        query.bindValue(":explorer", explorer);
        query.bindValue(":datetime", timestamp);
        if(!query.exec()){
            qDebug()<<query.lastError().text();
        }

}
