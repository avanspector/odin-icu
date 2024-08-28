package icu

import "base:intrinsics"

LOG2 :: intrinsics.constant_log2

StringOption :: enum i32 {
	FOLD_CASE_DEFAULT             = 0,
	FOLD_CASE_EXCLUDE_SPECIAL_I   = 1,
	TITLECASE_WHOLE_STRING        = LOG2(0x20),
	TITLECASE_SENTENCES           = LOG2(0x40),
	TITLECASE_NO_LOWERCASE        = LOG2(0x100),
	TITLECASE_NO_BREAK_ADJUSTMENT = LOG2(0x200),
	TITLECASE_ADJUST_TO_CASED     = LOG2(0x400),
	EDITS_NO_RESET                = LOG2(0x2000),
	OMIT_UNCHANGED_TEXT           = LOG2(0x4000),
	COMPARE_CODE_POINT_ORDER      = LOG2(0x8000),
	COMPARE_IGNORE_CASE           = LOG2(0x10000),
	INPUT_IS_FCD                  = LOG2(0x20000),
}
StringOptions :: distinct bit_set[StringOption; i32]
