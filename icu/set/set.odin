package icu_set

import icu ".."

LINK_VERSION :: icu.LINK_VERSION

when ODIN_OS == .Windows {
	foreign import libicu "system:icu.lib"
} else {
	foreign import libicu "system:icuuc"
}

SERIALIZED_STATIC_ARRAY_CAPACITY :: 8

SerializedSet :: struct {
	array:       [^]u16,
	bmpLength:   i32,
	length:      i32,
	staticArray: [SERIALIZED_STATIC_ARRAY_CAPACITY]u16,
}

Set :: struct{}

SetOption :: enum i32 {
	IGNORE_SPACE,
	CASE_INSENSITIVE,
	USET_ADD_CASE_MAPPINGS,
}
SetOptions :: distinct bit_set[SetOption; i32]

SetSpanCondition :: enum i32 {
	NOT_CONTAINED = 0,
	CONTAINED     = 1,
	SIMPLE        = 2,
}

@(default_calling_convention="c", link_prefix="uset_", link_suffix=LINK_VERSION)
foreign libicu {
	openEmpty :: proc() -> ^Set ---
	// FIXME: Finish uset.h.
}
