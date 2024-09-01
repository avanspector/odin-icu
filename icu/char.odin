package icu

when ODIN_OS == .Windows {
	foreign import libicu "system:icu.lib"
} else {
	foreign import libicu "system:icuuc"
}

CHAR_MAX_VALUE :: 0x10ffff
CHAR_MIN_VALUE :: 0

GC_C_MASK  :: GC_MASK{.CN, .CC, .CF, .CO, .CS}
GC_LC_MASK :: GC_MASK{.LU, .LL, .LT}
GC_L_MASK  :: GC_MASK{.LU, .LL, .LT, .LM, .LO}
GC_M_MASK  :: GC_MASK{.MN, .ME, .MC}
GC_N_MASK  :: GC_MASK{.ND, .NL, .NO}
GC_P_MASK  :: GC_MASK{.PD, .PS, .PE, .PC, .PO, .PI, .PF}
GC_S_MASK  :: GC_MASK{.SM, .SC, .SK, .SO}
GC_Z_MASK  :: GC_MASK{.ZS, .ZL, .ZP}

NO_NUMERIC_VALUE :: f64(-123456789.)

BlockCode :: enum i32 {
	NO_BLOCK                                       =   0, /*[none]*/ /* Special range indicating No_Block */
	BASIC_LATIN                                    =   1, /*[0000]*/
	LATIN_1_SUPPLEMENT                             =   2, /*[0080]*/
	LATIN_EXTENDED_A                               =   3, /*[0100]*/
	LATIN_EXTENDED_B                               =   4, /*[0180]*/
	IPA_EXTENSIONS                                 =   5, /*[0250]*/
	SPACING_MODIFIER_LETTERS                       =   6, /*[02B0]*/
	COMBINING_DIACRITICAL_MARKS                    =   7, /*[0300]*/
	GREEK                                          =   8, /*[0370]*/
	CYRILLIC                                       =   9, /*[0400]*/
	ARMENIAN                                       =  10, /*[0530]*/
	HEBREW                                         =  11, /*[0590]*/
	ARABIC                                         =  12, /*[0600]*/
	SYRIAC                                         =  13, /*[0700]*/
	THAANA                                         =  14, /*[0780]*/
	DEVANAGARI                                     =  15, /*[0900]*/
	BENGALI                                        =  16, /*[0980]*/
	GURMUKHI                                       =  17, /*[0A00]*/
	GUJARATI                                       =  18, /*[0A80]*/
	ORIYA                                          =  19, /*[0B00]*/
	TAMIL                                          =  20, /*[0B80]*/
	TELUGU                                         =  21, /*[0C00]*/
	KANNADA                                        =  22, /*[0C80]*/
	MALAYALAM                                      =  23, /*[0D00]*/
	SINHALA                                        =  24, /*[0D80]*/
	THAI                                           =  25, /*[0E00]*/
	LAO                                            =  26, /*[0E80]*/
	TIBETAN                                        =  27, /*[0F00]*/
	MYANMAR                                        =  28, /*[1000]*/
	GEORGIAN                                       =  29, /*[10A0]*/
	HANGUL_JAMO                                    =  30, /*[1100]*/
	ETHIOPIC                                       =  31, /*[1200]*/
	CHEROKEE                                       =  32, /*[13A0]*/
	UNIFIED_CANADIAN_ABORIGINAL_SYLLABICS          =  33, /*[1400]*/
	OGHAM                                          =  34, /*[1680]*/
	RUNIC                                          =  35, /*[16A0]*/
	KHMER                                          =  36, /*[1780]*/
	MONGOLIAN                                      =  37, /*[1800]*/
	LATIN_EXTENDED_ADDITIONAL                      =  38, /*[1E00]*/
	GREEK_EXTENDED                                 =  39, /*[1F00]*/
	GENERAL_PUNCTUATION                            =  40, /*[2000]*/
	SUPERSCRIPTS_AND_SUBSCRIPTS                    =  41, /*[2070]*/
	CURRENCY_SYMBOLS                               =  42, /*[20A0]*/
	COMBINING_MARKS_FOR_SYMBOLS                    =  43, /*[20D0]*/
	LETTERLIKE_SYMBOLS                             =  44, /*[2100]*/
	NUMBER_FORMS                                   =  45, /*[2150]*/
	ARROWS                                         =  46, /*[2190]*/
	MATHEMATICAL_OPERATORS                         =  47, /*[2200]*/
	MISCELLANEOUS_TECHNICAL                        =  48, /*[2300]*/
	CONTROL_PICTURES                               =  49, /*[2400]*/
	OPTICAL_CHARACTER_RECOGNITION                  =  50, /*[2440]*/
	ENCLOSED_ALPHANUMERICS                         =  51, /*[2460]*/
	BOX_DRAWING                                    =  52, /*[2500]*/
	BLOCK_ELEMENTS                                 =  53, /*[2580]*/
	GEOMETRIC_SHAPES                               =  54, /*[25A0]*/
	MISCELLANEOUS_SYMBOLS                          =  55, /*[2600]*/
	DINGBATS                                       =  56, /*[2700]*/
	BRAILLE_PATTERNS                               =  57, /*[2800]*/
	CJK_RADICALS_SUPPLEMENT                        =  58, /*[2E80]*/
	KANGXI_RADICALS                                =  59, /*[2F00]*/
	IDEOGRAPHIC_DESCRIPTION_CHARACTERS             =  60, /*[2FF0]*/
	CJK_SYMBOLS_AND_PUNCTUATION                    =  61, /*[3000]*/
	HIRAGANA                                       =  62, /*[3040]*/
	KATAKANA                                       =  63, /*[30A0]*/
	BOPOMOFO                                       =  64, /*[3100]*/
	HANGUL_COMPATIBILITY_JAMO                      =  65, /*[3130]*/
	KANBUN                                         =  66, /*[3190]*/
	BOPOMOFO_EXTENDED                              =  67, /*[31A0]*/
	ENCLOSED_CJK_LETTERS_AND_MONTHS                =  68, /*[3200]*/
	CJK_COMPATIBILITY                              =  69, /*[3300]*/
	CJK_UNIFIED_IDEOGRAPHS_EXTENSION_A             =  70, /*[3400]*/
	CJK_UNIFIED_IDEOGRAPHS                         =  71, /*[4E00]*/
	YI_SYLLABLES                                   =  72, /*[A000]*/
	YI_RADICALS                                    =  73, /*[A490]*/
	HANGUL_SYLLABLES                               =  74, /*[AC00]*/
	HIGH_SURROGATES                                =  75, /*[D800]*/
	HIGH_PRIVATE_USE_SURROGATES                    =  76, /*[DB80]*/
	LOW_SURROGATES                                 =  77, /*[DC00]*/
	PRIVATE_USE_AREA                               =  78, /*[E000]*/
	PRIVATE_USE                                    =  PRIVATE_USE_AREA,
	CJK_COMPATIBILITY_IDEOGRAPHS                   =  79, /*[F900]*/
	ALPHABETIC_PRESENTATION_FORMS                  =  80, /*[FB00]*/
	ARABIC_PRESENTATION_FORMS_A                    =  81, /*[FB50]*/
	COMBINING_HALF_MARKS                           =  82, /*[FE20]*/
	CJK_COMPATIBILITY_FORMS                        =  83, /*[FE30]*/
	SMALL_FORM_VARIANTS                            =  84, /*[FE50]*/
	ARABIC_PRESENTATION_FORMS_B                    =  85, /*[FE70]*/
	SPECIALS                                       =  86, /*[FFF0]*/
	HALFWIDTH_AND_FULLWIDTH_FORMS                  =  87, /*[FF00]*/
	OLD_ITALIC                                     =  88, /*[10300]*/
	GOTHIC                                         =  89, /*[10330]*/
	DESERET                                        =  90, /*[10400]*/
	BYZANTINE_MUSICAL_SYMBOLS                      =  91, /*[1D000]*/
	MUSICAL_SYMBOLS                                =  92, /*[1D100]*/
	MATHEMATICAL_ALPHANUMERIC_SYMBOLS              =  93, /*[1D400]*/
	CJK_UNIFIED_IDEOGRAPHS_EXTENSION_B             =  94, /*[20000]*/
	CJK_COMPATIBILITY_IDEOGRAPHS_SUPPLEMENT        =  95, /*[2F800]*/
	TAGS                                           =  96, /*[E0000]*/
	CYRILLIC_SUPPLEMENT                            =  97, /*[0500]*/
	CYRILLIC_SUPPLEMENTARY                         =  CYRILLIC_SUPPLEMENT,
	TAGALOG                                        =  98, /*[1700]*/
	HANUNOO                                        =  99, /*[1720]*/
	BUHID                                          = 100, /*[1740]*/
	TAGBANWA                                       = 101, /*[1760]*/
	MISCELLANEOUS_MATHEMATICAL_SYMBOLS_A           = 102, /*[27C0]*/
	SUPPLEMENTAL_ARROWS_A                          = 103, /*[27F0]*/
	SUPPLEMENTAL_ARROWS_B                          = 104, /*[2900]*/
	MISCELLANEOUS_MATHEMATICAL_SYMBOLS_B           = 105, /*[2980]*/
	SUPPLEMENTAL_MATHEMATICAL_OPERATORS            = 106, /*[2A00]*/
	KATAKANA_PHONETIC_EXTENSIONS                   = 107, /*[31F0]*/
	VARIATION_SELECTORS                            = 108, /*[FE00]*/
	SUPPLEMENTARY_PRIVATE_USE_AREA_A               = 109, /*[F0000]*/
	SUPPLEMENTARY_PRIVATE_USE_AREA_B               = 110, /*[100000]*/
	LIMBU                                          = 111, /*[1900]*/
	TAI_LE                                         = 112, /*[1950]*/
	KHMER_SYMBOLS                                  = 113, /*[19E0]*/
	PHONETIC_EXTENSIONS                            = 114, /*[1D00]*/
	MISCELLANEOUS_SYMBOLS_AND_ARROWS               = 115, /*[2B00]*/
	YIJING_HEXAGRAM_SYMBOLS                        = 116, /*[4DC0]*/
	LINEAR_B_SYLLABARY                             = 117, /*[10000]*/
	LINEAR_B_IDEOGRAMS                             = 118, /*[10080]*/
	AEGEAN_NUMBERS                                 = 119, /*[10100]*/
	UGARITIC                                       = 120, /*[10380]*/
	SHAVIAN                                        = 121, /*[10450]*/
	OSMANYA                                        = 122, /*[10480]*/
	CYPRIOT_SYLLABARY                              = 123, /*[10800]*/
	TAI_XUAN_JING_SYMBOLS                          = 124, /*[1D300]*/
	VARIATION_SELECTORS_SUPPLEMENT                 = 125, /*[E0100]*/
	ANCIENT_GREEK_MUSICAL_NOTATION                 = 126, /*[1D200]*/
	ANCIENT_GREEK_NUMBERS                          = 127, /*[10140]*/
	ARABIC_SUPPLEMENT                              = 128, /*[0750]*/
	BUGINESE                                       = 129, /*[1A00]*/
	CJK_STROKES                                    = 130, /*[31C0]*/
	COMBINING_DIACRITICAL_MARKS_SUPPLEMENT         = 131, /*[1DC0]*/
	COPTIC                                         = 132, /*[2C80]*/
	ETHIOPIC_EXTENDED                              = 133, /*[2D80]*/
	ETHIOPIC_SUPPLEMENT                            = 134, /*[1380]*/
	GEORGIAN_SUPPLEMENT                            = 135, /*[2D00]*/
	GLAGOLITIC                                     = 136, /*[2C00]*/
	KHAROSHTHI                                     = 137, /*[10A00]*/
	MODIFIER_TONE_LETTERS                          = 138, /*[A700]*/
	NEW_TAI_LUE                                    = 139, /*[1980]*/
	OLD_PERSIAN                                    = 140, /*[103A0]*/
	PHONETIC_EXTENSIONS_SUPPLEMENT                 = 141, /*[1D80]*/
	SUPPLEMENTAL_PUNCTUATION                       = 142, /*[2E00]*/
	SYLOTI_NAGRI                                   = 143, /*[A800]*/
	TIFINAGH                                       = 144, /*[2D30]*/
	VERTICAL_FORMS                                 = 145, /*[FE10]*/
	NKO                                            = 146, /*[07C0]*/
	BALINESE                                       = 147, /*[1B00]*/
	LATIN_EXTENDED_C                               = 148, /*[2C60]*/
	LATIN_EXTENDED_D                               = 149, /*[A720]*/
	PHAGS_PA                                       = 150, /*[A840]*/
	PHOENICIAN                                     = 151, /*[10900]*/
	CUNEIFORM                                      = 152, /*[12000]*/
	CUNEIFORM_NUMBERS_AND_PUNCTUATION              = 153, /*[12400]*/
	COUNTING_ROD_NUMERALS                          = 154, /*[1D360]*/
	SUNDANESE                                      = 155, /*[1B80]*/
	LEPCHA                                         = 156, /*[1C00]*/
	OL_CHIKI                                       = 157, /*[1C50]*/
	CYRILLIC_EXTENDED_A                            = 158, /*[2DE0]*/
	VAI                                            = 159, /*[A500]*/
	CYRILLIC_EXTENDED_B                            = 160, /*[A640]*/
	SAURASHTRA                                     = 161, /*[A880]*/
	KAYAH_LI                                       = 162, /*[A900]*/
	REJANG                                         = 163, /*[A930]*/
	CHAM                                           = 164, /*[AA00]*/
	ANCIENT_SYMBOLS                                = 165, /*[10190]*/
	PHAISTOS_DISC                                  = 166, /*[101D0]*/
	LYCIAN                                         = 167, /*[10280]*/
	CARIAN                                         = 168, /*[102A0]*/
	LYDIAN                                         = 169, /*[10920]*/
	MAHJONG_TILES                                  = 170, /*[1F000]*/
	DOMINO_TILES                                   = 171, /*[1F030]*/
	SAMARITAN                                      = 172, /*[0800]*/
	UNIFIED_CANADIAN_ABORIGINAL_SYLLABICS_EXTENDED = 173, /*[18B0]*/
	TAI_THAM                                       = 174, /*[1A20]*/
	VEDIC_EXTENSIONS                               = 175, /*[1CD0]*/
	LISU                                           = 176, /*[A4D0]*/
	BAMUM                                          = 177, /*[A6A0]*/
	COMMON_INDIC_NUMBER_FORMS                      = 178, /*[A830]*/
	DEVANAGARI_EXTENDED                            = 179, /*[A8E0]*/
	HANGUL_JAMO_EXTENDED_A                         = 180, /*[A960]*/
	JAVANESE                                       = 181, /*[A980]*/
	MYANMAR_EXTENDED_A                             = 182, /*[AA60]*/
	TAI_VIET                                       = 183, /*[AA80]*/
	MEETEI_MAYEK                                   = 184, /*[ABC0]*/
	HANGUL_JAMO_EXTENDED_B                         = 185, /*[D7B0]*/
	IMPERIAL_ARAMAIC                               = 186, /*[10840]*/
	OLD_SOUTH_ARABIAN                              = 187, /*[10A60]*/
	AVESTAN                                        = 188, /*[10B00]*/
	INSCRIPTIONAL_PARTHIAN                         = 189, /*[10B40]*/
	INSCRIPTIONAL_PAHLAVI                          = 190, /*[10B60]*/
	OLD_TURKIC                                     = 191, /*[10C00]*/
	RUMI_NUMERAL_SYMBOLS                           = 192, /*[10E60]*/
	KAITHI                                         = 193, /*[11080]*/
	EGYPTIAN_HIEROGLYPHS                           = 194, /*[13000]*/
	ENCLOSED_ALPHANUMERIC_SUPPLEMENT               = 195, /*[1F100]*/
	ENCLOSED_IDEOGRAPHIC_SUPPLEMENT                = 196, /*[1F200]*/
	CJK_UNIFIED_IDEOGRAPHS_EXTENSION_C             = 197, /*[2A700]*/
	MANDAIC                                        = 198, /*[0840]*/
	BATAK                                          = 199, /*[1BC0]*/
	ETHIOPIC_EXTENDED_A                            = 200, /*[AB00]*/
	BRAHMI                                         = 201, /*[11000]*/
	BAMUM_SUPPLEMENT                               = 202, /*[16800]*/
	KANA_SUPPLEMENT                                = 203, /*[1B000]*/
	PLAYING_CARDS                                  = 204, /*[1F0A0]*/
	MISCELLANEOUS_SYMBOLS_AND_PICTOGRAPHS          = 205, /*[1F300]*/
	EMOTICONS                                      = 206, /*[1F600]*/
	TRANSPORT_AND_MAP_SYMBOLS                      = 207, /*[1F680]*/
	ALCHEMICAL_SYMBOLS                             = 208, /*[1F700]*/
	CJK_UNIFIED_IDEOGRAPHS_EXTENSION_D             = 209, /*[2B740]*/
	ARABIC_EXTENDED_A                              = 210, /*[08A0]*/
	ARABIC_MATHEMATICAL_ALPHABETIC_SYMBOLS         = 211, /*[1EE00]*/
	CHAKMA                                         = 212, /*[11100]*/
	MEETEI_MAYEK_EXTENSIONS                        = 213, /*[AAE0]*/
	MEROITIC_CURSIVE                               = 214, /*[109A0]*/
	MEROITIC_HIEROGLYPHS                           = 215, /*[10980]*/
	MIAO                                           = 216, /*[16F00]*/
	SHARADA                                        = 217, /*[11180]*/
	SORA_SOMPENG                                   = 218, /*[110D0]*/
	SUNDANESE_SUPPLEMENT                           = 219, /*[1CC0]*/
	TAKRI                                          = 220, /*[11680]*/
	BASSA_VAH                                      = 221, /*[16AD0]*/
	CAUCASIAN_ALBANIAN                             = 222, /*[10530]*/
	COPTIC_EPACT_NUMBERS                           = 223, /*[102E0]*/
	COMBINING_DIACRITICAL_MARKS_EXTENDED           = 224, /*[1AB0]*/
	DUPLOYAN                                       = 225, /*[1BC00]*/
	ELBASAN                                        = 226, /*[10500]*/
	GEOMETRIC_SHAPES_EXTENDED                      = 227, /*[1F780]*/
	GRANTHA                                        = 228, /*[11300]*/
	KHOJKI                                         = 229, /*[11200]*/
	KHUDAWADI                                      = 230, /*[112B0]*/
	LATIN_EXTENDED_E                               = 231, /*[AB30]*/
	LINEAR_A                                       = 232, /*[10600]*/
	MAHAJANI                                       = 233, /*[11150]*/
	MANICHAEAN                                     = 234, /*[10AC0]*/
	MENDE_KIKAKUI                                  = 235, /*[1E800]*/
	MODI                                           = 236, /*[11600]*/
	MRO                                            = 237, /*[16A40]*/
	MYANMAR_EXTENDED_B                             = 238, /*[A9E0]*/
	NABATAEAN                                      = 239, /*[10880]*/
	OLD_NORTH_ARABIAN                              = 240, /*[10A80]*/
	OLD_PERMIC                                     = 241, /*[10350]*/
	ORNAMENTAL_DINGBATS                            = 242, /*[1F650]*/
	PAHAWH_HMONG                                   = 243, /*[16B00]*/
	PALMYRENE                                      = 244, /*[10860]*/
	PAU_CIN_HAU                                    = 245, /*[11AC0]*/
	PSALTER_PAHLAVI                                = 246, /*[10B80]*/
	SHORTHAND_FORMAT_CONTROLS                      = 247, /*[1BCA0]*/
	SIDDHAM                                        = 248, /*[11580]*/
	SINHALA_ARCHAIC_NUMBERS                        = 249, /*[111E0]*/
	SUPPLEMENTAL_ARROWS_C                          = 250, /*[1F800]*/
	TIRHUTA                                        = 251, /*[11480]*/
	WARANG_CITI                                    = 252, /*[118A0]*/
	AHOM                                           = 253, /*[11700]*/
	ANATOLIAN_HIEROGLYPHS                          = 254, /*[14400]*/
	CHEROKEE_SUPPLEMENT                            = 255, /*[AB70]*/
	CJK_UNIFIED_IDEOGRAPHS_EXTENSION_E             = 256, /*[2B820]*/
	EARLY_DYNASTIC_CUNEIFORM                       = 257, /*[12480]*/
	HATRAN                                         = 258, /*[108E0]*/
	MULTANI                                        = 259, /*[11280]*/
	OLD_HUNGARIAN                                  = 260, /*[10C80]*/
	SUPPLEMENTAL_SYMBOLS_AND_PICTOGRAPHS           = 261, /*[1F900]*/
	SUTTON_SIGNWRITING                             = 262, /*[1D800]*/
	ADLAM                                          = 263, /*[1E900]*/
	BHAIKSUKI                                      = 264, /*[11C00]*/
	CYRILLIC_EXTENDED_C                            = 265, /*[1C80]*/
	GLAGOLITIC_SUPPLEMENT                          = 266, /*[1E000]*/
	IDEOGRAPHIC_SYMBOLS_AND_PUNCTUATION            = 267, /*[16FE0]*/
	MARCHEN                                        = 268, /*[11C70]*/
	MONGOLIAN_SUPPLEMENT                           = 269, /*[11660]*/
	NEWA                                           = 270, /*[11400]*/
	OSAGE                                          = 271, /*[104B0]*/
	TANGUT                                         = 272, /*[17000]*/
	TANGUT_COMPONENTS                              = 273, /*[18800]*/
	CJK_UNIFIED_IDEOGRAPHS_EXTENSION_F             = 274, /*[2CEB0]*/
	KANA_EXTENDED_A                                = 275, /*[1B100]*/
	MASARAM_GONDI                                  = 276, /*[11D00]*/
	NUSHU                                          = 277, /*[1B170]*/
	SOYOMBO                                        = 278, /*[11A50]*/
	SYRIAC_SUPPLEMENT                              = 279, /*[0860]*/
	ZANABAZAR_SQUARE                               = 280, /*[11A00]*/
	CHESS_SYMBOLS                                  = 281, /*[1FA00]*/
	DOGRA                                          = 282, /*[11800]*/
	GEORGIAN_EXTENDED                              = 283, /*[1C90]*/
	GUNJALA_GONDI                                  = 284, /*[11D60]*/
	HANIFI_ROHINGYA                                = 285, /*[10D00]*/
	INDIC_SIYAQ_NUMBERS                            = 286, /*[1EC70]*/
	MAKASAR                                        = 287, /*[11EE0]*/
	MAYAN_NUMERALS                                 = 288, /*[1D2E0]*/
	MEDEFAIDRIN                                    = 289, /*[16E40]*/
	OLD_SOGDIAN                                    = 290, /*[10F00]*/
	SOGDIAN                                        = 291, /*[10F30]*/
	EGYPTIAN_HIEROGLYPH_FORMAT_CONTROLS            = 292, /*[13430]*/
	ELYMAIC                                        = 293, /*[10FE0]*/
	NANDINAGARI                                    = 294, /*[119A0]*/
	NYIAKENG_PUACHUE_HMONG                         = 295, /*[1E100]*/
	OTTOMAN_SIYAQ_NUMBERS                          = 296, /*[1ED00]*/
	SMALL_KANA_EXTENSION                           = 297, /*[1B130]*/
	SYMBOLS_AND_PICTOGRAPHS_EXTENDED_A             = 298, /*[1FA70]*/
	TAMIL_SUPPLEMENT                               = 299, /*[11FC0]*/
	WANCHO                                         = 300, /*[1E2C0]*/
	INVALID_CODE                                   = -1,
}

CharCategory :: enum i8 {
	UNASSIGNED             = 0,
	GENERAL_OTHER_TYPES    = 0,
	UPPERCASE_LETTER       = 1,
	LOWERCASE_LETTER       = 2,
	TITLECASE_LETTER       = 3,
	MODIFIER_LETTER        = 4,
	OTHER_LETTER           = 5,
	NON_SPACING_MARK       = 6,
	ENCLOSING_MARK         = 7,
	COMBINING_SPACING_MARK = 8,
	DECIMAL_DIGIT_NUMBER   = 9,
	LETTER_NUMBER          = 10,
	OTHER_NUMBER           = 11,
	SPACE_SEPARATOR        = 12,
	LINE_SEPARATOR         = 13,
	PARAGRAPH_SEPARATOR    = 14,
	CONTROL_CHAR           = 15,
	FORMAT_CHAR            = 16,
	PRIVATE_USE_CHAR       = 17,
	SURROGATE              = 18,
	DASH_PUNCTUATION       = 19,
	START_PUNCTUATION      = 20,
	END_PUNCTUATION        = 21,
	CONNECTOR_PUNCTUATION  = 22,
	OTHER_PUNCTUATION      = 23,
	MATH_SYMBOL            = 24,
	CURRENCY_SYMBOL        = 25,
	MODIFIER_SYMBOL        = 26,
	OTHER_SYMBOL           = 27,
	INITIAL_PUNCTUATION    = 28,
	FINAL_PUNCTUATION      = 29,
	CHAR_CATEGORY_COUNT,
}

CharDirection :: enum i32 {
	LEFT_TO_RIGHT              = 0,
	RIGHT_TO_LEFT              = 1,
	EUROPEAN_NUMBER            = 2,
	EUROPEAN_NUMBER_SEPARATOR  = 3,
	EUROPEAN_NUMBER_TERMINATOR = 4,
	ARABIC_NUMBER              = 5,
	COMMON_NUMBER_SEPARATOR    = 6,
	BLOCK_SEPARATOR            = 7,
	SEGMENT_SEPARATOR          = 8,
	WHITE_SPACE_NEUTRAL        = 9,
	OTHER_NEUTRAL              = 10,
	LEFT_TO_RIGHT_EMBEDDING    = 11,
	LEFT_TO_RIGHT_OVERRIDE     = 12,
	RIGHT_TO_LEFT_ARABIC       = 13,
	RIGHT_TO_LEFT_EMBEDDING    = 14,
	RIGHT_TO_LEFT_OVERRIDE     = 15,
	POP_DIRECTIONAL_FORMAT     = 16,
	DIR_NON_SPACING_MARK       = 17,
	BOUNDARY_NEUTRAL           = 18,
	FIRST_STRONG_ISOLATE       = 19,
	LEFT_TO_RIGHT_ISOLATE      = 20,
	RIGHT_TO_LEFT_ISOLATE      = 21,
	POP_DIRECTIONAL_ISOLATE    = 22,
}

CharEnumTypeRange :: #type proc "c" (_context: rawptr, start: Char32, limit: Char32, type: CharCategory) -> bool

CharNameChoice :: enum i32 {
	UNICODE_CHAR_NAME,
	EXTENDED_CHAR_NAME = UNICODE_CHAR_NAME+2,
	CHAR_NAME_ALIAS,
}

EnumCharNamesFn :: #type proc "c" (
	_context:   rawptr,
	code:       Char32,
	nameChoice: CharNameChoice,
	name:       cstring,
	length:     i32,
) -> bool

GC :: enum i32 {
	CN = cast(i32)CharCategory.GENERAL_OTHER_TYPES,
	LU = cast(i32)CharCategory.UPPERCASE_LETTER,
	LL = cast(i32)CharCategory.LOWERCASE_LETTER,
	LT = cast(i32)CharCategory.TITLECASE_LETTER,
	LM = cast(i32)CharCategory.MODIFIER_LETTER,
	LO = cast(i32)CharCategory.OTHER_LETTER,
	MN = cast(i32)CharCategory.NON_SPACING_MARK,
	ME = cast(i32)CharCategory.ENCLOSING_MARK,
	MC = cast(i32)CharCategory.COMBINING_SPACING_MARK,
	ND = cast(i32)CharCategory.DECIMAL_DIGIT_NUMBER,
	NL = cast(i32)CharCategory.LETTER_NUMBER,
	NO = cast(i32)CharCategory.OTHER_NUMBER,
	ZS = cast(i32)CharCategory.SPACE_SEPARATOR,
	ZL = cast(i32)CharCategory.LINE_SEPARATOR,
	ZP = cast(i32)CharCategory.PARAGRAPH_SEPARATOR,
	CC = cast(i32)CharCategory.CONTROL_CHAR,
	CF = cast(i32)CharCategory.FORMAT_CHAR,
	CO = cast(i32)CharCategory.PRIVATE_USE_CHAR,
	CS = cast(i32)CharCategory.SURROGATE,
	PD = cast(i32)CharCategory.DASH_PUNCTUATION,
	PS = cast(i32)CharCategory.START_PUNCTUATION,
	PE = cast(i32)CharCategory.END_PUNCTUATION,
	PC = cast(i32)CharCategory.CONNECTOR_PUNCTUATION,
	PO = cast(i32)CharCategory.OTHER_PUNCTUATION,
	SM = cast(i32)CharCategory.MATH_SYMBOL,
	SC = cast(i32)CharCategory.CURRENCY_SYMBOL,
	SK = cast(i32)CharCategory.MODIFIER_SYMBOL,
	SO = cast(i32)CharCategory.OTHER_SYMBOL,
	PI = cast(i32)CharCategory.INITIAL_PUNCTUATION,
	PF = cast(i32)CharCategory.FINAL_PUNCTUATION,
}
GC_MASK :: distinct bit_set[GC; i32]

Property :: enum i32 {
	ALPHABETIC                      = 0,
	BINARY_START                    = ALPHABETIC,
	ASCII_HEX_DIGIT                 = 1,
	BIDI_CONTROL                    = 2,
	BIDI_MIRRORED                   = 3,
	DASH                            = 4,
	DEFAULT_IGNORABLE_CODE_POINT    = 5,
	DEPRECATED                      = 6,
	DIACRITIC                       = 7,
	EXTENDER                        = 8,
	FULL_COMPOSITION_EXCLUSION      = 9,
	GRAPHEME_BASE                   = 10,
	GRAPHEME_EXTEND                 = 11,
	GRAPHEME_LINK                   = 12,
	HEX_DIGIT                       = 13,
	HYPHEN                          = 14,
	ID_CONTINUE                     = 15,
	ID_START                        = 16,
	IDEOGRAPHIC                     = 17,
	IDS_BINARY_OPERATOR             = 18,
	IDS_TRINARY_OPERATOR            = 19,
	JOIN_CONTROL                    = 20,
	LOGICAL_ORDER_EXCEPTION         = 21,
	LOWERCASE                       = 22,
	MATH                            = 23,
	NONCHARACTER_CODE_POINT         = 24,
	QUOTATION_MARK                  = 25,
	RADICAL                         = 26,
	SOFT_DOTTED                     = 27,
	TERMINAL_PUNCTUATION            = 28,
	UNIFIED_IDEOGRAPH               = 29,
	UPPERCASE                       = 30,
	WHITE_SPACE                     = 31,
	XID_CONTINUE                    = 32,
	XID_START                       = 33,
	CASE_SENSITIVE                  = 34,
	S_TERM                          = 35,
	VARIATION_SELECTOR              = 36,
	NFD_INERT                       = 37,
	NFKD_INERT                      = 38,
	NFC_INERT                       = 39,
	NFKC_INERT                      = 40,
	SEGMENT_STARTER                 = 41,
	PATTERN_SYNTAX                  = 42,
	PATTERN_WHITE_SPACE             = 43,
	POSIX_ALNUM                     = 44,
	POSIX_BLANK                     = 45,
	POSIX_GRAPH                     = 46,
	POSIX_PRINT                     = 47,
	POSIX_XDIGIT                    = 48,
	CASED                           = 49,
	CASE_IGNORABLE                  = 50,
	CHANGES_WHEN_LOWERCASED         = 51,
	CHANGES_WHEN_UPPERCASED         = 52,
	CHANGES_WHEN_TITLECASED         = 53,
	CHANGES_WHEN_CASEFOLDED         = 54,
	CHANGES_WHEN_CASEMAPPED         = 55,
	CHANGES_WHEN_NFKC_CASEFOLDED    = 56,
	EMOJI                           = 57,
	EMOJI_PRESENTATION              = 58,
	EMOJI_MODIFIER                  = 59,
	EMOJI_MODIFIER_BASE             = 60,
	EMOJI_COMPONENT                 = 61,
	REGIONAL_INDICATOR              = 62,
	PREPENDED_CONCATENATION_MARK    = 63,
	EXTENDED_PICTOGRAPHIC           = 64,
	BIDI_CLASS                      = 0x1000,
	INT_START                       = BIDI_CLASS,
	BLOCK                           = 0x1001,
	CANONICAL_COMBINING_CLASS       = 0x1002,
	DECOMPOSITION_TYPE              = 0x1003,
	EAST_ASIAN_WIDTH                = 0x1004,
	GENERAL_CATEGORY                = 0x1005,
	JOINING_GROUP                   = 0x1006,
	JOINING_TYPE                    = 0x1007,
	LINE_BREAK                      = 0x1008,
	NUMERIC_TYPE                    = 0x1009,
	SCRIPT                          = 0x100A,
	HANGUL_SYLLABLE_TYPE            = 0x100B,
	NFD_QUICK_CHECK                 = 0x100C,
	NFKD_QUICK_CHECK                = 0x100D,
	NFC_QUICK_CHECK                 = 0x100E,
	NFKC_QUICK_CHECK                = 0x100F,
	LEAD_CANONICAL_COMBINING_CLASS  = 0x1010,
	TRAIL_CANONICAL_COMBINING_CLASS = 0x1011,
	GRAPHEME_CLUSTER_BREAK          = 0x1012,
	SENTENCE_BREAK                  = 0x1013,
	WORD_BREAK                      = 0x1014,
	BIDI_PAIRED_BRACKET_TYPE        = 0x1015,
	INDIC_POSITIONAL_CATEGORY       = 0x1016,
	INDIC_SYLLABIC_CATEGORY         = 0x1017,
	VERTICAL_ORIENTATION            = 0x1018,
	GENERAL_CATEGORY_MASK           = 0x2000,
	MASK_START                      = GENERAL_CATEGORY_MASK,
	NUMERIC_VALUE                   = 0x3000,
	DOUBLE_START                    = NUMERIC_VALUE,
	AGE                             = 0x4000,
	STRING_START                    = AGE,
	BIDI_MIRRORING_GLYPH            = 0x4001,
	CASE_FOLDING                    = 0x4002,
	LOWERCASE_MAPPING               = 0x4004,
	NAME                            = 0x4005,
	SIMPLE_CASE_FOLDING             = 0x4006,
	SIMPLE_LOWERCASE_MAPPING        = 0x4007,
	SIMPLE_TITLECASE_MAPPING        = 0x4008,
	SIMPLE_UPPERCASE_MAPPING        = 0x4009,
	TITLECASE_MAPPING               = 0x400A,
	UPPERCASE_MAPPING               = 0x400C,
	BIDI_PAIRED_BRACKET             = 0x400D,
	SCRIPT_EXTENSIONS               = 0x7000,
	OTHER_PROPERTY_START            = SCRIPT_EXTENSIONS,
	INVALID_CODE                    = -1,
}

PropertyNameChoice :: enum i32 {
	SHORT_PROPERTY_NAME,
	LONG_PROPERTY_NAME,
}

@(default_calling_convention="c", link_prefix="u_", link_suffix=LINK_VERSION)
foreign libicu {
	@(link_name="ublock_getCode")
	block_getCode          :: proc(c: Char32) -> BlockCode ---
	charAge                :: proc(c: Char32, versionArray: ^VersionInfo) ---
	charDigitValue         :: proc(c: Char32) -> i32 ---
	charDirection          :: proc(c: Char32) -> CharDirection ---
	charFromName           :: proc(nameChoice: CharNameChoice, name: cstring, pErrorCode: ^ErrorCode) -> Char32 ---
	charMirror             :: proc(c: Char32) -> Char32 ---
	charName               :: proc(
		code:         Char32,
		nameChoice:   CharNameChoice,
		buffer:       [^]u8,
		bufferLength: i32,
		pErrorCode:   ^ErrorCode,
	) -> i32 ---
	charType               :: proc(c: Char32) -> CharCategory ---
	digit                  :: proc(ch: Char32, radix: i8) -> i32 ---
	enumCharNames          :: proc(
		start:      Char32,
		limit:      Char32,
		fn:         EnumCharNamesFn,
		_context:   rawptr,
		nameChoice: CharNameChoice,
		pErrorCode: ^ErrorCode,
	) ---
	enumCharTypes          :: proc(enumRange: ^CharEnumTypeRange, _context: rawptr) ---
	foldCase               :: proc(c: Char32, options: StringOptions) -> Char32 ---
	forDigit               :: proc(digit: i32, radix: i8) -> Char32 ---
	getBidiPairedBracket   :: proc(c: Char32) -> Char32 ---
	getCombiningClass      :: proc(c: Char32) -> u8 ---
	getFC_NFKC_Closure     :: proc(c: Char32, dest: [^]Char, destCapacity: i32, pErrorCode: ^ErrorCode) -> i32 ---
	getIntPropertyMaxValue :: proc(which: Property) -> i32 ---
	getIntPropertyMinValue :: proc(which: Property) -> i32 ---
	getIntPropertyValue    :: proc(c: Char32, which: Property) -> i32 ---
	getNumericValue        :: proc(c: Char32) -> f64 ---
	getPropertyEnum        :: proc(alias: cstring) -> Property ---
	getPropertyName        :: proc(property: Property, nameChoice: PropertyNameChoice) -> cstring ---
	getPropertyValueEnum   :: proc(property: Property, alias: cstring) -> i32 ---
	getPropertyValueName   :: proc(property: Property, value: i32, nameChoice: PropertyNameChoice) -> cstring ---
	getUnicodeVersion      :: proc(versionArray: ^VersionInfo) ---
	hasBinaryProperty      :: proc(c: Char32, which: Property) ---
	isIDIgnorable          :: proc(c: Char32) -> bool ---
	isIDPart               :: proc(c: Char32) -> bool ---
	isIDStart              :: proc(c: Char32) -> bool ---
	isISOControl           :: proc(c: Char32) -> bool ---
	isJavaIDPart           :: proc(c: Char32) -> bool ---
	isJavaIDStart          :: proc(c: Char32) -> bool ---
	isJavaSpaceChar        :: proc(c: Char32) -> bool ---
	isMirrored             :: proc(c: Char32) -> bool ---
	isUAlphabetic          :: proc(c: Char32) -> bool ---
	isULowercase           :: proc(c: Char32) -> bool ---
	isUUppercase           :: proc(c: Char32) -> bool ---
	isUWhiteSpace          :: proc(c: Char32) -> bool ---
	isWhitespace           :: proc(c: Char32) -> bool ---
	isalnum                :: proc(c: Char32) -> bool ---
	isalpha                :: proc(c: Char32) -> bool ---
	isbase                 :: proc(c: Char32) -> bool ---
	isblank                :: proc(c: Char32) -> bool ---
	iscntrl                :: proc(c: Char32) -> bool ---
	isdefined              :: proc(c: Char32) -> bool ---
	isdigit                :: proc(c: Char32) -> bool ---
	isgraph                :: proc(c: Char32) -> bool ---
	islower                :: proc(c: Char32) -> bool ---
	isprint                :: proc(c: Char32) -> bool ---
	ispunct                :: proc(c: Char32) -> bool ---
	isspace                :: proc(c: Char32) -> bool ---
	istitle                :: proc(c: Char32) -> bool ---
	isupper                :: proc(c: Char32) -> bool ---
	isxdigit               :: proc(c: Char32) -> bool ---
	tolower                :: proc(c: Char32) -> Char32 ---
	totitle                :: proc(c: Char32) -> Char32 ---
	toupper                :: proc(c: Char32) -> Char32 ---
}
