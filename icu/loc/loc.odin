package icu_loc

import u     ".."
import uenum "../enum"

LINK_VERSION :: u.LINK_VERSION

when ODIN_OS == .Windows {
	foreign import libicu "system:icu.lib"
} else {
	foreign import libicu "system:icuuc"
}

Char        :: u.Char
Enumeration :: uenum.Enumeration
ErrorCode   :: u.ErrorCode

CANADA              :: "en_CA"
CANADA_FRENCH       :: "fr_CA"
CHINA               :: "zh_CN"
CHINESE             :: "zh"
ENGLISH             :: "en"
FRANCE              :: "fr_FR"
FRENCH              :: "fr"
GERMAN              :: "de"
GERMANY             :: "de_DE"
ITALIAN             :: "it"
ITALY               :: "it_IT"
JAPAN               :: "ja_JP"
JAPANESE            :: "ja"
KOREA               :: "ko_KR"
KOREAN              :: "ko"
PRC                 :: "zh_CN"
SIMPLIFIED_CHINESE  :: "zh_CN"
TAIWAN              :: "zh_TW"
TRADITIONAL_CHINESE :: "zh_TW"
UK                  :: "en_GB"
US                  :: "en_US"

COUNTRY_CAPACITY               :: 4
FULLNAME_CAPACITY              :: 157
KEYWORDS_CAPACITY              :: 96
KEYWORD_AND_VALUES_CAPACITY    :: 100
KEYWORD_ASSIGN                 :: '='
KEYWORD_ASSIGN_UNICODE         :: 0x3D
KEYWORD_ITEM_SEPARATOR         :: ';'
KEYWORD_ITEM_SEPARATOR_UNICODE :: 0x3B
KEYWORD_SEPARATOR              :: '@'
KEYWORD_SEPARATOR_UNICODE      :: 0x40
LANG_CAPACITY                  :: 12
SCRIPT_CAPACITY                :: 6

AcceptResult :: enum i32 {
	FAILED   = 0,
	VALID    = 1,
	FALLBACK = 2,
}

DataLocaleType :: enum i32 {
	ACTUAL_LOCALE = 0,
	VALID_LOCALE  = 1,
}

LayoutType :: enum i32 {
	LTR = 0, 
	RTL = 1,
	TTB = 2,
	BTT = 3,
	UNKNOWN,
}

@(default_calling_convention="c", link_prefix="uloc_", link_suffix=LINK_VERSION)
foreign libicu {
	acceptLanguage          :: proc(
		result:           [^]u8,
		resultAvailable:  i32,
		outResult:        ^AcceptResult,
		acceptList:       [^]cstring,
		acceptListCount:  i32,
		availableLocales: ^Enumeration,
		status:           ^ErrorCode,
	) -> i32 ---
	acceptLanguageFromHTTP  :: proc(
		result:             [^]u8,
		resultAvailable:    i32,
		outResult:          ^AcceptResult,
		httpAcceptLanguage: cstring,
		availableLocales:   ^Enumeration,
		status:             ^ErrorCode,
	) -> i32 ---
	addLikelySubtags        :: proc(
		localeID:                  cstring,
		maximizedLocaleID:         [^]u8,
		maximizedLocaleIDCapacity: i32,
		err:                       ^ErrorCode,
	) -> i32 ---
	canonicalize            :: proc(localeID: cstring, name: [^]u8, nameCapacity: i32, err: ^ErrorCode) -> i32 ---
	countAvailable          :: proc() -> i32 ---
	forLanguageTag          :: proc(
		langtag:          cstring,
		localeID:         [^]u8,
		localeIDCapacity: i32,
		parsedLength:     ^i32,
		err:              ^ErrorCode,
	) -> i32 ---
	getAvailable            :: proc(n: i32) -> cstring ---
	getBaseName             :: proc(localeID: cstring, name: [^]u8, nameCapacity: i32, err: ^ErrorCode) -> i32 ---
	getCharacterOrientation :: proc(localeID: cstring, status: ^ErrorCode) -> LayoutType ---
	getCountry              :: proc(
		localeID:        cstring,
		country:         [^]u8,
		countryCapacity: i32,
		err:             ^ErrorCode,
	) -> i32 ---
	getDefault              :: proc() -> cstring ---
	getDisplayCountry       :: proc(
		locale:          cstring,
		displayLocale:   cstring,
		country:         [^]Char,
		countryCapacity: i32,
		status:          ^ErrorCode,
	) -> i32 ---
	getDisplayKeyword       :: proc(
		keyword:       cstring,
		displayLocale: cstring,
		dest:          [^]Char,
		destCapacity:  i32,
		status:        ^ErrorCode,
	) -> i32 ---
	getDisplayKeywordValue  :: proc(
		locale:        cstring,
		keyword:       cstring,
		displayLocale: cstring,
		dest:          [^]Char,
		destCapacity:  i32,
		status:        ^ErrorCode,
	) -> i32 ---
	getDisplayLanguage      :: proc(
		locale:           cstring,
		displayLocale:    cstring,
		language:         [^]Char,
		languageCapacity: i32,
		status:           ^ErrorCode,
	) -> i32 ---
	getDisplayName          :: proc(
		localeID:      cstring,
		inLocaleID:    cstring,
		result:        [^]Char,
		maxResultSize: i32,
		status:        ^ErrorCode,
	) -> i32 ---
	getDisplayScript        :: proc(
		locale:         cstring,
		displayLocale:  cstring,
		script:         [^]Char,
		scriptCapacity: i32,
		status:         ^ErrorCode,
	) -> i32 ---
	getDisplayVariant       :: proc(
		locale:          cstring,
		displayLocale:   cstring,
		variant:         [^]Char,
		variantCapacity: i32,
		status:          ^ErrorCode,
	) -> i32 ---
	getISO3Country          :: proc(localeID: cstring) -> cstring ---
	getISO3Language         :: proc(localeID: cstring) -> cstring ---
	getISOCountries         :: proc() -> [^]cstring ---
	getISOLanguages         :: proc() -> [^]cstring ---
	getKeywordValue         :: proc(
		localeID:       cstring,
		keywordName:    cstring,
		buffer:         [^]u8,
		bufferCapacity: i32,
		status:         ^ErrorCode,
	) -> i32 ---
	getLCID                 :: proc(localeID: cstring) -> u32 ---
	getLanguage             :: proc(
		localeID:         cstring,
		language:         [^]u8,
		languageCapacity: i32,
		err:              ^ErrorCode,
	) -> i32 ---
	getLineOrientation      :: proc(localeID: cstring, status: ^ErrorCode) -> LayoutType ---
	getLocaleForLCID        :: proc(hostID: u32, locale: [^]u8, localeCapacity: i32, status: ^ErrorCode) -> i32 ---
	getName                 :: proc(localeID: cstring, name: [^]u8, nameCapacity: i32, err: ^ErrorCode) -> i32 ---
	getParent               :: proc(
		localeID:       cstring,
		parent:         [^]u8,
		parentCapacity: i32,
		err:            ^ErrorCode,
	) -> i32 ---
	getScript               :: proc(
		localeID:       cstring,
		script:         [^]u8,
		scriptCapacity: i32,
		err:            ^ErrorCode,
	) -> i32 ---
	getVariant              :: proc(
		localeID:        cstring,
		variant:         [^]u8,
		variantCapacity: i32,
		err:             ^ErrorCode,
	) -> i32 ---
	isRightToLeft           :: proc(locale: cstring) -> bool ---
	minimizeSubtags         :: proc(
		localeID:                  cstring,
		minimizedLocaleID:         [^]u8,
		minimizedLocaleIDCapacity: i32,
		err:                       ^ErrorCode,
	) -> i32 ---
	openKeywords            :: proc(localeID: cstring, status: ^ErrorCode) -> ^Enumeration ---
	setDefault              :: proc(localeID: cstring, status: ^ErrorCode) ---
	setKeywordValue         :: proc(
		keywordName:    cstring,
		keywordValue:   cstring,
		buffer:         [^]u8,
		bufferCapacity: i32,
		status:         ^ErrorCode,
	) -> i32 ---
	toLanguageTag           :: proc(
		localeID:        cstring,
		langtag:         [^]u8,
		langtagCapacity: i32,
		strict:          bool,
		err:             ^ErrorCode,
	) -> i32 ---
	toLegacyKey             :: proc(keyword: cstring) -> cstring ---
	toLegacyType            :: proc(keyword: cstring, value: cstring) -> cstring ---
	toUnicodeLocaleKey      :: proc(keyword: cstring) -> cstring ---
	toUnicodeLocaleType     :: proc(keyword: cstring, value: cstring) -> cstring ---
}
