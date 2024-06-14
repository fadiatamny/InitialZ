const std = @import("std");

pub fn main() !void {
    const cwd = std.fs.cwd();

    var file: ?std.fs.File = OPEN_FORCE: {
        const file: ?std.fs.File = cwd.openFile("./test.txt", .{ .mode = .read_write }) catch |err| {
            switch (err) {
                std.fs.File.OpenError.FileNotFound => {
                    std.debug.print("FileNotFound: {}\n", .{err});
                },
                else => {
                    std.debug.panic("Error: {}\n", .{err});
                },
            }

            break :OPEN_FORCE null;
        };

        break :OPEN_FORCE file;
    };

    if (file == null) {
        file = try cwd.createFile("./test.txt", .{ .read = true });
    }

    defer file.?.close();

    try file.?.writeAll("Hello, world!\n");
    var buffer: [100]u8 = undefined;
    try file.?.seekTo(0);
    const bytes_read = try file.?.readAll(&buffer);
    try file.?.seekTo(0);
    std.debug.print("Read {} bytes: {}\n", .{ bytes_read, buffer[0] });
    try file.?.writeAll("Hello, world! 2\n");

    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    defer {
        const deinit_status = gpa.deinit();
        if (deinit_status == .leak) {
            @panic("LEAKY MEMORY");
        }
    }
    const content = try file.?.reader().readAllAlloc(allocator, 256);
    _ = content;
}
