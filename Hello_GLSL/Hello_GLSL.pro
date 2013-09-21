#-------------------------------------------------
#
# Project created by QtCreator 2011-05-01T10:34:43
#
#-------------------------------------------------

QT       += core gui opengl

TARGET = Hello_GLSL
TEMPLATE = app
LIBS += -lfreeglut
CONFIG += console
SOURCES += main.cpp\
        mainwindow.cpp \
    glrenderthread.cpp \
    glframe.cpp
INCLUDEPATH +=D:\boost_1_53_0
HEADERS  += mainwindow.h \
    glframe.h \
    glrenderthread.h

FORMS    += mainwindow.ui

OTHER_FILES += \
    Basic.vsh \
    Basic.fsh
