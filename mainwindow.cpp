#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    setWindowFlags(Qt::FramelessWindowHint| Qt::WindowSystemMenuHint| Qt::WindowStaysOnTopHint);
    setAttribute(Qt::WA_TranslucentBackground, true);

//    setPalette(QPalette(QColor(0, 0, 0, 0)));
//    setAutoFillBackground(true);
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}
