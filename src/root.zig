const std = @import("std");
const testing = std.testing;

pub const add = @import("dir/add.zig");
pub const sub = @import("sub.zig");

test "basic add functionality" {
    try testing.expect(add.add(3, 7) == 10);
    try testing.expect(sub.sub(10, 7) == 3);
}
