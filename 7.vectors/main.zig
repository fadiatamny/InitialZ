const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    defer {
        const deinit_status = gpa.deinit();
        if (deinit_status == .leak) {
            @panic("LEAKY MEMORY");
        }
    }
    var list = std.ArrayList(u32).init(allocator);
    defer list.deinit();

    try list.append(1);

    try list.appendNTimes(9, 2);

    const arr = [3]u32{ 3, 5, 6 };
    try list.appendSlice(arr[0..]);

    std.debug.print("list cap: {}\n", .{list.capacity});
    std.debug.print("list len: {}\n", .{list.items.len});

    list.items[0] = 10;

    std.debug.print("first {}\n", .{list.items[0]});

    for (list.items) |item| {
        std.debug.print("item {}\n", .{item});
    }
}
