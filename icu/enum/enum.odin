package icu_enum

import u ".."

LINK_VERSION :: u.LINK_VERSION

when ODIN_OS == .Windows {
	foreign import libicu "system:icu.lib"
} else {
	foreign import libicu "system:icuuc"
}

Char      :: u.Char
ErrorCode :: u.ErrorCode

Enumeration :: struct{}

@(default_calling_convention="c", link_prefix="uenum_", link_suffix=LINK_VERSION)
foreign libicu {
	close                       :: proc(en: ^Enumeration) ---
	count                       :: proc(en: ^Enumeration, status: ^ErrorCode) -> i32 ---
	next                        :: proc(en: ^Enumeration, resultLength: ^i32, status: ^ErrorCode) -> cstring ---
	openCharStringsEnumeration  :: proc(strings: [^]cstring, count: i32, ec: ^ErrorCode) -> ^Enumeration ---
	openUCharStringsEnumeration :: proc(strings: [^][^]Char, count: i32, ec: ^ErrorCode) -> ^Enumeration ---
	reset                       :: proc(en: ^Enumeration, status: ^ErrorCode) ---
	unext                       :: proc(en: ^Enumeration, resultLength: ^i32, status: ^ErrorCode) -> [^]Char ---
}
