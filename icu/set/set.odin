package icu_set

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
Property  :: u.Property

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
	add                     :: proc(set: ^Set, c: Char32) ---
	addAll                  :: proc(set: ^Set, additionalSet: ^Set) ---
	addAllCodePoints        :: proc(set: ^Set, str: [^]Char, strLen: i32) ---
	addRange                :: proc(set: ^Set, start: Char32, end: Char32) ---
	addString               :: proc(set: ^Set, str: [^]Char, strLen: i32) ---
	applyIntPropertyValue   :: proc(set: ^Set, prop: Property, value: i32, ec: ^ErrorCode) ---
	applyPattern            :: proc(
		set:           ^Set,
		pattern:       [^]Char,
		patternLength: i32,
		options:       SetOptions,
		status:        ^ErrorCode,
	) -> i32 ---
	applyPropertyAlias      :: proc(
		set:         ^Set,
		prop:        [^]Char,
		propLength:  i32,
		value:       [^]Char,
		valueLength: i32,
		ec:          ^ErrorCode,
	) ---
	charAt                  :: proc(set: ^Set, charIndex: i32) -> Char32 ---
	clear                   :: proc(set: ^Set) ---
	clone                   :: proc(set: ^Set) -> ^Set ---
	cloneAsThawed           :: proc(set: ^Set) -> ^Set ---
	close                   :: proc(set: ^Set) ---
	closeOver               :: proc(set: ^Set, attributes: i32) ---
	compact                 :: proc(set: ^Set) ---
	complement              :: proc(set: ^Set) ---
	complementAll           :: proc(set: ^Set, complement: ^Set) ---
	contains                :: proc(set: ^Set, c: Char32) -> Bool ---
	containsAll             :: proc(set1: ^Set, set2: ^Set) -> Bool ---
	containsAllCodePoints   :: proc(set: ^Set, str: [^]Char, strLen: i32) -> Bool ---
	containsNone            :: proc(set1: ^Set, set2: ^Set) -> Bool ---
	containsRange           :: proc(set: ^Set, start: Char32, end: Char32) -> Bool ---
	containsSome            :: proc(set1: ^Set, set2: ^Set) -> Bool ---
	containsString          :: proc(set: ^Set, str: [^]Char, strLen: i32) -> Bool ---
	equals                  :: proc(set1: ^Set, set2: ^Set) -> Bool ---
	freeze                  :: proc(set: ^Set) ---
	getItem                 :: proc(
		set:         ^Set,
		itemIndex:   i32,
		start:       [^]Char32,
		end:         [^]Char32,
		str:         [^]Char,
		strCapacity: i32,
		ec:          ^ErrorCode,
	) -> i32 ---
	getItemCount            :: proc(set: ^Set) -> i32 ---
	getSerializedRange      :: proc(
		#by_ptr set: SerializedSet,
		rangeIndex:  i32,
		pStart:      [^]Char32,
		pEnd:        [^]Char32,
	) -> Bool ---
	getSerializedRangeCount :: proc(#by_ptr set: SerializedSet) -> i32 ---
	getSerializedSet        :: proc(fillSet: ^SerializedSet, src: [^]u16, srcLength: i32) -> Bool ---
	indexOf                 :: proc(set: ^Set, c: Char32) -> i32 ---
	isEmpty                 :: proc(set: ^Set) -> Bool ---
	isFrozen                :: proc(set: ^Set) -> Bool ---
	open                    :: proc(start: Char32, end: Char32) -> ^Set ---
	openEmpty               :: proc() -> ^Set ---
	openPattern             :: proc(pattern: [^]Char, patternLength: i32, ec: ^ErrorCode) -> ^Set ---
	openPatternOptions      :: proc(
		pattern:       [^]Char,
		patternLength: i32,
		options:       SetOptions,
		ec:            ^ErrorCode,
	) -> ^Set ---
	remove                  :: proc(set: ^Set, c: Char32) ---
	removeAll               :: proc(set: ^Set, removeSet: ^Set) ---
	removeAllStrings        :: proc(set: ^Set) ---
	removeRange             :: proc(set: ^Set, start: Char32, end: Char32) ---
	removeString            :: proc(set: ^Set, str: [^]Char, strLen: i32) ---
	resemblesPattern        :: proc(pattern: [^]Char, patternLength: i32, pos: i32) -> Bool ---
	retain                  :: proc(set: ^Set, start: Char32, end: Char32) ---
	retainAll               :: proc(set: ^Set, retain: ^Set) ---
	serialize               :: proc(set: ^Set, dest: [^]u16, destCapacity: i32, pErrorCode: ^ErrorCode) -> i32 ---
	serializedContains      :: proc(#by_ptr set: SerializedSet, c: Char32) -> Bool ---
	set                     :: proc(set: ^Set, start: Char32, end: Char32) ---
	setSerializedToOne      :: proc(fillSet: ^SerializedSet, c: Char32) ---
	size                    :: proc(set: ^Set) -> i32 ---
	span                    :: proc(set: ^Set, s: [^]Char, length: i32, spanCondition: SetSpanCondition) -> i32 ---
	spanBack                :: proc(set: ^Set, s: [^]Char, length: i32, spanCondition: SetSpanCondition) -> i32 ---
	spanBackUTF8            :: proc(set: ^Set, s: [^]u8, length: i32, spanCondition: SetSpanCondition) -> i32 ---
	spanUTF8                :: proc(set: ^Set, s: [^]u8, length: i32, spanCondition: SetSpanCondition) -> i32 ---
	toPattern               :: proc(
		set:               ^Set,
		result:            [^]Char,
		resultCapacity:    i32,
		escapeUnprintable: Bool,
		ec:                ^ErrorCode,
	) -> i32 ---
}
