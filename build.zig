const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib_unit_tests = b.addTest(.{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    });

    const run_lib_unit_tests = b.addRunArtifact(lib_unit_tests);

    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_lib_unit_tests.step);

    const emitted_docs = lib_unit_tests.getEmittedDocs();
    test_step.dependOn(&b.addInstallDirectory(.{
        .source_dir = emitted_docs,
        .install_dir = .prefix,
        .install_subdir = "docs",
    }).step);
}
