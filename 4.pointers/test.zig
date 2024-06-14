const expect = @import("std").testing.expect;

fn increment(num: *u8) void {
    num.* += 1;
}

test "pointers" {
    var x: u8 = 1;
    increment(&x);
    try expect(x == 2);
}

test "slices 2" {
    const array = [_]u8{ 1, 2, 3, 4, 5 };
    const slice = array[0..3];
    try expect(@TypeOf(slice) == *const [3]u8);
}
