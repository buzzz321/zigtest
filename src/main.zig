const std = @import("std");
const expect = @import("std").testing.expect;

const Vec3 = struct {
    x: f32,
    y: f32,
    z: f32,
    pub fn init(x: f32, y: f32, z: f32) Vec3 {
        return Vec3{
            .x = x,
            .y = y,
            .z = z,
        };
    }
};

pub const Vec4 = struct {
    x: f32,
    y: f32,
    z: f32,
    w: f32,
    pub fn init(x: f32, y: f32, z: f32, w: f32) Vec4 {
        return Vec4{ .x = x, .y = y, .z = z, .w = w };
    }
};

pub const Mat44 = struct {
    mat: [4][4]f32,

    pub fn mult(m: Mat44, v: Vec4) Vec4 {
        return Vec4.init(m.mat[0][0] * v.x + m.mat[0][1] * v.y + m.mat[0][2] * v.z + m.mat[0][3] * v.w, m.mat[1][0] * v.x + m.mat[1][1] * v.y + m.mat[1][2] * v.z + m.mat[1][3] * v.w, m.mat[2][0] * v.x + m.mat[2][1] * v.y + m.mat[2][2] * v.z + m.mat[2][3] * v.w, m.mat[3][0] * v.x + m.mat[3][1] * v.y + m.mat[3][2] * v.z + m.mat[3][3] * v.w);
    }
};

pub fn addVec3(v1: Vec3, v2: Vec3) Vec3 {
    return Vec3{ .x = v1.x + v2.x, .y = v1.y + v2.y, .z = v1.z + v2.z };
}

pub fn addVec4(v1: Vec4, v2: Vec4) Vec4 {
    return Vec4{ .x = v1.x + v2.x, .y = v1.y + v2.y, .z = v1.z + v2.z, .w = v1.w + v2.w };
}

pub fn subVec3(v1: Vec3, v2: Vec3) Vec3 {
    return Vec3{ .x = v1.x - v2.x, .y = v1.y - v2.y, .z = v1.z - v2.z };
}

pub fn subVec4(v1: Vec4, v2: Vec4) Vec4 {
    return Vec4{ .x = v1.x - v2.x, .y = v1.y - v2.y, .z = v1.z - v2.z, .w = v1.w - v2.w };
}

pub fn mulVec3(v1: Vec3, v2: Vec3) Vec3 {
    return Vec3{ .x = v1.x * v2.x, .y = v1.y * v2.y, .z = v1.z * v2.z };
}

pub fn mulVec4(v1: Vec4, v2: Vec4) Vec4 {
    return Vec4{ .x = v1.x * v2.x, .y = v1.y * v2.y, .z = v1.z * v2.z, .w = v1.w * v2.w };
}

pub fn divVec3(v1: Vec3, v2: Vec3) Vec3 {
    return Vec3{ .x = v1.x / v2.x, .y = v1.y / v2.y, .z = v1.z / v2.z };
}

pub fn divVec4(v1: Vec4, v2: Vec4) Vec4 {
    return Vec4{ .x = v1.x / v2.x, .y = v1.y / v2.y, .z = v1.z / v2.z, .w = v1.w / v2.w };
}

//-----------------------some tests.-------------------------
test "Adding 2 vec3 " {
    const v1 = Vec3{
        .x = 1.0,
        .y = 2.0,
        .z = 3.0,
    };
    const v2 = Vec3{
        .x = 4.0,
        .y = 5.0,
        .z = 6.0,
    };

    const expected = Vec3{
        .x = 5.0,
        .y = 7.0,
        .z = 9.0,
    };

    var ans = addVec3(v1, v2);

    try expect(expected.x == ans.x);
    try expect(expected.y == ans.y);
    try expect(expected.z == ans.z);
}

test "sub 2 vec3 " {
    const v1 = Vec3{
        .x = 1.0,
        .y = 2.0,
        .z = 3.0,
    };
    const v2 = Vec3{
        .x = 4.0,
        .y = 5.0,
        .z = 6.0,
    };

    const expected = Vec3{
        .x = -3.0,
        .y = -3.0,
        .z = -3.0,
    };

    var ans = subVec3(v1, v2);

    try expect(expected.x == ans.x);
    try expect(expected.y == ans.y);
    try expect(expected.z == ans.z);
}

test "mul 2 vec3 " {
    const v1 = Vec3{
        .x = 1.0,
        .y = 2.0,
        .z = 3.0,
    };
    const v2 = Vec3{
        .x = 4.0,
        .y = 5.0,
        .z = 6.0,
    };

    const expected = Vec3{
        .x = 4.0,
        .y = 10.0,
        .z = 18.0,
    };

    var ans = mulVec3(v1, v2);

    try expect(expected.x == ans.x);
    try expect(expected.y == ans.y);
    try expect(expected.z == ans.z);
}

test "div 2 vec3 " {
    const v1 = Vec3{
        .x = 1.0,
        .y = 2.0,
        .z = 3.0,
    };
    const v2 = Vec3{
        .x = 4.0,
        .y = 5.0,
        .z = 6.0,
    };

    const expected = Vec3{
        .x = 4.0,
        .y = 2.5,
        .z = 2.0,
    };

    var ans = divVec3(v2, v1);

    try expect(expected.x == ans.x);
    try expect(expected.y == ans.y);
    try expect(expected.z == ans.z);
}

test "Adding 2 Vec4 " {
    const v1 = Vec4{ .x = 1.0, .y = 2.0, .z = 3.0, .w = 4.0 };
    const v2 = Vec4{ .x = 4.0, .y = 5.0, .z = 6.0, .w = 7.0 };

    const expected = Vec4{ .x = 5.0, .y = 7.0, .z = 9.0, .w = 11.0 };

    var ans = addVec4(v1, v2);

    try expect(expected.x == ans.x);
    try expect(expected.y == ans.y);
    try expect(expected.z == ans.z);
    try expect(expected.w == ans.w);
}

test "sub 2 Vec4 " {
    const v1 = Vec4{ .x = 1.0, .y = 2.0, .z = 3.0, .w = 4.0 };
    const v2 = Vec4{ .x = 4.0, .y = 5.0, .z = 6.0, .w = 7.0 };

    const expected = Vec4{
        .x = -3.0,
        .y = -3.0,
        .z = -3.0,
        .w = -3.0,
    };

    var ans = subVec4(v1, v2);

    try expect(expected.x == ans.x);
    try expect(expected.y == ans.y);
    try expect(expected.z == ans.z);
    try expect(expected.w == ans.w);
}

test "mul 2 Vec4 " {
    const v1 = Vec4{
        .x = 1.0,
        .y = 2.0,
        .z = 3.0,
        .w = 4.0,
    };
    const v2 = Vec4{
        .x = 4.0,
        .y = 5.0,
        .z = 6.0,
        .w = 7.0,
    };

    const expected = Vec4{
        .x = 4.0,
        .y = 10.0,
        .z = 18.0,
        .w = 28.0,
    };

    var ans = mulVec4(v1, v2);

    try expect(expected.x == ans.x);
    try expect(expected.y == ans.y);
    try expect(expected.z == ans.z);
    try expect(expected.w == ans.w);
}

test "div 2 Vec4 " {
    const v1 = Vec4{ .x = 1.0, .y = 2.0, .z = 3.0, .w = 4.0 };
    const v2 = Vec4{ .x = 4.0, .y = 5.0, .z = 6.0, .w = 8.0 };

    const expected = Vec4{
        .x = 4.0,
        .y = 2.5,
        .z = 2.0,
        .w = 2.0,
    };

    var ans = divVec4(v2, v1);

    try expect(expected.x == ans.x);
    try expect(expected.y == ans.y);
    try expect(expected.z == ans.z);
    try expect(expected.w == ans.w);
}

test "mul Mat44 Vec4 " {
    const v1 = Vec4{ .x = 1.0, .y = 2.0, .z = 3.0, .w = 4.0 };
    const mat = Mat44{ .mat = [_][4]f32{ [_]f32{ 1.0, 2.0, 3.0, 4.0 }, [_]f32{ 5.0, 6.0, 7.0, 8.0 }, [_]f32{ 9.0, 10.0, 11.0, 12.0 }, [_]f32{ 13.0, 14.0, 15.0, 16.0 } } };

    const expected = Vec4{ .x = 30.0, .y = 70.0, .z = 110.0, .w = 150.0 };

    const ans = mat.mult(v1);

    try expect(expected.x == ans.x);
    try expect(expected.y == ans.y);
    try expect(expected.z == ans.z);
    try expect(expected.w == ans.w);
}

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Hello, {s}!\n", .{"world"});
}
