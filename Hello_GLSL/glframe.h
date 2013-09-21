#ifndef GLFRAME_H
#define GLFRAME_H

#include <QGLWidget>
#include <QTimer>
#include "glrenderthread.h"

class QGLFrame : public QGLWidget
{
    Q_OBJECT
public:
    explicit QGLFrame(QWidget *parent = 0);
    ~QGLFrame();
    void initRenderThread(void);
    void stopRenderThread(void);

signals:
    void xRotationChanged(int angle);
    void yRotationChanged(int angle);
    void zRotationChanged(int angle);

public slots:

   void setXRotation(int angle);
   void setYRotation(int angle);
   void setZRotation(int angle);

protected:
    void closeEvent(QCloseEvent *evt);
    void resizeEvent(QResizeEvent *evt);
    void paintEvent(QPaintEvent *);
    QGLRenderThread RenderThread;

private:
    int xRot;
    int yRot;
    int zRot;
    QBasicTimer timer;

private slots:
    void animate();
};

#endif // GLFRAME_H
