const std = @import("std");

const Vec3 = struct {
    x: f32,
    y: f32,
    z: f32 = 0,

    pub fn add(self: Vec3, other: Vec3) Vec3 {
        return Vec3{
            .x = self.x + other.x,
            .y = self.y + other.y,
            .z = self.z + other.z,
        };
    }

    pub fn clear(self: *Vec3) void {
        self.*.x = 0;
        self.*.y = 0;
        self.*.z = 0;

        self.x = 0;
        self.y = 0;
        self.z = 0;
    }
};

pub fn main() !void {
    const v = Vec3{ .x = 1.0, .y = 2.0, .z = 3.0 };
    std.debug.print("vec = {} {} {} \n", .{ v.x, v.y, v.z });
    const v2 = Vec3{ .x = 1.0, .y = 2.0 };
    std.debug.print("vec2 = {} {} {} \n", .{ v2.x, v2.y, v2.z });
    const v3 = Vec3.add(v, v2);
    std.debug.print("vec3 = {} {} {} \n", .{ v3.x, v3.y, v3.z });

    var v4 = Vec3{ .x = 1.0, .y = 2.0, .z = 3.0 };
    std.debug.print("vec4 = {} {} {} \n", .{ v4.x, v4.y, v4.z });
    v4.clear();
    std.debug.print("vec4 = {} {} {} \n", .{ v4.x, v4.y, v4.z });

    const v5 = .{ .x = 1.0, .y = 2.0, .z = 3.0 };
    std.debug.print("vec5 = {} {} {} \n", .{ v5.x, v5.y, v5.z });

    const values = .{
        @as(u32, 1234),
        @as(f64, 12.34),
        true,
        "hi",
    } ++ .{false} ** 2;

    std.debug.print("values len = {} \n", .{values.len});
}
