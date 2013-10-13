#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QtGui>
#include "glframe.h"
MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    GLFrame = new QGLFrame();      // create our subclassed GLWidget
    xSlider = createSlider();
    ySlider = createSlider();
    zSlider = createSlider();


         connect(xSlider, SIGNAL(valueChanged(int)), GLFrame, SLOT(setXRotation(int)));
         connect(GLFrame, SIGNAL(xRotationChanged(int)), xSlider, SLOT(setValue(int)));
         connect(ySlider, SIGNAL(valueChanged(int)), GLFrame, SLOT(setYRotation(int)));
         connect(GLFrame, SIGNAL(yRotationChanged(int)), ySlider, SLOT(setValue(int)));
         connect(zSlider, SIGNAL(valueChanged(int)), GLFrame, SLOT(setZRotation(int)));
         connect(GLFrame, SIGNAL(zRotationChanged(int)), zSlider, SLOT(setValue(int)));



    xSlider->setValue(0);
    ySlider->setValue(0);
    zSlider->setValue(0);

    QWidget *window = new QWidget();
    QHBoxLayout *mainLayout = new QHBoxLayout;
    mainLayout->addWidget(GLFrame);
    mainLayout->addWidget(xSlider);
    mainLayout->addWidget(ySlider);
    mainLayout->addWidget(zSlider);
    window->setLayout(mainLayout);
    setWindowTitle(tr("Chapter 1 Gerstner waves"));
    setCentralWidget(window);      // assign it to the central widget of the window
    GLFrame->initRenderThread();    // start rendering

}

MainWindow::~MainWindow()
{
    delete GLFrame;
    delete ui;
}

void MainWindow::closeEvent(QCloseEvent *evt)
{
    GLFrame->stopRenderThread();    // stop the thread befor exiting
    QMainWindow::closeEvent(evt);
}

QSlider *MainWindow::createSlider()
{
    QSlider *slider = new QSlider(Qt::Vertical);
    slider->setRange(0, 360);
    slider->setSingleStep(1);
    slider->setPageStep(15);
    slider->setTickInterval(15);
    slider->setTickPosition(QSlider::TicksRight);
    return slider;
}
