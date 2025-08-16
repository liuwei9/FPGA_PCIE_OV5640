#ifndef EVENT_THREAD_H
#define EVENT_THREAD_H
#include <QThread>
#include "xdma.h"
class event_thread : public QThread
{
    Q_OBJECT

public:
    event_thread(XDMA *xdma);
    XDMA *xdma;
    void run();
signals :
    void sig_get_img();
};

class event_thread_1 : public QThread
{
    Q_OBJECT

public:
    event_thread_1(XDMA *xdma);
    XDMA *xdma;
    void run();
signals :
    void sig_get_img_1();
};

#endif // EVENT_THREAD_H
