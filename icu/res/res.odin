package icu_res

import icu   ".."
import _enum "../enum"
import       "../loc"

when ODIN_OS == .Windows {
	foreign import libicu "system:icu.lib"
} else {
	foreign import libicu "system:icu"
}

Bool           :: icu.Bool
Char           :: icu.Char
DataLocaleType :: loc.DataLocaleType
Enumeration    :: _enum.Enumeration
ErrorCode      :: icu.ErrorCode
VersionInfo    :: icu.VersionInfo

ResourceBundle :: struct{}

ResType :: enum i32 {
	NONE       = -1,
	STRING     = 0,
	BINARY     = 1,
	TABLE      = 2,
	ALIAS      = 3,
	INT        = 7,
	ARRAY      = 8,
	INT_VECTOR = 14,
}

@(default_calling_convention="c", link_prefix="ures_")
foreign libicu {
	open                 :: proc(packageName: cstring, locale: cstring, status: ^ErrorCode) -> ^ResourceBundle ---
	openDirect           :: proc(packageName: cstring, locale: cstring, status: ^ErrorCode) -> ^ResourceBundle ---
	openU                :: proc(packageName: [^]Char, locale: cstring, status: ^ErrorCode) -> ^ResourceBundle ---
	close                :: proc(resourceBundle: ^ResourceBundle) ---
	getVersion           :: proc(resB: ^ResourceBundle, versionInfo: ^VersionInfo) ---
	getLocaleByType      :: proc(resourceBundle: ^ResourceBundle, type: DataLocaleType, status: ^ErrorCode) -> cstring ---
	getString            :: proc(resourceBundle: ^ResourceBundle, len: ^i32, status: ^ErrorCode) -> [^]Char ---
	getUTF8String        :: proc(resB: ^ResourceBundle, dest: [^]u8, length: ^i32, forceCopy: Bool, status: ^ErrorCode) -> cstring ---
	getBinary            :: proc(resourceBundle: ^ResourceBundle, len: ^i32, status: ^ErrorCode) -> [^]u8 ---
	getIntVector         :: proc(resourceBundle: ^ResourceBundle, len: ^i32, status: ^ErrorCode) -> [^]i32 ---
	getUInt              :: proc(resourceBundle: ^ResourceBundle, status: ^ErrorCode) -> u32 ---
	getInt               :: proc(resourceBundle: ^ResourceBundle, status: ^ErrorCode) -> i32 ---
	getSize              :: proc(resourceBundle: ^ResourceBundle) -> i32 ---
	getType              :: proc(resourceBundle: ^ResourceBundle) -> ResType ---
	getKey               :: proc(resourceBundle: ^ResourceBundle) -> cstring ---
	resetIterator        :: proc(resourceBundle: ^ResourceBundle) ---
	hasNext              :: proc(resourceBundle: ^ResourceBundle) -> Bool ---
	getNextResource      :: proc(resourceBundle: ^ResourceBundle, fillIn: ^ResourceBundle, status: ^ErrorCode) -> ^ResourceBundle ---
	getNextString        :: proc(resourceBundle: ^ResourceBundle, len: ^i32, key: ^cstring, status: ^ErrorCode) -> [^]Char ---
	getByIndex           :: proc(resourceBundle: ^ResourceBundle, indexR: i32, fillIn: ^ResourceBundle, status: ^ErrorCode) -> ^ResourceBundle ---
	getStringByIndex     :: proc(resourceBundle: ^ResourceBundle, indexS: i32, len: ^i32, status: ^ErrorCode) -> [^]Char ---
	getUTF8StringByIndex :: proc(resB: ^ResourceBundle, stringIndex: i32, dest: [^]u8, pLength: ^i32, forceCopy: Bool, status: ^ErrorCode) -> cstring ---
	getByKey             :: proc(resourceBundle: ^ResourceBundle, key: cstring, fillIn: ^ResourceBundle, status: ^ErrorCode) -> ^ResourceBundle ---
	getStringByKey       :: proc(resB: ^ResourceBundle, key: cstring, len: ^i32, status: ^ErrorCode) -> [^]Char ---
	getUTF8StringByKey   :: proc(resB: ^ResourceBundle, key: cstring, dest: [^]u8, pLength: ^i32, forceCopy: Bool, status: ^ErrorCode) -> cstring ---
	openAvailableLocales :: proc(packageName: cstring, status: ^ErrorCode) -> ^Enumeration ---
}
