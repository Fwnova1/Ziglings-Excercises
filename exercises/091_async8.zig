//
// You have doubtless noticed that 'suspend' requires a block
// expression like so:
//
//     suspend {}
//
// The suspend block executes when a function suspends. To get
// sense for when this happens, please make the following
// program print the string
//
//     "ABCDEF"
//
const print = @import("std").debug.print;

pub fn main() void {
    print("A", .{});

    var frame = async suspendable();

    print("B    ", .{});

    resume frame;

    print("E", .{});
}

fn suspendable() void {
    print("C", .{});

    suspend {
        print("D", .{});
    }

    print("F", .{});
}
