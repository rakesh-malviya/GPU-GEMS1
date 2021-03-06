#include <QResizeEvent>

#include "glframe.h"

QGLFrame::QGLFrame(QWidget *parent) :
    QGLWidget(parent),
    RenderThread(this)
{
    xRot = 0;
    yRot = 0;
    zRot = 0;
    setAutoBufferSwap(false);
    QTimer *myTimer = new QTimer;
    connect(myTimer,SIGNAL(timeout()),SLOT(animate()));
    myTimer->start(10);
}

QGLFrame::~QGLFrame()
{
}

void QGLFrame::initRenderThread(void)
{
    doneCurrent();
    RenderThread.start();
}

void QGLFrame::stopRenderThread(void)
{
    RenderThread.stop();
    RenderThread.wait();
}

void QGLFrame::resizeEvent(QResizeEvent *evt)
{
    RenderThread.resizeViewport(evt->size());
}

void QGLFrame::paintEvent(QPaintEvent *)
{    
    // Do nothing. Let the thread do the work
}

void QGLFrame::closeEvent(QCloseEvent *evt)
{
    stopRenderThread();
    QGLWidget::closeEvent(evt);
}




void QGLFrame::setXRotation(int angle)
 {

     if (angle != xRot) {
         xRot = angle;
         emit xRotationChanged(angle);
         RenderThread.xRot = xRot;
         RenderThread.paintGL();
     }
 }

 void QGLFrame::setYRotation(int angle)
 {

     if (angle != yRot) {
         yRot = angle;
         emit yRotationChanged(angle);
         RenderThread.yRot = yRot;
         RenderThread.paintGL();
     }
 }

 void QGLFrame::setZRotation(int angle)
 {

     if (angle != zRot) {
         zRot = angle;
         emit zRotationChanged(angle);
         RenderThread.zRot = zRot;
         RenderThread.paintGL();
     }

 }

 void QGLFrame::animate()
 {
    RenderThread.timerCount += 0.01;
    //updateGL();
 }
