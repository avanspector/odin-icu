package icu_loc

import icu   ".."
import _enum "../enum"

when ODIN_OS == .Windows {
	foreign import libicu "system:icu.lib"
} else {
	foreign import libicu "system:icu"
}

Bool        :: icu.Bool
Char        :: icu.Char
Enumeration :: _enum.Enumeration
ErrorCode   :: icu.ErrorCode

CHINESE             :: "zh"
ENGLISH             :: "en"
FRENCH              :: "fr"
GERMAN              :: "de"
ITALIAN             :: "it"
JAPANESE            :: "ja"
KOREAN              :: "ko"
SIMPLIFIED_CHINESE  :: "zh_CN"
TRADITIONAL_CHINESE :: "zh_TW"
CANADA              :: "en_CA"
CANADA_FRENCH       :: "fr_CA"
CHINA               :: "zh_CN"
PRC                 :: "zh_CN"
FRANCE              :: "fr_FR"
GERMANY             :: "de_DE"
ITALY               :: "it_IT"
JAPAN               :: "ja_JP"
KOREA               :: "ko_KR"
TAIWAN              :: "zh_TW"
UK                  :: "en_GB"
US                  :: "en_US"

LANG_CAPACITY                  :: 12
COUNTRY_CAPACITY               :: 4
FULLNAME_CAPACITY              :: 157
SCRIPT_CAPACITY                :: 6
KEYWORDS_CAPACITY              :: 96
KEYWORD_AND_VALUES_CAPACITY    :: 100
KEYWORD_SEPARATOR              :: '@'
KEYWORD_SEPARATOR_UNICODE      :: 0x40
KEYWORD_ASSIGN                 :: '='
KEYWORD_ASSIGN_UNICODE         :: 0x3D
KEYWORD_ITEM_SEPARATOR         :: ';'
KEYWORD_ITEM_SEPARATOR_UNICODE :: 0x3B

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

AcceptResult :: enum i32 {
	FAILED   = 0,
	VALID    = 1,
	FALLBACK = 2,
}

@(default_calling_convention="c", link_prefix="uloc_")
foreign libicu {
	getDefault              :: proc() -> cstring ---
	setDefault              :: proc(localeID: cstring, status: ^ErrorCode) ---
	getLanguage             :: proc(localeID: cstring, language: [^]u8, languageCapacity: i32, err: ^ErrorCode) -> i32 ---
	getScript               :: proc(localeID: cstring, script: [^]u8, scriptCapacity: i32, err: ^ErrorCode) -> i32 ---
	getCountry              :: proc(localeID: cstring, country: [^]u8, countryCapacity: i32, err: ^ErrorCode) -> i32 ---
	getVariant              :: proc(localeID: cstring, variant: [^]u8, variantCapacity: i32, err: ^ErrorCode) -> i32 ---
	getName                 :: proc(localeID: cstring, name: [^]u8, nameCapacity: i32, err: ^ErrorCode) -> i32 ---
	canonicalize            :: proc(localeID: cstring, name: [^]u8, nameCapacity: i32, err: ^ErrorCode) -> i32 ---
	getISO3Language         :: proc(localeID: cstring) -> cstring ---
	getISO3Country          :: proc(localeID: cstring) -> cstring ---
	getLCID                 :: proc(localeID: cstring) -> u32 ---
	getDisplayLanguage      :: proc(locale: cstring, displayLocale: cstring, language: [^]Char, languageCapacity: i32, status: ^ErrorCode) -> i32 ---
	getDisplayScript        :: proc(locale: cstring, displayLocale: cstring, script: [^]Char, scriptCapacity: i32, status: ^ErrorCode) -> i32 ---
	getDisplayCountry       :: proc(locale: cstring, displayLocale: cstring, country: [^]Char, countryCapacity: i32, status: ^ErrorCode) -> i32 ---
	getDisplayVariant       :: proc(locale: cstring, displayLocale: cstring, variant: [^]Char, variantCapacity: i32, status: ^ErrorCode) -> i32 ---
	getDisplayKeyword       :: proc(keyword: cstring, displayLocale: cstring, dest: [^]Char, destCapacity: i32, status: ^ErrorCode) -> i32 ---
	getDisplayKeywordValue  :: proc(locale: cstring, keyword: cstring, displayLocale: cstring, dest: [^]Char, destCapacity: i32, status: ^ErrorCode) -> i32 ---
	getDisplayName          :: proc(localeID: cstring, inLocaleID: cstring, result: [^]Char, maxResultSize: i32, status: ^ErrorCode) -> i32 ---
	getAvailable            :: proc(n: i32) -> cstring ---
	countAvailable          :: proc() -> i32 ---
	getISOLanguages         :: proc() -> [^]cstring ---
	getISOCountries         :: proc() -> [^]cstring ---
	getParent               :: proc(localeID: cstring, parent: [^]u8, parentCapacity: i32, err: ^ErrorCode) -> i32 ---
	getBaseName             :: proc(localeID: cstring, name: [^]u8, nameCapacity: i32, err: ^ErrorCode) -> i32 ---
	openKeywords            :: proc(localeID: cstring, status: ^ErrorCode) -> ^Enumeration ---
	getKeywordValue         :: proc(localeID: cstring, keywordName: cstring, buffer: [^]u8, bufferCapacity: i32, status: ^ErrorCode) -> i32 ---
	setKeywordValue         :: proc(keywordName: cstring, keywordValue: cstring, buffer: [^]u8, bufferCapacity: i32, status: ^ErrorCode) -> i32 ---
	isRightToLeft           :: proc(locale: cstring) -> Bool ---
	getCharacterOrientation :: proc(localeID: cstring, status: ^ErrorCode) -> LayoutType ---
	getLineOrientation      :: proc(localeID: cstring, status: ^ErrorCode) -> LayoutType ---
	acceptLanguageFromHTTP  :: proc(
		result:             [^]u8,
		resultAvailable:    i32,
		outResult:          ^AcceptResult,
		httpAcceptLanguage: cstring,
		availableLocales:   ^Enumeration,
		status:             ^ErrorCode,
	) -> i32 ---
	acceptLanguage          :: proc(
		result:           [^]u8,
		resultAvailable:  i32,
		outResult:        ^AcceptResult,
		acceptList:       [^]cstring,
		acceptListCount:  i32,
		availableLocales: ^Enumeration,
		status:           ^ErrorCode,
	) -> i32 ---
	getLocaleForLCID        :: proc(hostID: u32, locale: [^]u8, localeCapacity: i32, status: ^ErrorCode) -> i32 ---
	addLikelySubtags        :: proc(localeID: cstring, maximizedLocaleID: [^]u8, maximizedLocaleIDCapacity: i32, err: ^ErrorCode) -> i32 ---
	minimizeSubtags         :: proc(localeID: cstring, minimizedLocaleID: [^]u8, minimizedLocaleIDCapacity: i32, err: ^ErrorCode) -> i32 ---
	forLanguageTag          :: proc(langtag: cstring, localeID: [^]u8, localeIDCapacity: i32, parsedLength: ^i32, err: ^ErrorCode) -> i32 ---
	toLanguageTag           :: proc(localeID: cstring, langtag: [^]u8, langtagCapacity: i32, strict: Bool, err: ^ErrorCode) -> i32 ---
	toUnicodeLocaleKey      :: proc(keyword: cstring) -> cstring ---
	toUnicodeLocaleType     :: proc(keyword: cstring, value: cstring) -> cstring ---
	toLegacyKey             :: proc(keyword: cstring) -> cstring ---
	toLegacyType            :: proc(keyword: cstring, value: cstring) -> cstring ---
}
