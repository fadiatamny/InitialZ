const std = @import("std");

pub fn main() !void {
    var x: u8 = 0;
    const y: *u8 = &x;

    y.* += 10;

    var arr = [4]u8{ 0, 1, 2, 3 };
    const w: [*]u8 = &arr;

    w[1] += 10;

    std.debug.print("x: {}\n", .{arr[1]});

    const array = [_]u8{ 1, 2, 3, 4, 5 };
    const slice = array[0..3];
    const slice2 = array[array.len - 1 ..];
    std.debug.print("sum: {}\n", .{total(slice)});
    std.debug.print("sum: {}\n", .{total(slice2)});

    const sum = totalRef(&arr, arr.len);
    std.debug.print("sum: {}\n", .{sum});

    arrayPtr(&arr);
}

fn total(values: []const u8) usize {
    var sum: usize = 0;
    for (values) |v| sum += v;
    return sum;
}

fn totalRef(arr: [*]const u8, len: usize) u16 {
    var sum: u16 = 0;
    var i: usize = 0;

    while (i < len) {
        sum += arr[i];
        i += 1;
    }
    return sum;
}

fn arrayPtr(arr: *const [4]u8) void {
    std.debug.print("arr[0]: {}\n", .{arr[0]});
}
