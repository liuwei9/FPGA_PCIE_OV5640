#include "xdma.h"
#include <strsafe.h>
XDMA::XDMA(int bufferSize)
{
    this->bufferSize = bufferSize;
    openDevice();

}

XDMA::~XDMA()
{

}

void XDMA::openDevice()
{

    char device_path[MAX_PATH + 1] = "";
    char device_base_path[MAX_PATH + 1] = "";
    wchar_t device_path_w[MAX_PATH + 1];
    DWORD num_devices = getDevice(GUID_DEVINTERFACE_XDMA, device_base_path, sizeof(device_base_path));
    if (num_devices < 1)
    {
        std::cout << "没有发现XDMA设备" << std::endl;
        exit;
    }
    strcpy_s(device_path, device_base_path);
    strcat_s(device_path, "\\c2h_0");
    mbstowcs(device_path_w, device_path, sizeof(device_path));
    c2h0_device = CreateFile(device_path_w, GENERIC_READ, 0, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
    if (c2h0_device == INVALID_HANDLE_VALUE)
    {
        std::cout << "无法打开c2h" << " " << GetLastError() << std::endl;
        exit;
    }
    memset(device_path, 0, sizeof(device_path));
    strcpy_s(device_path, device_base_path);
    strcat_s(device_path, "\\h2c_0");
    mbstowcs(device_path_w, device_path, sizeof(device_path));
    h2c0_device = CreateFile(device_path_w, GENERIC_WRITE, 0, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
    if (h2c0_device == INVALID_HANDLE_VALUE)
    {
        std::cout << "无法打开h2c" << " " << GetLastError() << std::endl;
        exit;
    }

    memset(device_path, 0, sizeof(device_path));
    strcpy_s(device_path, device_base_path);
    strcat_s(device_path, "\\user");
    mbstowcs(device_path_w, device_path, sizeof(device_path));
    user_device = CreateFile(device_path_w, GENERIC_READ | GENERIC_WRITE, 0, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
    if (user_device == INVALID_HANDLE_VALUE)
    {
        std::cout << "无法打开user" << " " << GetLastError() << std::endl;
        exit;
    }

    memset(device_path, 0, sizeof(device_path));
    strcpy_s(device_path, device_base_path);
    strcat_s(device_path, "\\event_0");
    mbstowcs(device_path_w, device_path, sizeof(device_path));
    event0_device = CreateFile(device_path_w, GENERIC_READ, 0, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
    if (event0_device == INVALID_HANDLE_VALUE)
    {
        std::cout << "无法打开irq0" << " " << GetLastError() << std::endl;
        exit;
    }

    memset(device_path, 0, sizeof(device_path));
    strcpy_s(device_path, device_base_path);
    strcat_s(device_path, "\\event_1");
    mbstowcs(device_path_w, device_path, sizeof(device_path));
    event1_device = CreateFile(device_path_w, GENERIC_READ, 0, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
    if (event1_device == INVALID_HANDLE_VALUE)
    {
        std::cout << "无法打开irq1" << " " << GetLastError() << std::endl;
        exit;
    }

    memset(device_path, 0, sizeof(device_path));
    strcpy_s(device_path, device_base_path);
    strcat_s(device_path, "\\event_2");
    mbstowcs(device_path_w, device_path, sizeof(device_path));
    event2_device = CreateFile(device_path_w, GENERIC_READ, 0, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
    if (event2_device == INVALID_HANDLE_VALUE)
    {
        std::cout << "无法打开irq2" << " " << GetLastError() << std::endl;
        exit;
    }

}

int XDMA::getDevice(GUID guid, char* devpath, size_t len_devpath) {

    SP_DEVICE_INTERFACE_DATA device_interface;
    PSP_DEVICE_INTERFACE_DETAIL_DATA dev_detail;
    DWORD index;
    HDEVINFO device_info;
    wchar_t tmp[256];
    device_info = SetupDiGetClassDevs((LPGUID)&guid, NULL, NULL, DIGCF_PRESENT | DIGCF_DEVICEINTERFACE);
    if (device_info == INVALID_HANDLE_VALUE) {
        fprintf(stderr, "GetDevices INVALID_HANDLE_VALUE\n");
        exit(-1);
    }

    device_interface.cbSize = sizeof(SP_DEVICE_INTERFACE_DATA);
    // enumerate through devices

    for (index = 0; SetupDiEnumDeviceInterfaces(device_info, NULL, &guid, index, &device_interface); ++index) {

        // get required buffer size
        ULONG detailLength = 0;
        if (!SetupDiGetDeviceInterfaceDetail(device_info, &device_interface, NULL, 0, &detailLength, NULL) && GetLastError() != ERROR_INSUFFICIENT_BUFFER) {
            fprintf(stderr, "SetupDiGetDeviceInterfaceDetail - get length failed\n");
            break;
        }

        // allocate space for device interface detail
        dev_detail = (PSP_DEVICE_INTERFACE_DETAIL_DATA)HeapAlloc(GetProcessHeap(), HEAP_ZERO_MEMORY, detailLength);
        if (!dev_detail) {
            fprintf(stderr, "HeapAlloc failed\n");
            break;
        }
        dev_detail->cbSize = sizeof(SP_DEVICE_INTERFACE_DETAIL_DATA);

        // get device interface detail
        if (!SetupDiGetDeviceInterfaceDetail(device_info, &device_interface, dev_detail, detailLength, NULL, NULL)) {
            fprintf(stderr, "SetupDiGetDeviceInterfaceDetail - get detail failed\n");
            HeapFree(GetProcessHeap(), 0, dev_detail);
            break;
        }

        StringCchCopy(tmp, len_devpath, dev_detail->DevicePath);
        wcstombs(devpath, tmp, 256);
        HeapFree(GetProcessHeap(), 0, dev_detail);
    }

    SetupDiDestroyDeviceInfoList(device_info);
    return index;
}

bool XDMA::writeData(LONGLONG addr, BYTE* data, unsigned int len) {

    DWORD wr_size = 0;
    unsigned int transfers;
    unsigned int i;
    LARGE_INTEGER liDistanceToMove;
    liDistanceToMove.QuadPart = addr;
    transfers = (unsigned int)(len / bufferSize);
    //printf("transfers = %d\n",transfers);
    if (INVALID_SET_FILE_POINTER == SetFilePointerEx(h2c0_device, liDistanceToMove, NULL, FILE_BEGIN)) {
        fprintf(stderr, "Error setting file pointer, win32 error code: %ld\n", GetLastError());
        return false;
    }
    for (i = 0; i < transfers; i++)
    {
        if (!WriteFile(h2c0_device, (void*)(data + i * bufferSize), bufferSize, &wr_size, NULL))
        {
            std::cout << GetLastError() << std::endl;
            return false;
        }
        if (wr_size != bufferSize)
        {
            return false;
        }
    }
    if (!WriteFile(h2c0_device, (void*)(data + i * bufferSize), (len - i * bufferSize), &wr_size, NULL))
    {
        return false;
    }
    if (wr_size != (len - i * bufferSize))
    {
        return false;
    }
    return true;
}

bool XDMA::readData(LONGLONG addr, BYTE* data, unsigned int len) {
    DWORD rd_size = 0;
    unsigned int transfers;
    unsigned int i;
    LARGE_INTEGER liDistanceToMove;
    liDistanceToMove.QuadPart = addr;
    transfers = (unsigned int)(len / bufferSize);

    //printf("transfers = %d\n",transfers);
    if (INVALID_SET_FILE_POINTER == SetFilePointerEx(c2h0_device, liDistanceToMove, NULL, FILE_BEGIN)) {
        fprintf(stderr, "Error setting file pointer, win32 error code: %ld\n", GetLastError());
        return false;
    }
    for (i = 0; i < transfers; i++)
    {
        if (!ReadFile(c2h0_device, (void*)(data + i * bufferSize), bufferSize, &rd_size, NULL))
        {
            return false;
        }
        if (rd_size != bufferSize)
        {
            return false;
        }
    }
    if (!ReadFile(c2h0_device, (void*)(data + i * bufferSize), (DWORD)(len - i * bufferSize), &rd_size, NULL))
    {
        return false;
    }
    if (rd_size != (len - i * bufferSize))
    {
        return false;
    }
    return true;
}

bool XDMA::writeUser(LONGLONG addr, uint32_t *data) {
    DWORD wr_size = 0;
    if (INVALID_SET_FILE_POINTER == SetFilePointer(user_device, addr, NULL, FILE_BEGIN)) {
        fprintf(stderr, "Error setting file pointer, win32 error code: %ld\n", GetLastError());
        return false;
    }

    if (!WriteFile(user_device, (void*)(data), 4, &wr_size, NULL))
    {
        return false;
    }
    if (wr_size != 4)
    {
        return false;
    }

    return true;
}

bool XDMA::readUser(LONGLONG addr, uint32_t* data) {
    DWORD wr_size = 0;
    if (INVALID_SET_FILE_POINTER == SetFilePointer(user_device, addr, NULL, FILE_BEGIN)) {
        fprintf(stderr, "Error setting file pointer, win32 error code: %ld\n", GetLastError());
        return false;
    }

    if (!ReadFile(user_device, (void*)(data), 4, &wr_size, NULL))
    {
        return false;
    }
    if (wr_size != 4)
    {
        return false;
    }

    return true;
}

bool XDMA::irq0(void) {

    unsigned int data = 0;

    DWORD wr_size = 0;
    if (INVALID_SET_FILE_POINTER == SetFilePointer(event0_device, 0, NULL, FILE_BEGIN)) {
        fprintf(stderr, "Error setting file pointer, win32 error code: %ld\n", GetLastError());
        return false;
    }
    while (true) {
        ReadFile(event0_device, (void*)(&data), 1, &wr_size, NULL);
        // std::cout << data << std::endl;
        if (0 != data) {
            break;
        }
    }


    return true;
}

bool XDMA::irq1(void) {

    unsigned int data = 0;

    DWORD wr_size = 0;
    if (INVALID_SET_FILE_POINTER == SetFilePointer(event1_device, 0, NULL, FILE_BEGIN)) {
        fprintf(stderr, "Error setting file pointer, win32 error code: %ld\n", GetLastError());
        return false;
    }
    while (true) {
        ReadFile(event1_device, (void*)(&data), 1, &wr_size, NULL);
        // std::cout << data << std::endl;
        if (0 != data) {
            break;
        }
    }


    return true;
}

bool XDMA::irq2(void) {

    unsigned int data = 0;

    DWORD wr_size = 0;
    if (INVALID_SET_FILE_POINTER == SetFilePointer(event2_device, 0, NULL, FILE_BEGIN)) {
        fprintf(stderr, "Error setting file pointer, win32 error code: %ld\n", GetLastError());
        return false;
    }
    while (true) {
        ReadFile(event2_device, (void*)(&data), 1, &wr_size, NULL);
        // std::cout << data << std::endl;
        if (0 != data) {
            break;
        }
    }


    return true;
}

