const std = @import("std");
const windows = std.os.windows;

pub extern "user32" fn MessageBoxA(
    hWnd: ?windows.HWND,
    lpText: [*:0]const u8,
    lpCaption: [*:0]const u8,
    uType: u32,
) callconv(.winapi) i32;

pub export fn NtAlertThreadByThreadId(ThreadId: windows.HANDLE) callconv(.winapi) windows.NTSTATUS {
    _ = ThreadId;
    _ = MessageBoxA(null, "NtAlertThreadByThreadId not implemented", "zig windows7", 0);
    @panic("NtAlertThreadByThreadId not implemented");
}

pub export fn NtSetInformationVirtualMemory(
    ProcessHandle: windows.HANDLE,
    VmInformationClass: windows.PVOID, // no matching type in std.os.windows
    NumberOfEntries: windows.SIZE_T,
    VirtualAddresses: windows.PVOID, // no matching type in std.os.windows
    VmInformation: windows.PVOID,
    VmInformationLength: windows.ULONG,
) callconv(.winapi) windows.NTSTATUS {
    _ = .{ ProcessHandle, VmInformationClass, NumberOfEntries, VirtualAddresses, VmInformation, VmInformationLength };
    _ = MessageBoxA(null, "NtSetInformationVirtualMemory not implemented", "zig windows7", 0);
    @panic("NtSetInformationVirtualMemory not implemented");
}

pub export fn NtWaitForAlertByThreadId(Address: windows.PVOID, Timeout: *windows.LARGE_INTEGER) callconv(.winapi) windows.NTSTATUS {
    _ = .{ Address, Timeout };
    _ = MessageBoxA(null, "NtWaitForAlertByThreadId not implemented", "zig windows7", 0);
    @panic("NtWaitForAlertByThreadId not implemented");
}

pub export fn RtlGetSystemTimePrecise() windows.LONGLONG {
    _ = MessageBoxA(null, "RtlGetSystemTimePrecise not implemented", "zig windows7", 0);
    @panic("RtlGetSystemTimePrecise not implemented");
}
