QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    event_thread.cpp \
    main.cpp \
    mainwindow.cpp \
    xdma.cpp

HEADERS += \
    event_thread.h \
    mainwindow.h \
    xdma.h \
    xdma_public.h

FORMS += \
    mainwindow.ui

LIBS += -lSetupAPI

# 路径替换成自己的
INCLUDEPATH+= D:\OpenCV-MinGW-Build-OpenCV-4.5.5-x64\include\
              D:\OpenCV-MinGW-Build-OpenCV-4.5.5-x64\include\opencv\
              D:\OpenCV-MinGW-Build-OpenCV-4.5.5-x64\include\opencv2
LIBS+=D:/OpenCV-MinGW-Build-OpenCV-4.5.5-x64/x64/mingw/bin/libopencv_*.dll

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
