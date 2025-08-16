#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    this->setWindowTitle("FPGA开源工坊——Wa");
    this->imgHigh = 720;
    this->imgWidth = 1280;
    this->cam_addr_0 = 0x00000000;
    this->cam_addr_1 = 0x10000000;
    img = new BYTE[this->imgHigh * this->imgWidth * 3];
    this->event0_thread = new event_thread(&xdma);
    this->event0_thread->start();
    connect(this->event0_thread, SIGNAL(sig_get_img()), this, SLOT(get_img()));

    this->event1_thread = new event_thread_1(&xdma);
    this->event1_thread->start();
    connect(this->event1_thread, SIGNAL(sig_get_img_1()), this, SLOT(get_img_1()));

    this->timer = new QTimer();
    // connect(this->timer, SIGNAL(timeout()), this, SLOT(timer_time_out()));
    this->collect_flag = false;
    this->start_flag = false;

    this->ui->showLabel->setGeometry(100, 100, this->imgWidth, this->imgHigh);

    this->xdma.writeUser(0x8, &this->cam_addr_0);
    this->xdma.writeUser(0xc, &this->cam_addr_1);

    this->setFixedSize(this->imgWidth + 200, this->imgHigh + 200);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_enCamBt_clicked()
{
    uint32_t data;
    if(this->start_flag){
        data = 0;
        ui->enCamBt->setText("开启摄像头");
    } else {
        data = 1;
        ui->enCamBt->setText("关闭摄像头");
    }
    this->xdma.writeUser(0x4, &data);
    this->start_flag = !this->start_flag;
}

void MainWindow::get_img()
{
    uint32_t wr_data = 1;
    this->xdma.writeUser(0x0, &wr_data);
    this->xdma.readData(this->cam_addr_0, this->img, this->imgHigh * this->imgWidth * 3);
    cv::Mat temp(this->imgHigh, this->imgWidth, CV_8UC3, this->img);
    cv::cvtColor(temp, temp, cv::COLOR_BGR2RGB);
    QImage disImage_1 = QImage((const unsigned char*)(temp.data), temp.cols, temp.rows, QImage::Format_RGB888);

    ui->showLabel->setPixmap(QPixmap::fromImage(disImage_1.scaled(ui->showLabel->size(), Qt::KeepAspectRatio)));  // label 显示图像
    this->event0_thread->start();
    // qDebug() << 0;
}

void MainWindow::get_img_1()
{
    uint32_t wr_data = 2;
    this->xdma.writeUser(0x0, &wr_data);
    this->xdma.readData(this->cam_addr_1, this->img, this->imgHigh * this->imgWidth * 3);
    cv::Mat temp(this->imgHigh, this->imgWidth, CV_8UC3, this->img);
    cv::cvtColor(temp, temp, cv::COLOR_BGR2RGB);
    QImage disImage_1 = QImage((const unsigned char*)(temp.data), temp.cols, temp.rows, QImage::Format_RGB888);

    ui->showLabel->setPixmap(QPixmap::fromImage(disImage_1.scaled(ui->showLabel->size(), Qt::KeepAspectRatio)));  // label 显示图像
    this->event1_thread->start();
    // qDebug() << 1;
}


