#ifndef CLOCKSETTER_H
#define CLOCKSETTER_H

#include <QObject>
#include <QProcess>

class ClockSetter : public QObject
{
    Q_OBJECT
    QProcess * cset = nullptr;
public:
    explicit ClockSetter(QObject *parent = nullptr);

signals:

public slots:
    void setTime(int hour,int minute,int second);
    void setDate(int year, int mounth,int day);
    bool isAutoTimeSync();
};

#endif // CLOCKSETTER_H
