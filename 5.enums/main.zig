const std = @import("std");

const Direction = enum {
    var rotated: usize = 0;
    Up,
    Down,
    Left,
    Right,

    pub fn rotate(self: Direction) Direction {
        Direction.rotated += 1;

        return switch (self) {
            Direction.Up => Direction.Right,
            Direction.Right => Direction.Down,
            Direction.Down => Direction.Left,
            Direction.Left => Direction.Up,
        };
    }
};
const DirectionI = enum(usize) {
    Up = 500,
    Down,
    Left,
    Right,
};

pub fn main() !void {
    std.debug.print("val: {}\n", .{Direction.Up});
    std.debug.print("val: {}\n", .{DirectionI.Up});
    std.debug.print("val: {}\n", .{@intFromEnum(Direction.Up)});
    std.debug.print("val: {}\n", .{@intFromEnum(DirectionI.Up)});

    std.debug.print("rotated: {}\n", .{Direction.Up.rotate()});
    std.debug.print("rotated: {}\n", .{Direction.Down.rotate()});
    std.debug.print("rotated: {}\n", .{Direction.rotated});
}
