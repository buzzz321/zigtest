const std = @import("std");

const Vec3 = struct {
    x: f32, y: f32, z: f32
};

const Vec4 = struct {
    x: f32, y: f32, z: f32, w: f32
};

fn addVec(v1: Vec3, v2: Vec3) Vec3 {
    Vec3{v1.x+v2.x,v1.y+v2.y,v1.z+v2.z}
}

test "struct usage" {
    const my_vector = Vec3{
        .x = 0,
        .y = 100,
        .z = 50,
    };
}

pub fn main() anyerror!void {
    std.log.info("All your codebase are belong to us.", .{});
}
