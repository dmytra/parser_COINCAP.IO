#ifndef SQLLITEDATABASE_H
#define SQLLITEDATABASE_H

#include <QSqlDatabase>
#include <QSqlDriver>
#include <QSqlError>
#include <QSqlQuery>

#include <QObject>
#include <QDebug>

class SqlLiteDatabase : public QObject
{
    Q_OBJECT
public:
    explicit SqlLiteDatabase (QObject* parent = 0);

    void    databaseConnect();
    void    databaseInit();
    void    databasePopulate(QStringList);

    QStringList  allDBdata;

    Q_INVOKABLE QString searchMaxDatatime(QString mInputText,QString mInputText2 )
    {
       QSqlQuery query;

//select * from APICOINCAPIO where DATETIME in(SELECT MAX(DATETIME) FROM APICOINCAPIO
//https://stackoverflow.com/questions/55998740/mysql-query-with-limit-in-descending-order-doesnt-works
//https://itproger.com/ua/course/sql/5
//https://stackoverflow.com/questions/11381674/sql-selecting-all-rows-with-maximum-value

       if (mInputText == "nid")
            query.prepare("SELECT nid FROM APICOINCAPIO WHERE rank = :num ORDER BY DATETIME  DESC");
       if (mInputText == "rank")
            query.prepare("SELECT rank FROM APICOINCAPIO WHERE rank = :num ORDER BY DATETIME  DESC");
       if (mInputText == "symbol")
            query.prepare("SELECT symbol FROM APICOINCAPIO WHERE rank = :num ORDER BY DATETIME  DESC");
       if (mInputText == "name")
            query.prepare("SELECT name FROM APICOINCAPIO WHERE rank = :num ORDER BY DATETIME  DESC");
       if (mInputText == "supply")
            query.prepare("SELECT supply FROM APICOINCAPIO WHERE rank = :num ORDER BY DATETIME  DESC");
       if (mInputText == "maxSupply")
            query.prepare("SELECT maxSupply FROM APICOINCAPIO WHERE rank = :num ORDER BY DATETIME  DESC");
       if (mInputText == "maxSupply")
            query.prepare("SELECT maxSupply FROM APICOINCAPIO WHERE rank = :num ORDER BY DATETIME  DESC");
       if (mInputText == "volumeUsd24Hr")
            query.prepare("SELECT volumeUsd24Hr FROM APICOINCAPIO WHERE rank = :num ORDER BY DATETIME  DESC");
       if (mInputText == "priceUsd")
            query.prepare("SELECT priceUsd FROM APICOINCAPIO WHERE rank = :num ORDER BY DATETIME  DESC");
       if (mInputText == "changePercent24Hr")
            query.prepare("SELECT changePercent24Hr FROM APICOINCAPIO WHERE rank = :num ORDER BY DATETIME  DESC");
       if (mInputText == "vwap24Hr")
            query.prepare("SELECT vwap24Hr FROM APICOINCAPIO WHERE rank = :num ORDER BY DATETIME  DESC");
       if (mInputText == "explorer")
            query.prepare("SELECT explorer FROM APICOINCAPIO WHERE rank = :num ORDER BY DATETIME  DESC");
       if (mInputText == "DATETIME")
            query.prepare("SELECT MAX(DATETIME) FROM APICOINCAPIO WHERE rank = :num ORDER BY DATETIME  DESC   ");

        //query.bindValue(":id",  mInputText);
        query.bindValue(":num", mInputText2);

       if(!query.exec())
            qWarning() << "MainWindow::OnSearchClicked - ERROR: " << query.lastError().text();

        //qWarning() << mInputText << " " << mInputText2<< " ";

        if(query.first())
            return QString(query.value(0).toString());
        else
            return QString(" #### data not found ### ");
    }

    Q_INVOKABLE QString searchMinDatatime(QString mInputText,QString mInputText2 )
    {
        QSqlQuery query;

        //select * from APICOINCAPIO where DATETIME in(SELECT MAX(DATETIME) FROM APICOINCAPIO
        //https://stackoverflow.com/questions/55998740/mysql-query-with-limit-in-descending-order-doesnt-works
        //https://itproger.com/ua/course/sql/5
        //https://stackoverflow.com/questions/11381674/sql-selecting-all-rows-with-maximum-value

        if (mInputText == "nid")
            query.prepare("SELECT nid FROM APICOINCAPIO WHERE rank = :num ORDER BY DATETIME  ASC");
        if (mInputText == "rank")
            query.prepare("SELECT rank FROM APICOINCAPIO WHERE rank = :num ORDER BY DATETIME  ASC");
        if (mInputText == "symbol")
            query.prepare("SELECT symbol FROM APICOINCAPIO WHERE rank = :num ORDER BY DATETIME  ASC");
        if (mInputText == "name")
            query.prepare("SELECT name FROM APICOINCAPIO WHERE rank = :num ORDER BY DATETIME  ASC");
        if (mInputText == "supply")
            query.prepare("SELECT supply FROM APICOINCAPIO WHERE rank = :num ORDER BY DATETIME  ASC");
        if (mInputText == "maxSupply")
            query.prepare("SELECT maxSupply FROM APICOINCAPIO WHERE rank = :num ORDER BY DATETIME  ASC");
        if (mInputText == "maxSupply")
            query.prepare("SELECT maxSupply FROM APICOINCAPIO WHERE rank = :num ORDER BY DATETIME  ASC");
        if (mInputText == "volumeUsd24Hr")
            query.prepare("SELECT volumeUsd24Hr FROM APICOINCAPIO WHERE rank = :num ORDER BY DATETIME  ASC");
        if (mInputText == "priceUsd")
            query.prepare("SELECT priceUsd FROM APICOINCAPIO WHERE rank = :num ORDER BY DATETIME  ASC");
        if (mInputText == "changePercent24Hr")
            query.prepare("SELECT changePercent24Hr FROM APICOINCAPIO WHERE rank = :num ORDER BY DATETIME  ASC");
        if (mInputText == "vwap24Hr")
            query.prepare("SELECT vwap24Hr FROM APICOINCAPIO WHERE rank = :num ORDER BY DATETIME  ASC");
        if (mInputText == "explorer")
            query.prepare("SELECT explorer FROM APICOINCAPIO WHERE rank = :num ORDER BY DATETIME  ASC");
        if (mInputText == "DATETIME")
            query.prepare("SELECT MIN(DATETIME) FROM APICOINCAPIO WHERE rank = :num ORDER BY DATETIME  ASC");

        //query.bindValue(":id",  mInputText);
        query.bindValue(":num", mInputText2);

        if(!query.exec())
            qWarning() << "MainWindow::OnSearchClicked - ERROR: " << query.lastError().text();

        //qWarning() << mInputText << " " << mInputText2<< " ";

        if(query.first())
            return QString(query.value(0).toString());
        else
            return QString(" #### data not found ### ");
    }

    Q_INVOKABLE QString searchCountDatatime(QString mInputText)
    {
        QSqlQuery query;
        query.prepare("SELECT COUNT(DATETIME) FROM APICOINCAPIO WHERE rank = :num");
        query.bindValue(":num", mInputText);

        if(!query.exec())
            qWarning() << "MainWindow::OnSearchClicked - ERROR: " << query.lastError().text();

        if(query.first())
            return QString(query.value(0).toString());
        else
            return QString(" #### data not found ### ");
    }


    Q_INVOKABLE QString searchIndexDatatime(QString mInputText,QString mInputText2, QString mInputText3 )
    {
        QSqlQuery query;

       if (mInputText == "nid")
            query.prepare("SELECT nid FROM APICOINCAPIO WHERE rank = :num limit :id,1");
        if (mInputText == "rank")
            query.prepare("SELECT rank FROM APICOINCAPIO WHERE rank = :num limit :id,1");
        if (mInputText == "symbol")
            query.prepare("SELECT symbol FROM APICOINCAPIO WHERE rank = :num limit :id,1");
        if (mInputText == "name")
            query.prepare("SELECT name FROM APICOINCAPIO WHERE rank = :num limit :id,1");
        if (mInputText == "supply")
            query.prepare("SELECT supply FROM APICOINCAPIO WHERE rank = :num limit :id,1");
        if (mInputText == "maxSupply")
            query.prepare("SELECT maxSupply FROM APICOINCAPIO WHERE rank = :num limit :id,1");
        if (mInputText == "maxSupply")
            query.prepare("SELECT maxSupply FROM APICOINCAPIO WHERE rank = :num limit :id,1");
        if (mInputText == "volumeUsd24Hr")
            query.prepare("SELECT volumeUsd24Hr FROM APICOINCAPIO WHERE rank = :num limit :id,1");
        if (mInputText == "priceUsd")
            query.prepare("SELECT priceUsd FROM APICOINCAPIO WHERE rank = :num limit :id,1");
        if (mInputText == "changePercent24Hr")
            query.prepare("SELECT changePercent24Hr FROM APICOINCAPIO WHERE rank = :num limit :id,1");
        if (mInputText == "vwap24Hr")
            query.prepare("SELECT vwap24Hr FROM APICOINCAPIO WHERE rank = :num limit :id,1");
        if (mInputText == "explorer")
            query.prepare("SELECT explorer FROM APICOINCAPIO WHERE rank = :num limit :id,1");
        if (mInputText == "DATETIME")
            query.prepare("select DATETIME from APICOINCAPIO WHERE rank = :num limit :id,1");

        query.bindValue(":num", mInputText2 );
        query.bindValue(":id",  mInputText3 );

        if(!query.exec())
            qWarning() << "MainWindow::OnSearchClicked - ERROR: " << query.lastError().text();

       // qWarning() << mInputText << " " << mInputText2<< " ";

        if(query.first())
            return QString(query.value(0).toString());
        else
            return QString(" #### data not found ### ");
    }

// https://www.tutorialspoint.com/how-to-select-next-row-pagination-in-mysql
// select DATETIME from APICOINCAPIO WHERE rank = 1 order by DATETIME desc limit 1,1;
//  select DATETIME from APICOINCAPIO WHERE rank = :num limit :id,1;

};

#endif // SQLLITEDATABASE_H
