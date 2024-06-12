const std = @import("std");

pub fn fibb(n: u32) u32 {
    if (n == 0 or n == 1) {
        return n;
    }

    return fibb(n - 1) + fibb(n - 2);
}

pub fn main() !void {
    const a: i32 = 1;
    var b: u32 = 2;
    b = 5;

    // const undef = undefined;

    std.debug.print("a: {}, b: {}\n", .{ a, b });

    const arr = [_]u8{ 1, 2, 3 };
    std.debug.print("arr length: {}\n", .{arr.len});

    const isEven = if (2 % 2 == 0) true else false;
    std.debug.print("isEven: {}\n", .{isEven});

    var count: u8 = 0;
    while (count < 5) : (count += 1) {
        std.debug.print("count: {}\n", .{count});
    }

    for (0..4) |i| {
        std.debug.print("i: {}", .{i});
    }

    // std.debug.print("\n", .{});

    const out = std.io.getStdOut();
    try out.writeAll("\n");

    for (arr) |ai| {
        std.debug.print("a: {}", .{ai});
    }
}
