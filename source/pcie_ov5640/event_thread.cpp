#include "event_thread.h"
#include "QDebug"
event_thread::event_thread(XDMA *xdma) {
    this->xdma = xdma;
}

void event_thread::run()
{
    // while(true) {
        this->xdma->irq0();
        // uint32_t wr_data = 1;
        // this->xdma->writeUser(0, &wr_data);
            // qDebug() << "a";
        emit this->sig_get_img();
    // }

}

event_thread_1::event_thread_1(XDMA *xdma) {
    this->xdma = xdma;
}

void event_thread_1::run()
{
    // while(true) {
        this->xdma->irq1();
        // uint32_t wr_data = 2;
        // this->xdma->writeUser(0, &wr_data);
            // qDebug() << "a";
        emit this->sig_get_img_1();
    // }

}
