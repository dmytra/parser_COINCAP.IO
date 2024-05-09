#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QObject>
#include "apirest.h"
#include "sqllitedatabase.h"
#include <QTimerEvent>

class ApiRest;
class SqlLiteDatabase;

class MainWindow : public QObject
{
    Q_OBJECT
public:
    MainWindow();
    int timerId;
    ApiRest apirest;
    SqlLiteDatabase sqlLiteDB;

protected:
    void timerEvent(QTimerEvent *event);
};

#endif // MAINWINDOW_H
