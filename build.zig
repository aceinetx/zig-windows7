const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.resolveTargetQuery(.{
        .os_tag = .windows,
        .cpu_arch = .x86,
        .abi = .gnu,
    });
    const optimize = b.standardOptimizeOption(.{});

    // ----------------------------------------------------------

    const exe = b.addExecutable(.{
        .name = "zig_windows7",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/root.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{},
        }),
    });

    b.installArtifact(exe);

    // ----------------------------------------------------------

    const run_step = b.step("run", "Run the app");

    const run_cmd = b.addRunArtifact(exe);
    run_step.dependOn(&run_cmd.step);

    run_cmd.step.dependOn(b.getInstallStep());

    run_cmd.addPassthruArgs();

    // ----------------------------------------------------------

    const check_step = b.step("check", "Check");

    check_step.dependOn(&exe.step);
}
