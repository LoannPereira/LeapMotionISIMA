#include "mainwindow.h"
#include <QApplication>
#include <GL/glu.h>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    a.setApplicationName("test OpenGl");

    MainWindow w;
    w.setWindowTitle("test OpenGl");
    w.show();

    return a.exec();
}
