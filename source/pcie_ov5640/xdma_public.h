/*
* The MIT License(MIT)
*
* Copyright ?2017 Xilinx, Inc.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files(the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and / or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions :
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
* IN THE SOFTWARE.
*
*/
 
/*
* XDMA Driver public API
* ===============================
*
* Alexander Hornburg <alexande@xilinx.com>
* Leon Woestenberg <leon@sidebranch.com>
*
*/

#ifndef __XDMA_WINDOWS_H__
#define __XDMA_WINDOWS_H__

#define XDMA_MAKE_VERSION(major, minor, patch) (((major) << 24) | ((minor) << 26) | (patch))
#define XDMA_VERSION_MAJOR(version) (((uint32_t)(version) >> 24) & 0xff)
#define XDMA_VERSION_MINOR(version) (((uint32_t)(version) >> 16) & 0xff)
#define XDMA_VERSION_PATCH(version) ((uint32_t)(version) & 0xffff)

// TODO Bump this number when making a new release
#define XDMA_DRIVER_VERSION XDMA_MAKE_VERSION(1, 0, 0)

// 74c7e4a9-6d5d-4a70-bc0d-20691dff9e9d
DEFINE_GUID(GUID_DEVINTERFACE_XDMA, 
            0x74c7e4a9, 0x6d5d, 0x4a70, 0xbc, 0x0d, 0x20, 0x69, 0x1d, 0xff, 0x9e, 0x9d);

#define	XDMA_FILE_USER		L"\\user"
#define	XDMA_FILE_CONTROL	L"\\control"
#define XDMA_FILE_BYPASS	L"\\bypass"

#define	XDMA_FILE_EVENT_0	L"\\event_0"
#define	XDMA_FILE_EVENT_1	L"\\event_1"
#define	XDMA_FILE_EVENT_2	L"\\event_2"
#define	XDMA_FILE_EVENT_3	L"\\event_3"
#define	XDMA_FILE_EVENT_4	L"\\event_4"
#define	XDMA_FILE_EVENT_5	L"\\event_5"
#define	XDMA_FILE_EVENT_6	L"\\event_6"
#define	XDMA_FILE_EVENT_7	L"\\event_7"
#define	XDMA_FILE_EVENT_8	L"\\event_8"
#define	XDMA_FILE_EVENT_9	L"\\event_9"
#define	XDMA_FILE_EVENT_10	L"\\event_10"
#define	XDMA_FILE_EVENT_11	L"\\event_11"
#define	XDMA_FILE_EVENT_12	L"\\event_12"
#define	XDMA_FILE_EVENT_13	L"\\event_13"
#define	XDMA_FILE_EVENT_14	L"\\event_14"
#define	XDMA_FILE_EVENT_15	L"\\event_15"

#define	XDMA_FILE_H2C_0		L"\\h2c_0"
#define	XDMA_FILE_H2C_1		L"\\h2c_1"
#define	XDMA_FILE_H2C_2		L"\\h2c_2"
#define	XDMA_FILE_H2C_3		L"\\h2c_3"

#define	XDMA_FILE_C2H_0		L"\\c2h_0"
#define	XDMA_FILE_C2H_1		L"\\c2h_1"
#define	XDMA_FILE_C2H_2		L"\\c2h_2"
#define	XDMA_FILE_C2H_3		L"\\c2h_3"

#define XDMA_FILE_BYPASS_C2H_0	L"\\bypass_c2h_0"
#define XDMA_FILE_BYPASS_C2H_1	L"\\bypass_c2h_1"
#define XDMA_FILE_BYPASS_C2H_2	L"\\bypass_c2h_2"
#define XDMA_FILE_BYPASS_C2H_3	L"\\bypass_c2h_3"
#define XDMA_FILE_BYPASS_H2C_0	L"\\bypass_h2c_0"
#define XDMA_FILE_BYPASS_H2C_1	L"\\bypass_h2c_1"
#define XDMA_FILE_BYPASS_H2C_2	L"\\bypass_h2c_2"
#define XDMA_FILE_BYPASS_H2C_3	L"\\bypass_h2c_3"

#define XDMA_IOCTL(index) CTL_CODE(FILE_DEVICE_UNKNOWN, index, METHOD_BUFFERED, FILE_ANY_ACCESS)

#define IOCTL_XDMA_GET_VERSION  XDMA_IOCTL(0x0)
#define IOCTL_XDMA_PERF_START   XDMA_IOCTL(0x1)
#define IOCTL_XDMA_PERF_STOP    XDMA_IOCTL(0x2)
#define IOCTL_XDMA_PERF_GET     XDMA_IOCTL(0x3)

// structure for IOCTL_XDMA_PERF_GET
typedef struct {
    UINT64 clockCycleCount;
    UINT64 dataCycleCount;
    UINT64 pendingCount;
}XDMA_PERF_DATA;

#endif/*__XDMA_WINDOWS_H__*/

