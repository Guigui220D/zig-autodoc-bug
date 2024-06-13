This repos is to a minimal bug reproduction for zig's autodoc.

Run zig build test to generate the docs

The docs' root page will show `add` as a value even though it's a namespace, and it seems to be caused by the fact it's in a different folder, because `sub` is indeed shown as a namespace