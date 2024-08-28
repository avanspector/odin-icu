package icu_iter

import u ".."

LINK_VERSION :: u.LINK_VERSION

when ODIN_OS == .Windows {
	foreign import libicu "system:icu.lib"
} else {
	foreign import libicu "system:icuuc"
}

Bool      :: u.Bool
Char      :: u.Char
Char32    :: u.Char32
ErrorCode :: u.ErrorCode

NO_STATE      :: 0xffffffff
UNKNOWN_INDEX :: -2

CharIterator :: struct {
	_context:      rawptr,
	length:        i32,
	start:         i32,
	index:         i32,
	limit:         i32,
	reservedField: i32,
	getIndex:      CharIteratorGetIndex,
	move:          CharIteratorMove,
	hasNext:       CharIteratorHasNext,
	hasPrevious:   CharIteratorHasPrevious,
	current:       CharIteratorCurrent,
	next:          CharIteratorNext,
	previous:      CharIteratorPrevious,
	reservedFn:    CharIteratorReserved,
	getState:      CharIteratorGetState,
	setState:      CharIteratorSetState,
}

CharIteratorGetIndex    :: #type proc "c" (iter: ^CharIterator, origin: CharIteratorOrigin) -> i32
CharIteratorMove        :: #type proc "c" (iter: ^CharIterator, delta: i32, origin: CharIteratorOrigin) -> i32
CharIteratorHasNext     :: #type proc "c" (iter: ^CharIterator) -> Bool
CharIteratorHasPrevious :: #type proc "c" (iter: ^CharIterator) -> Bool
CharIteratorCurrent     :: #type proc "c" (iter: ^CharIterator) -> Char32
CharIteratorNext        :: #type proc "c" (iter: ^CharIterator) -> Char32
CharIteratorPrevious    :: #type proc "c" (iter: ^CharIterator) -> Char32
CharIteratorReserved    :: #type proc "c" (iter: ^CharIterator, something: i32) -> i32
CharIteratorGetState    :: #type proc "c" (iter: ^CharIterator) -> u32
CharIteratorSetState    :: #type proc "c" (iter: ^CharIterator, state: u32, pErrorCode: ^ErrorCode)

CharIteratorOrigin :: enum i32 {
	START, CURRENT, LIMIT, ZERO, LENGTH,
}

@(default_calling_convention="c", link_prefix="uiter_", link_suffix=LINK_VERSION)
foreign libicu {
	current32  :: proc(iter: ^CharIterator) -> Char32 ---
	getState   :: proc(iter: ^CharIterator) -> u32 ---
	next32     :: proc(iter: ^CharIterator) -> Char32 ---
	previous32 :: proc(iter: ^CharIterator) -> Char32 ---
	setState   :: proc(iter: ^CharIterator, state: u32, pErrorCode: ^ErrorCode) ---
	setString  :: proc(iter: ^CharIterator, s: [^]Char, length: i32) ---
	setUTF16BE :: proc(iter: ^CharIterator, s: [^]u8, length: i32) ---
	setUTF8    :: proc(iter: ^CharIterator, s: [^]u8, length: i32) ---
}
