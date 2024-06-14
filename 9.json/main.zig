const std = @import("std");

pub fn main() !void {}

const expect = std.testing.expect;
const eql = std.mem.eql;
const test_allocator = std.testing.allocator;
const Place = struct { lat: f32, long: f32 };
const Place2 = struct { lat: f32, long: f32, name: []const u8 };

test "json parse" {
    const parsed = try std.json.parseFromSlice(
        Place,
        test_allocator,
        \\{ "lat": 40.684540, "long": -74.401422 }
    ,
        .{},
    );
    defer parsed.deinit();

    const place = parsed.value;

    try expect(place.lat == 40.684540);
    try expect(place.long == -74.401422);
}

// test "json parse 2 " {
//     // cant do this shit.
//     const parsed = try std.json.parseFromSlice(
//         Place2,
//         test_allocator,
//         \\{ "lat": 40.684540, "long": -74.401422 }
//     ,
//         .{},
//     );
//     defer parsed.deinit();

//     const place = parsed.value;

//     try expect(place.lat == 40.684540);
//     try expect(place.long == -74.401422);
// }
