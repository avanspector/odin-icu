package icu

when ODIN_OS == .Windows {
	foreign import libicu "system:icu.lib"
} else {
	foreign import libicu "system:icuuc"
}

SHAPE_AGGREGATE_TASHKEEL                :: 0x4000
SHAPE_AGGREGATE_TASHKEEL_MASK           :: 0x4000
SHAPE_AGGREGATE_TASHKEEL_NOOP           :: 0
SHAPE_DIGIT_TYPE_AN                     :: 0
SHAPE_DIGIT_TYPE_AN_EXTENDED            :: 0x100
SHAPE_DIGIT_TYPE_MASK                   :: 0x300
SHAPE_DIGIT_TYPE_RESERVED               :: 0x200
SHAPE_DIGITS_ALEN2AN_INIT_AL            :: 0x80
SHAPE_DIGITS_ALEN2AN_INIT_LR            :: 0x60
SHAPE_DIGITS_AN2EN                      :: 0x40
SHAPE_DIGITS_EN2AN                      :: 0x20
SHAPE_DIGITS_MASK                       :: 0xe0
SHAPE_DIGITS_NOOP                       :: 0
SHAPE_DIGITS_RESERVED                   :: 0xa0
SHAPE_LAMALEF_AUTO                      :: 0x10000
SHAPE_LAMALEF_BEGIN                     :: 3
SHAPE_LAMALEF_END                       :: 2
SHAPE_LAMALEF_MASK                      :: 0x10003
SHAPE_LAMALEF_NEAR                      :: 1
SHAPE_LAMALEF_RESIZE                    :: 0
SHAPE_LENGTH_FIXED_SPACES_AT_BEGINNING  :: 3
SHAPE_LENGTH_FIXED_SPACES_AT_END        :: 2
SHAPE_LENGTH_FIXED_SPACES_NEAR          :: 1
SHAPE_LENGTH_GROW_SHRINK                :: 0
SHAPE_LENGTH_MASK                       :: 0x10003
SHAPE_LETTERS_MASK                      :: 0x18
SHAPE_LETTERS_NOOP                      :: 0
SHAPE_LETTERS_SHAPE                     :: 8
SHAPE_LETTERS_SHAPE_TASHKEEL_ISOLATED   :: 0x18
SHAPE_LETTERS_UNSHAPE                   :: 0x10
SHAPE_PRESERVE_PRESENTATION             :: 0x8000
SHAPE_PRESERVE_PRESENTATION_MASK        :: 0x8000
SHAPE_PRESERVE_PRESENTATION_NOOP        :: 0
SHAPE_SEEN_MASK                         :: 0x700000
SHAPE_SEEN_TWOCELL_NEAR                 :: 0x200000
SHAPE_SPACES_RELATIVE_TO_TEXT_BEGIN_END :: 0x4000000
SHAPE_SPACES_RELATIVE_TO_TEXT_MASK      :: 0x4000000
SHAPE_TAIL_NEW_UNICODE                  :: 0x8000000
SHAPE_TAIL_TYPE_MASK                    :: 0x8000000
SHAPE_TASHKEEL_BEGIN                    :: 0x40000
SHAPE_TASHKEEL_END                      :: 0x60000
SHAPE_TASHKEEL_MASK                     :: 0xE0000
SHAPE_TASHKEEL_REPLACE_BY_TATWEEL       :: 0xC0000
SHAPE_TASHKEEL_RESIZE                   :: 0x80000
SHAPE_TEXT_DIRECTION_LOGICAL            :: 0
SHAPE_TEXT_DIRECTION_MASK               :: 4
SHAPE_TEXT_DIRECTION_VISUAL_LTR         :: 4
SHAPE_TEXT_DIRECTION_VISUAL_RTL         :: 0
SHAPE_YEHHAMZA_MASK                     :: 0x3800000
SHAPE_YEHHAMZA_TWOCELL_NEAR             :: 0x1000000

@(default_calling_convention="c", link_prefix="u_")
foreign libicu {
	shapeArabic :: proc(
		source:       [^]Char,
		sourceLength: i32,
		dest:         [^]Char,
		destSize:     i32,
		options:      u32,
		pErrorCode:   ^ErrorCode,
	) -> i32 ---
}
