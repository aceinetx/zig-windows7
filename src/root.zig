const std = @import("std");
const stubs = @import("stubs.zig");

pub fn main(init: std.process.Init) !void {
    // std.log.info("Hello, World!", .{}); // doesn't work for some reason
    _ = stubs.MessageBoxA(null, "Hello, World!", "zig windows7", 0);

    const s = init.gpa.printSentinel("{} + {} = {}", .{ 34, 35, 34 + 35 }, 0) catch "Allocation failed";
    defer init.gpa.free(s);

    _ = stubs.MessageBoxA(null, s, "zig windows7", 0);
}
