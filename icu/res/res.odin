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

ResourceBundle :: struct{}

@(default_calling_convention="c", link_prefix="ures_")
foreign libicu {
	close                :: proc(resourceBundle: ^ResourceBundle) ---
	getBinary            :: proc(resourceBundle: ^ResourceBundle, len: ^i32, status: ^ErrorCode) -> [^]u8 ---
	getByIndex           :: proc(resourceBundle: ^ResourceBundle, indexR: i32, fillIn: ^ResourceBundle, status: ^ErrorCode) -> ^ResourceBundle ---
	getByKey             :: proc(resourceBundle: ^ResourceBundle, key: cstring, fillIn: ^ResourceBundle, status: ^ErrorCode) -> ^ResourceBundle ---
	getInt               :: proc(resourceBundle: ^ResourceBundle, status: ^ErrorCode) -> i32 ---
	getIntVector         :: proc(resourceBundle: ^ResourceBundle, len: ^i32, status: ^ErrorCode) -> [^]i32 ---
	getKey               :: proc(resourceBundle: ^ResourceBundle) -> cstring ---
	getLocaleByType      :: proc(resourceBundle: ^ResourceBundle, type: DataLocaleType, status: ^ErrorCode) -> cstring ---
	getNextResource      :: proc(resourceBundle: ^ResourceBundle, fillIn: ^ResourceBundle, status: ^ErrorCode) -> ^ResourceBundle ---
	getNextString        :: proc(resourceBundle: ^ResourceBundle, len: ^i32, key: ^cstring, status: ^ErrorCode) -> [^]Char ---
	getSize              :: proc(resourceBundle: ^ResourceBundle) -> i32 ---
	getString            :: proc(resourceBundle: ^ResourceBundle, len: ^i32, status: ^ErrorCode) -> [^]Char ---
	getStringByIndex     :: proc(resourceBundle: ^ResourceBundle, indexS: i32, len: ^i32, status: ^ErrorCode) -> [^]Char ---
	getStringByKey       :: proc(resB: ^ResourceBundle, key: cstring, len: ^i32, status: ^ErrorCode) -> [^]Char ---
	getType              :: proc(resourceBundle: ^ResourceBundle) -> ResType ---
	getUInt              :: proc(resourceBundle: ^ResourceBundle, status: ^ErrorCode) -> u32 ---
	getUTF8String        :: proc(resB: ^ResourceBundle, dest: [^]u8, length: ^i32, forceCopy: Bool, status: ^ErrorCode) -> cstring ---
	getUTF8StringByIndex :: proc(resB: ^ResourceBundle, stringIndex: i32, dest: [^]u8, pLength: ^i32, forceCopy: Bool, status: ^ErrorCode) -> cstring ---
	getUTF8StringByKey   :: proc(resB: ^ResourceBundle, key: cstring, dest: [^]u8, pLength: ^i32, forceCopy: Bool, status: ^ErrorCode) -> cstring ---
	getVersion           :: proc(resB: ^ResourceBundle, versionInfo: ^VersionInfo) ---
	hasNext              :: proc(resourceBundle: ^ResourceBundle) -> Bool ---
	open                 :: proc(packageName: cstring, locale: cstring, status: ^ErrorCode) -> ^ResourceBundle ---
	openAvailableLocales :: proc(packageName: cstring, status: ^ErrorCode) -> ^Enumeration ---
	openDirect           :: proc(packageName: cstring, locale: cstring, status: ^ErrorCode) -> ^ResourceBundle ---
	openU                :: proc(packageName: [^]Char, locale: cstring, status: ^ErrorCode) -> ^ResourceBundle ---
	resetIterator        :: proc(resourceBundle: ^ResourceBundle) ---
}
