package icu_curr

import icu   ".."
import _enum "../enum"

LINK_VERSION :: icu.LINK_VERSION

when ODIN_OS == .Windows {
	foreign import libicu "system:icu.lib"
} else {
	foreign import libicu "system:icuuc"
}

Bool        :: icu.Bool
Char        :: icu.Char
Date        :: icu.Date
Enumeration :: _enum.Enumeration
ErrorCode   :: icu.ErrorCode

CurrencyUsage :: enum i32 {
	STANDARD = 0,
	CASH     = 1,
}

NameStyle :: enum i32 {
	SYMBOL_NAME,
	LONG_NAME,
	NARROW_SYMBOL_NAME,
}

CurrencyType :: enum i32 {
	ALL            = max(i32),
	COMMON         = 1,
	UNCOMMON       = 2,
	DEPRECATED     = 4,
	NON_DEPRECATED = 8,
}

RegistryKey :: rawptr

@(default_calling_convention="c", link_prefix="ucurr_", link_suffix=LINK_VERSION)
foreign libicu {
	register                         :: proc(isoCode: [^]Char, locale: cstring, status: ^ErrorCode) -> RegistryKey ---
	unregister                       :: proc(key: RegistryKey, status: ^ErrorCode) -> Bool ---
	getName                          :: proc(currency: [^]Char, locale: cstring, nameStyle: NameStyle, isChoiceFormat: ^Bool, len: ^i32, ec: ^ErrorCode) -> [^]Char ---
	getPluralName                    :: proc(currency: [^]Char, locale: cstring, isChoiceFormat: ^Bool, pluralCount: ^i32, len: ^i32, ec: ^ErrorCode) -> [^]Char ---
	getDefaultFractionDigits         :: proc(currency: [^]Char, ec: ^ErrorCode) -> i32 ---
	getDefaultFractionDigitsForUsage :: proc(currency: [^]Char, usage: CurrencyUsage, ec: ^ErrorCode) -> i32 ---
	getRoundingIncrement             :: proc(currency: [^]Char, ec: ^ErrorCode) -> f64 ---
	getRoundingIncrementForUsage     :: proc(currency: [^]Char, usage: CurrencyUsage, ec: ^ErrorCode) -> f64 ---
	openISOCurrencies                :: proc(currType: CurrencyType, pErrorCode: ^ErrorCode) -> ^Enumeration ---
	isAvailable                      :: proc(isoCode: [^]Char, from: Date, to: Date, errorCode: ^ErrorCode) -> Bool ---
	countCurrencies                  :: proc(locale: cstring, date: Date, ec: ^ErrorCode) -> i32 ---
	forLocaleAndDate                 :: proc(locale: cstring, date: Date, index: i32, buff: [^]Char, buffCapacity: i32, ec: ^ErrorCode) -> i32 ---
	getKeywordValuesForLocale        :: proc(key: cstring, locale: cstring, commonlyUsed: Bool, status: ^ErrorCode) -> ^Enumeration ---
	getNumericCode                   :: proc(currency: [^]Char) -> i32 ---
}
