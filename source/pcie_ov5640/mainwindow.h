#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include "QFileDialog"
#include "xdma.h"
#include "event_thread.h"
#include <iostream>
#include <fstream>
#include <sstream>
#include <opencv2/opencv.hpp>
#include <opencv2/highgui.hpp>
#include <QTimer>
#include <chrono>
QT_BEGIN_NAMESPACE
namespace Ui {
class MainWindow;
}
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:
    void on_enCamBt_clicked();
    void get_img();
    void get_img_1();

private:
    Ui::MainWindow *ui;
    QString videoPath;
    XDMA xdma;
    event_thread *event0_thread;
    event_thread_1 *event1_thread;
    int imgHigh = 0;
    int imgWidth = 0;
    BYTE* img;
    uint32_t wr_data;
    uint32_t cam_addr_0;
    uint32_t cam_addr_1;
    QTimer *timer;
    bool collect_flag;
    bool start_flag;

};
#endif // MAINWINDOW_H
