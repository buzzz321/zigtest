const std = @import("std");
const expect = @import("std").testing.expect;
const expectEqual = @import("std").testing.expectEqual;
const math = @import("std").math;

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

    pub fn add(v1: Vec3, v2: Vec3) Vec3 {
        return Vec3{ .x = v1.x + v2.x, .y = v1.y + v2.y, .z = v1.z + v2.z };
    }

    pub fn sub(v1: Vec3, v2: Vec3) Vec3 {
        return Vec3{ .x = v1.x - v2.x, .y = v1.y - v2.y, .z = v1.z - v2.z };
    }

    pub fn mul(v1: Vec3, v2: Vec3) Vec3 {
        return Vec3{ .x = v1.x * v2.x, .y = v1.y * v2.y, .z = v1.z * v2.z };
    }
    pub fn div(v1: Vec3, v2: Vec3) Vec3 {
        return Vec3{ .x = v1.x / v2.x, .y = v1.y / v2.y, .z = v1.z / v2.z };
    }
    pub fn len(v1: Vec3) f32 {
        return math.sqrt(math.exp2(v1.x) + math.exp2(v1.y) + math.exp2(v1.z));
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
    pub fn add(v1: Vec4, v2: Vec4) Vec4 {
        return Vec4{ .x = v1.x + v2.x, .y = v1.y + v2.y, .z = v1.z + v2.z, .w = v1.w + v2.w };
    }

    pub fn sub(v1: Vec4, v2: Vec4) Vec4 {
        return Vec4{ .x = v1.x - v2.x, .y = v1.y - v2.y, .z = v1.z - v2.z, .w = v1.w - v2.w };
    }

    pub fn mul(v1: Vec4, v2: Vec4) Vec4 {
        return Vec4{ .x = v1.x * v2.x, .y = v1.y * v2.y, .z = v1.z * v2.z, .w = v1.w * v2.w };
    }

    pub fn div(v1: Vec4, v2: Vec4) Vec4 {
        return Vec4{ .x = v1.x / v2.x, .y = v1.y / v2.y, .z = v1.z / v2.z, .w = v1.w / v2.w };
    }

    pub fn len(v1: Vec4) f32 {
        return math.sqrt(math.exp2(v1.x) + math.exp2(v1.y) + math.exp2(v1.z) + math.exp2(v1.w));
    }
};

// Matrix struct is based on https://github.com/andrewrk/tetris/blob/master/src/math3d.zig
//
pub const Mat44 = struct {
    mat: [4][4]f32,

    pub fn mulVec4(m: Mat44, v: Vec4) Vec4 {
        return Vec4.init(m.mat[0][0] * v.x + m.mat[0][1] * v.y + m.mat[0][2] * v.z + m.mat[0][3] * v.w, m.mat[1][0] * v.x + m.mat[1][1] * v.y + m.mat[1][2] * v.z + m.mat[1][3] * v.w, m.mat[2][0] * v.x + m.mat[2][1] * v.y + m.mat[2][2] * v.z + m.mat[2][3] * v.w, m.mat[3][0] * v.x + m.mat[3][1] * v.y + m.mat[3][2] * v.z + m.mat[3][3] * v.w);
    }

    pub fn mulScal(m: Mat44, s: f32) Mat44 {
        return Mat44{ .mat = [_][4]f32{
            [_]f32{
                m.mat[0][0] * s,
                m.mat[0][1] * s,
                m.mat[0][2] * s,
                m.mat[0][3] * s,
            },
            [_]f32{
                m.mat[1][0] * s,
                m.mat[1][1] * s,
                m.mat[1][2] * s,
                m.mat[1][3] * s,
            },
            [_]f32{
                m.mat[2][0] * s,
                m.mat[2][1] * s,
                m.mat[2][2] * s,
                m.mat[2][3] * s,
            },
            [_]f32{
                m.mat[3][0] * s,
                m.mat[3][1] * s,
                m.mat[3][2] * s,
                m.mat[3][3] * s,
            },
        } };
    }
    pub fn add(m: Mat44, other: Mat44) Mat44 {
        return Mat44{ .mat = [_][4]f32{
            [_]f32{
                m.mat[0][0] + other.mat[0][0],
                m.mat[0][1] + other.mat[0][1],
                m.mat[0][2] + other.mat[0][2],
                m.mat[0][3] + other.mat[0][3],
            },
            [_]f32{
                m.mat[1][0] + other.mat[1][0],
                m.mat[1][1] + other.mat[1][1],
                m.mat[1][2] + other.mat[1][2],
                m.mat[1][3] + other.mat[1][3],
            },
            [_]f32{
                m.mat[2][0] + other.mat[2][0],
                m.mat[2][1] + other.mat[2][1],
                m.mat[2][2] + other.mat[2][2],
                m.mat[2][3] + other.mat[2][3],
            },
            [_]f32{
                m.mat[3][0] + other.mat[3][0],
                m.mat[3][1] + other.mat[3][1],
                m.mat[3][2] + other.mat[3][2],
                m.mat[3][3] + other.mat[3][3],
            },
        } };
    }

    pub fn mul(m: Mat44, other: Mat44) Mat44 {
        return Mat44{ .mat = [_][4]f32{
            [_]f32{
                m.mat[0][0] * other.mat[0][0] + m.mat[0][1] * other.mat[1][0] + m.mat[0][2] * other.mat[2][0] + m.mat[0][3] * other.mat[3][0],
                m.mat[0][0] * other.mat[0][1] + m.mat[0][1] * other.mat[1][1] + m.mat[0][2] * other.mat[2][1] + m.mat[0][3] * other.mat[3][1],
                m.mat[0][0] * other.mat[0][2] + m.mat[0][1] * other.mat[1][2] + m.mat[0][2] * other.mat[2][2] + m.mat[0][3] * other.mat[3][2],
                m.mat[0][0] * other.mat[0][3] + m.mat[0][1] * other.mat[1][3] + m.mat[0][2] * other.mat[2][3] + m.mat[0][3] * other.mat[3][3],
            },
            [_]f32{
                m.mat[1][0] * other.mat[0][0] + m.mat[1][1] * other.mat[1][0] + m.mat[1][2] * other.mat[2][0] + m.mat[1][3] * other.mat[3][0],
                m.mat[1][0] * other.mat[0][1] + m.mat[1][1] * other.mat[1][1] + m.mat[1][2] * other.mat[2][1] + m.mat[1][3] * other.mat[3][1],
                m.mat[1][0] * other.mat[0][2] + m.mat[1][1] * other.mat[1][2] + m.mat[1][2] * other.mat[2][2] + m.mat[1][3] * other.mat[3][2],
                m.mat[1][0] * other.mat[0][3] + m.mat[1][1] * other.mat[1][3] + m.mat[1][2] * other.mat[2][3] + m.mat[1][3] * other.mat[3][3],
            },
            [_]f32{
                m.mat[2][0] * other.mat[0][0] + m.mat[2][1] * other.mat[1][0] + m.mat[2][2] * other.mat[2][0] + m.mat[2][3] * other.mat[3][0],
                m.mat[2][0] * other.mat[0][1] + m.mat[2][1] * other.mat[1][1] + m.mat[2][2] * other.mat[2][1] + m.mat[2][3] * other.mat[3][1],
                m.mat[2][0] * other.mat[0][2] + m.mat[2][1] * other.mat[1][2] + m.mat[2][2] * other.mat[2][2] + m.mat[2][3] * other.mat[3][2],
                m.mat[2][0] * other.mat[0][3] + m.mat[2][1] * other.mat[1][3] + m.mat[2][2] * other.mat[2][3] + m.mat[2][3] * other.mat[3][3],
            },
            [_]f32{
                m.mat[3][0] * other.mat[0][0] + m.mat[3][1] * other.mat[1][0] + m.mat[3][2] * other.mat[2][0] + m.mat[3][3] * other.mat[3][0],
                m.mat[3][0] * other.mat[0][1] + m.mat[3][1] * other.mat[1][1] + m.mat[3][2] * other.mat[2][1] + m.mat[3][3] * other.mat[3][1],
                m.mat[3][0] * other.mat[0][2] + m.mat[3][1] * other.mat[1][2] + m.mat[3][2] * other.mat[2][2] + m.mat[3][3] * other.mat[3][2],
                m.mat[3][0] * other.mat[0][3] + m.mat[3][1] * other.mat[1][3] + m.mat[3][2] * other.mat[2][3] + m.mat[3][3] * other.mat[3][3],
            },
        } };
    }
};

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

    var ans = v1.add(v2);

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

    var ans = v1.sub(v2);

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

    var ans = v1.mul(v2);

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

    var ans = v2.div(v1);

    try expect(expected.x == ans.x);
    try expect(expected.y == ans.y);
    try expect(expected.z == ans.z);
}

test "Adding 2 Vec4 " {
    const v1 = Vec4{ .x = 1.0, .y = 2.0, .z = 3.0, .w = 4.0 };
    const v2 = Vec4{ .x = 4.0, .y = 5.0, .z = 6.0, .w = 7.0 };

    const expected = Vec4{ .x = 5.0, .y = 7.0, .z = 9.0, .w = 11.0 };

    var ans = v1.add(v2);

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

    var ans = v1.sub(v2);

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

    var ans = v1.mul(v2);

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

    var ans = v2.div(v1);

    try expect(expected.x == ans.x);
    try expect(expected.y == ans.y);
    try expect(expected.z == ans.z);
    try expect(expected.w == ans.w);
}

test "mul Mat44 Vec4 " {
    const v1 = Vec4{ .x = 1.0, .y = 2.0, .z = 3.0, .w = 4.0 };
    const mat = Mat44{ .mat = [_][4]f32{ [_]f32{ 1.0, 2.0, 3.0, 4.0 }, [_]f32{ 5.0, 6.0, 7.0, 8.0 }, [_]f32{ 9.0, 10.0, 11.0, 12.0 }, [_]f32{ 13.0, 14.0, 15.0, 16.0 } } };

    const expected = Vec4{ .x = 30.0, .y = 70.0, .z = 110.0, .w = 150.0 };

    const ans = mat.mulVec4(v1);

    try expect(expected.x == ans.x);
    try expect(expected.y == ans.y);
    try expect(expected.z == ans.z);
    try expect(expected.w == ans.w);
}

test "add 2 mat4" {
    const mat1 = Mat44{ .mat = [_][4]f32{ [_]f32{ 1.0, 2.0, 3.0, 4.0 }, [_]f32{ 5.0, 6.0, 7.0, 8.0 }, [_]f32{ 9.0, 10.0, 11.0, 12.0 }, [_]f32{ 13.0, 14.0, 15.0, 16.0 } } };
    const mat2 = Mat44{ .mat = [_][4]f32{ [_]f32{ 1.0, 2.0, 3.0, 4.0 }, [_]f32{ 5.0, 6.0, 7.0, 8.0 }, [_]f32{ 9.0, 10.0, 11.0, 12.0 }, [_]f32{ 13.0, 14.0, 15.0, 16.0 } } };

    const expected = Mat44{ .mat = [_][4]f32{ [_]f32{ 2.0, 4.0, 6.0, 8.0 }, [_]f32{ 10.0, 12.0, 14.0, 16.0 }, [_]f32{ 18.0, 20.0, 22.0, 24.0 }, [_]f32{ 26.0, 28.0, 30.0, 32.0 } } };

    const ans = mat1.add(mat2);

    for (expected.mat) |row, i| {
        for (row) |col, n| {
            try expect(col == ans.mat[i][n]);
        }
    }
}

test "mul 2 mat4" {
    const mat1 = Mat44{ .mat = [_][4]f32{ [_]f32{ 1.0, 2.0, 3.0, 4.0 }, [_]f32{ 5.0, 6.0, 7.0, 8.0 }, [_]f32{ 9.0, 10.0, 11.0, 12.0 }, [_]f32{ 13.0, 14.0, 15.0, 16.0 } } };
    const mat2 = Mat44{ .mat = [_][4]f32{ [_]f32{ 1.0, 2.0, 3.0, 4.0 }, [_]f32{ 5.0, 6.0, 7.0, 8.0 }, [_]f32{ 9.0, 10.0, 11.0, 12.0 }, [_]f32{ 13.0, 14.0, 15.0, 16.0 } } };

    const expected = Mat44{ .mat = [_][4]f32{ [_]f32{
        90.0,
        100.0,
        110.0,
        120.0,
    }, [_]f32{ 202.0, 228.0, 254.0, 280.0 }, [_]f32{ 314.0, 356.0, 398.0, 440.0 }, [_]f32{ 426.0, 484.0, 542.0, 600.0 } } };

    const ans = mat1.mul(mat2);

    for (expected.mat) |row, i| {
        for (row) |col, n| {
            try expectEqual(col, ans.mat[i][n]);
        }
    }
}

test "mul mat4 & scalear" {
    const mat1 = Mat44{ .mat = [_][4]f32{ [_]f32{ 1.0, 2.0, 3.0, 4.0 }, [_]f32{ 5.0, 6.0, 7.0, 8.0 }, [_]f32{ 9.0, 10.0, 11.0, 12.0 }, [_]f32{ 13.0, 14.0, 15.0, 16.0 } } };
    const scal: f32 = 2.0;

    const expected = Mat44{ .mat = [_][4]f32{ [_]f32{ 2.0 * 1.0, 2.0 * 2.0, 2.0 * 3.0, 2.0 * 4.0 }, [_]f32{ 2.0 * 5.0, 2.0 * 6.0, 2.0 * 7.0, 2.0 * 8.0 }, [_]f32{ 2.0 * 9.0, 2.0 * 10.0, 2.0 * 11.0, 2.0 * 12.0 }, [_]f32{ 2.0 * 13.0, 2.0 * 14.0, 2.0 * 15.0, 2.0 * 16.0 } } };
    const ans = mat1.mulScal(scal);

    for (expected.mat) |row, i| {
        for (row) |col, n| {
            try expectEqual(col, ans.mat[i][n]);
        }
    }
}

test "lenght of a vec4" {
    var v1 = Vec4.init(5.0, 0, 0, 0);
    var expected: f32 = 5.0;
    var ans = v1.len();

    try expectEqual(ans, ans);

    v1 = Vec4.init(2, 2, 2, 2);
    expected = 4.0;
    ans = v1.len();

    try expectEqual(ans, ans);
}

test "lenght of a vec3" {
    var v1 = Vec3.init(5.0, 0, 0);
    var expected: f32 = 5.0;
    var ans = v1.len();

    try expectEqual(ans, ans);

    v1 = Vec3.init(2, 2, 1);
    expected = 3.0;
    ans = v1.len();

    try expectEqual(ans, ans);
}

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Hello, {s}!\n", .{"world"});
}
