#ifndef XDMA_CPP
#define XDMA_CPP
#pragma once
#include <windows.h>
#include <SetupAPI.h>
#include <INITGUID.H>
#include <WinIoCtl.h>
#include "xdma_public.h"
#include <iostream>
#include "cstdlib"
#include "cstdio"
#include "string"

#include <QThread>




class XDMA
{
    friend class event_thread;
public:
    XDMA(int bufferSize = 32*1024*1024);
    ~XDMA();
    bool writeData(LONGLONG addr, BYTE* data, unsigned int len);
    bool readData(LONGLONG addr, BYTE* data, unsigned int len);

    bool writeUser(LONGLONG addr, uint32_t *data);
    bool readUser(LONGLONG addr, uint32_t *data);
    bool irq0(void);
    bool irq1(void);
    bool irq2(void);


private:
    int getDevice(GUID guid, char* devpath, size_t len_devpath);
    int bufferSize;
    void openDevice();
    HANDLE c2h0_device;
    HANDLE h2c0_device;
    HANDLE user_device;
    HANDLE event0_device;
    HANDLE event1_device;
    HANDLE event2_device;

};

#endif // !XDMA_CPP

