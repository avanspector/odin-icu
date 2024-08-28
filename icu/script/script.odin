package icu_script

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

ScriptCode :: enum i32 {
	INVALID_CODE                 = -1,
	COMMON                       =  0,  /* Zyyy */
	INHERITED                    =  1,  /* Zinh */
	ARABIC                       =  2,  /* Arab */
	ARMENIAN                     =  3,  /* Armn */
	BENGALI                      =  4,  /* Beng */
	BOPOMOFO                     =  5,  /* Bopo */
	CHEROKEE                     =  6,  /* Cher */
	COPTIC                       =  7,  /* Copt */
	CYRILLIC                     =  8,  /* Cyrl */
	DESERET                      =  9,  /* Dsrt */
	DEVANAGARI                   = 10,  /* Deva */
	ETHIOPIC                     = 11,  /* Ethi */
	GEORGIAN                     = 12,  /* Geor */
	GOTHIC                       = 13,  /* Goth */
	GREEK                        = 14,  /* Grek */
	GUJARATI                     = 15,  /* Gujr */
	GURMUKHI                     = 16,  /* Guru */
	HAN                          = 17,  /* Hani */
	HANGUL                       = 18,  /* Hang */
	HEBREW                       = 19,  /* Hebr */
	HIRAGANA                     = 20,  /* Hira */
	KANNADA                      = 21,  /* Knda */
	KATAKANA                     = 22,  /* Kana */
	KHMER                        = 23,  /* Khmr */
	LAO                          = 24,  /* Laoo */
	LATIN                        = 25,  /* Latn */
	MALAYALAM                    = 26,  /* Mlym */
	MONGOLIAN                    = 27,  /* Mong */
	MYANMAR                      = 28,  /* Mymr */
	OGHAM                        = 29,  /* Ogam */
	OLD_ITALIC                   = 30,  /* Ital */
	ORIYA                        = 31,  /* Orya */
	RUNIC                        = 32,  /* Runr */
	SINHALA                      = 33,  /* Sinh */
	SYRIAC                       = 34,  /* Syrc */
	TAMIL                        = 35,  /* Taml */
	TELUGU                       = 36,  /* Telu */
	THAANA                       = 37,  /* Thaa */
	THAI                         = 38,  /* Thai */
	TIBETAN                      = 39,  /* Tibt */
	CANADIAN_ABORIGINAL          = 40,  /* Cans */
	UCAS                         = CANADIAN_ABORIGINAL,
	YI                           = 41,  /* Yiii */
	TAGALOG                      = 42,  /* Tglg */
	HANUNOO                      = 43,  /* Hano */
	BUHID                        = 44,  /* Buhd */
	TAGBANWA                     = 45,  /* Tagb */
	BRAILLE                      = 46,  /* Brai */
	CYPRIOT                      = 47,  /* Cprt */
	LIMBU                        = 48,  /* Limb */
	LINEAR_B                     = 49,  /* Linb */
	OSMANYA                      = 50,  /* Osma */
	SHAVIAN                      = 51,  /* Shaw */
	TAI_LE                       = 52,  /* Tale */
	UGARITIC                     = 53,  /* Ugar */
	KATAKANA_OR_HIRAGANA         = 54,  /* Hrkt */
	BUGINESE                     = 55,  /* Bugi */
	GLAGOLITIC                   = 56,  /* Glag */
	KHAROSHTHI                   = 57,  /* Khar */
	SYLOTI_NAGRI                 = 58,  /* Sylo */
	NEW_TAI_LUE                  = 59,  /* Talu */
	TIFINAGH                     = 60,  /* Tfng */
	OLD_PERSIAN                  = 61,  /* Xpeo */
	BALINESE                     = 62,  /* Bali */
	BATAK                        = 63,  /* Batk */
	BLISSYMBOLS                  = 64,  /* Blis */
	BRAHMI                       = 65,  /* Brah */
	CHAM                         = 66,  /* Cham */
	CIRTH                        = 67,  /* Cirt */
	OLD_CHURCH_SLAVONIC_CYRILLIC = 68,  /* Cyrs */
	DEMOTIC_EGYPTIAN             = 69,  /* Egyd */
	HIERATIC_EGYPTIAN            = 70,  /* Egyh */
	EGYPTIAN_HIEROGLYPHS         = 71,  /* Egyp */
	KHUTSURI                     = 72,  /* Geok */
	SIMPLIFIED_HAN               = 73,  /* Hans */
	TRADITIONAL_HAN              = 74,  /* Hant */
	PAHAWH_HMONG                 = 75,  /* Hmng */
	OLD_HUNGARIAN                = 76,  /* Hung */
	HARAPPAN_INDUS               = 77,  /* Inds */
	JAVANESE                     = 78,  /* Java */
	KAYAH_LI                     = 79,  /* Kali */
	LATIN_FRAKTUR                = 80,  /* Latf */
	LATIN_GAELIC                 = 81,  /* Latg */
	LEPCHA                       = 82,  /* Lepc */
	LINEAR_A                     = 83,  /* Lina */
	MANDAIC                      = 84,  /* Mand */
	MANDAEAN                     = MANDAIC,
	MAYAN_HIEROGLYPHS            = 85,  /* Maya */
	MEROITIC_HIEROGLYPHS         = 86,  /* Mero */
	MEROITIC                     = MEROITIC_HIEROGLYPHS,
	NKO                          = 87,  /* Nkoo */
	ORKHON                       = 88,  /* Orkh */
	OLD_PERMIC                   = 89,  /* Perm */
	PHAGS_PA                     = 90,  /* Phag */
	PHOENICIAN                   = 91,  /* Phnx */
	MIAO                         = 92,  /* Plrd */
	PHONETIC_POLLARD             = MIAO,
	RONGORONGO                   = 93,  /* Roro */
	SARATI                       = 94,  /* Sara */
	ESTRANGELO_SYRIAC            = 95,  /* Syre */
	WESTERN_SYRIAC               = 96,  /* Syrj */
	EASTERN_SYRIAC               = 97,  /* Syrn */
	TENGWAR                      = 98,  /* Teng */
	VAI                          = 99,  /* Vaii */
	VISIBLE_SPEECH               = 100, /* Visp */
	CUNEIFORM                    = 101, /* Xsux */
	UNWRITTEN_LANGUAGES          = 102, /* Zxxx */
	UNKNOWN                      = 103, /* Zzzz */
	CARIAN                       = 104, /* Cari */
	JAPANESE                     = 105, /* Jpan */
	LANNA                        = 106, /* Lana */
	LYCIAN                       = 107, /* Lyci */
	LYDIAN                       = 108, /* Lydi */
	OL_CHIKI                     = 109, /* Olck */
	REJANG                       = 110, /* Rjng */
	SAURASHTRA                   = 111, /* Saur */
	SIGN_WRITING                 = 112, /* Sgnw */
	SUNDANESE                    = 113, /* Sund */
	MOON                         = 114, /* Moon */
	MEITEI_MAYEK                 = 115, /* Mtei */
	IMPERIAL_ARAMAIC             = 116, /* Armi */
	AVESTAN                      = 117, /* Avst */
	CHAKMA                       = 118, /* Cakm */
	KOREAN                       = 119, /* Kore */
	KAITHI                       = 120, /* Kthi */
	MANICHAEAN                   = 121, /* Mani */
	INSCRIPTIONAL_PAHLAVI        = 122, /* Phli */
	PSALTER_PAHLAVI              = 123, /* Phlp */
	BOOK_PAHLAVI                 = 124, /* Phlv */
	INSCRIPTIONAL_PARTHIAN       = 125, /* Prti */
	SAMARITAN                    = 126, /* Samr */
	TAI_VIET                     = 127, /* Tavt */
	MATHEMATICAL_NOTATION        = 128, /* Zmth */
	SYMBOLS                      = 129, /* Zsym */
	BAMUM                        = 130, /* Bamu */
	LISU                         = 131, /* Lisu */
	NAKHI_GEBA                   = 132, /* Nkgb */
	OLD_SOUTH_ARABIAN            = 133, /* Sarb */
	BASSA_VAH                    = 134, /* Bass */
	DUPLOYAN                     = 135, /* Dupl */
	ELBASAN                      = 136, /* Elba */
	GRANTHA                      = 137, /* Gran */
	KPELLE                       = 138, /* Kpel */
	LOMA                         = 139, /* Loma */
	MENDE                        = 140, /* Mend */
	MEROITIC_CURSIVE             = 141, /* Merc */
	OLD_NORTH_ARABIAN            = 142, /* Narb */
	NABATAEAN                    = 143, /* Nbat */
	PALMYRENE                    = 144, /* Palm */
	KHUDAWADI                    = 145, /* Sind */
	SINDHI                       = KHUDAWADI,
	WARANG_CITI                  = 146, /* Wara */
	AFAKA                        = 147, /* Afak */
	JURCHEN                      = 148, /* Jurc */
	MRO                          = 149, /* Mroo */
	NUSHU                        = 150, /* Nshu */
	SHARADA                      = 151, /* Shrd */
	SORA_SOMPENG                 = 152, /* Sora */
	TAKRI                        = 153, /* Takr */
	TANGUT                       = 154, /* Tang */
	WOLEAI                       = 155, /* Wole */
	ANATOLIAN_HIEROGLYPHS        = 156, /* Hluw */
	KHOJKI                       = 157, /* Khoj */
	TIRHUTA                      = 158, /* Tirh */
	CAUCASIAN_ALBANIAN           = 159, /* Aghb */
	MAHAJANI                     = 160, /* Mahj */
	AHOM                         = 161, /* Ahom */
	HATRAN                       = 162, /* Hatr */
	MODI                         = 163, /* Modi */
	MULTANI                      = 164, /* Mult */
	PAU_CIN_HAU                  = 165, /* Pauc */
	SIDDHAM                      = 166, /* Sidd */
	ADLAM                        = 167, /* Adlm */
	BHAIKSUKI                    = 168, /* Bhks */
	MARCHEN                      = 169, /* Marc */
	NEWA                         = 170, /* Newa */
	OSAGE                        = 171, /* Osge */
	HAN_WITH_BOPOMOFO            = 172, /* Hanb */
	JAMO                         = 173, /* Jamo */
	SYMBOLS_EMOJI                = 174, /* Zsye */
	MASARAM_GONDI                = 175, /* Gonm */
	SOYOMBO                      = 176, /* Soyo */
	ZANABAZAR_SQUARE             = 177, /* Zanb */
	DOGRA                        = 178, /* Dogr */
	GUNJALA_GONDI                = 179, /* Gong */
	MAKASAR                      = 180, /* Maka */
	MEDEFAIDRIN                  = 181, /* Medf */
	HANIFI_ROHINGYA              = 182, /* Rohg */
	SOGDIAN                      = 183, /* Sogd */
	OLD_SOGDIAN                  = 184, /* Sogo */
	ELYMAIC                      = 185, /* Elym */
	NYIAKENG_PUACHUE_HMONG       = 186, /* Hmnp */
	NANDINAGARI                  = 187, /* Nand */
	WANCHO                       = 188, /* Wcho */
}

ScriptUsage :: enum i32 {
	NOT_ENCODED,
	UNKNOWN,
	EXCLUDED,
	LIMITED_USE,
	ASPIRATIONAL,
	RECOMMENDED,
}

@(default_calling_convention="c", link_prefix="uscript_", link_suffix=LINK_VERSION)
foreign libicu {
	breaksBetweenLetters :: proc(script: ScriptCode) -> Bool ---
	getCode              :: proc(
		nameOrAbbrOrLocale: cstring,
		fillIn:             [^]ScriptCode,
		capacity:           i32,
		err:                ^ErrorCode,
	) -> i32 ---
	getName              :: proc(scriptCode: ScriptCode) -> cstring ---
	getSampleString      :: proc(
		script:     ScriptCode,
		dest:       [^]Char,
		capacity:   i32,
		pErrorCode: ^ErrorCode,
	) -> i32 ---
	getScript            :: proc(codepoint: Char32, err: ^ErrorCode) -> ScriptCode ---
	getScriptExtensions  :: proc(
		c:         Char32,
		scripts:   [^]ScriptCode,
		capacity:  i32,
		errorCode: ^ErrorCode,
	) -> i32 ---
	getShortName         :: proc(scriptCode: ScriptCode) -> cstring ---
	getUsage             :: proc(script: ScriptCode) -> ScriptUsage ---
	hasScript            :: proc(c: Char32, sc: ScriptCode) -> Bool ---
	isCased              :: proc(script: ScriptCode) -> Bool ---
	isRightToLeft        :: proc(script: ScriptCode) -> Bool ---
}
