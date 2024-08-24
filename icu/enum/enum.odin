package icu_enum

import icu ".."

when ODIN_OS == .Windows {
	foreign import libicu "system:icu.lib"
} else {
	foreign import libicu "system:icu"
}

Char      :: icu.Char
ErrorCode :: icu.ErrorCode

Enumeration :: struct{}

@(default_calling_convention="c", link_prefix="uenum_")
foreign libicu {
	close :: proc(en: ^Enumeration) ---
	count :: proc(en: ^Enumeration, status: ^ErrorCode) -> i32 ---
	unext :: proc(en: ^Enumeration, resultLength: ^i32, status: ^ErrorCode) -> [^]Char ---
	next  :: proc(en: ^Enumeration, resultLength: ^i32, status: ^ErrorCode) -> cstring ---
	reset :: proc(en: ^Enumeration, status: ^ErrorCode) ---
	openUCharStringsEnumeration :: proc(strings: [^][^]Char, count: i32, ec: ^ErrorCode) -> ^Enumeration ---
	openCharStringsEnumeration  :: proc(strings: [^]cstring, count: i32, ec: ^ErrorCode) -> ^Enumeration ---
}
