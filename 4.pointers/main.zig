const std = @import("std");

pub fn main() !void {
    var x: u8 = 0;
    const y: *u8 = &x;

    y.* += 10;

    var arr = [4]u8{ 0, 1, 2, 3 };
    const w: [*]u8 = &arr;

    w[1] += 10;

    std.debug.print("x: {}\n", .{arr[1]});
}
