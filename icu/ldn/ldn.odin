package icu_ldn

import icu ".."
import     "../script"

when ODIN_OS == .Windows {
	foreign import libicu "system:icu.lib"
} else {
	foreign import libicu "system:icu"
}

Char               :: icu.Char
DisplayContext     :: icu.DisplayContext
DisplayContextType :: icu.DisplayContextType
ErrorCode          :: icu.ErrorCode
ScriptCode         :: script.ScriptCode

LocaleDisplayNames :: struct{}

DialectHandling :: enum i32 {
	STANDARD_NAMES = 0,
	DIALECT_NAMES,
}

@(default_calling_convention="c", link_prefix="uldn_")
foreign libicu {
	open                  :: proc(locale: cstring, dialectHandling: DialectHandling, pErrorCode: ^ErrorCode) -> ^LocaleDisplayNames ---
	close                 :: proc(ldn: ^LocaleDisplayNames) ---
	getLocale             :: proc(ldn: ^LocaleDisplayNames) -> cstring ---
	getDialectHandling    :: proc(ldn: ^LocaleDisplayNames) -> DialectHandling ---
	localeDisplayName     :: proc(ldn: ^LocaleDisplayNames, locale: cstring, result: ^Char, maxResultSize: i32, pErrorCode: ^ErrorCode) -> i32 ---
	languageDisplayName   :: proc(ldn: ^LocaleDisplayNames, lang: cstring, result: ^Char, maxResultSize: i32, pErrorCode: ^ErrorCode) -> i32 ---
	scriptDisplayName     :: proc(ldn: ^LocaleDisplayNames, script: cstring, result: ^Char, maxResultSize: i32, pErrorCode: ^ErrorCode) -> i32 ---
	scriptCodeDisplayName :: proc(ldn: ^LocaleDisplayNames, scriptCode: ScriptCode, result: ^Char, maxResultSize: i32, pErrorCode: ^ErrorCode) -> i32 ---
	regionDisplayName     :: proc(ldn: ^LocaleDisplayNames, region: cstring, result: ^Char, maxResultSize: i32, pErrorCode: ^ErrorCode) -> i32 ---
	variantDisplayName    :: proc(ldn: ^LocaleDisplayNames, variant: cstring, result: ^Char, maxResultSize: i32, pErrorCode: ^ErrorCode) -> i32 ---
	keyDisplayName        :: proc(ldn: ^LocaleDisplayNames, key: cstring, result: ^Char, maxResultSize: i32, pErrorCode: ^ErrorCode) -> i32 ---
	keyValueDisplayName   :: proc(ldn: ^LocaleDisplayNames, key: cstring, value: cstring, result: ^Char, maxResultSize: i32, pErrorCode: ^ErrorCode) -> i32 ---
	openForContext        :: proc(locale: cstring, contexts: [^]DisplayContext, length: i32, pErrorCode: ^ErrorCode) -> ^LocaleDisplayNames ---
	getContext            :: proc(ldn: ^LocaleDisplayNames, type: DisplayContextType, pErrorCode: ^ErrorCode) -> DisplayContext ---
}
