#include "clocksetter.h"

ClockSetter::ClockSetter(QObject *parent) : QObject(parent)
{
    this->cset = new QProcess();

}

void ClockSetter::setTime(int hour, int minute, int second)
{
    QStringList args;
    args<<"+%T"<<"-s"<<QString("%1:%2:%3").arg(hour,2,10,QChar('0')).arg(minute,2,10,QChar('0')).arg(second,2,10,QChar('0'));
    cset->start("date",args);

}

void ClockSetter::setDate(int year, int mounth, int day)
{
    QStringList args;
    args<<"+%Y%m%d"<<"-s"<<QString("%1%2%3").arg(year,4,10,QChar('0')).arg(mounth,2,10,QChar('0')).arg(day,2,10,QChar('0'));
    cset->start("date",args);

}

bool ClockSetter::isAutoTimeSync()
{
    QStringList args;
    args<<"status";
    cset->start("timedatectl",args);
    cset->waitForFinished(1000);
    QString output = cset->readAll();
    int res = output.indexOf("NTP enabled: yes");
    if(res != -1)
    {
        return true;
    }
    return false;
}
