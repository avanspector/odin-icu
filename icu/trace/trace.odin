package icu_trace

when ODIN_OS == .Windows {
	foreign import libicu "system:icu.lib"
} else {
	foreign import libicu "system:icu"
}

Level :: enum i32 {
	OFF        = -1,
	ERROR      = 0,
	WARNING    = 3,
	OPEN_CLOSE = 5,
	INFO       = 7,
	VERBOSE    = 9,
}

FunctionNumber :: enum i32 {
	FUNCTION_START   = 0,
	U_INIT           = FUNCTION_START,
	U_CLEANUP,

	CONVERSION_START = 0x1000,
	UCNV_OPEN        = CONVERSION_START,
	UCNV_OPEN_PACKAGE,
	UCNV_OPEN_ALGORITHMIC,
	UCNV_CLONE,
	UCNV_CLOSE,
	UCNV_FLUSH_CACHE,
	UCNV_LOAD,
	UCNV_UNLOAD,

	COLLATION_START  = 0x2000,
	UCOL_OPEN        = COLLATION_START,
	UCOL_CLOSE,
	UCOL_STRCOLL,
	UCOL_GET_SORTKEY,
	UCOL_GETLOCALE,
	UCOL_NEXTSORTKEYPART,
	UCOL_STRCOLLITER,
	UCOL_OPEN_FROM_SHORT_STRING,
	UCOL_STRCOLLUTF8,
}

Entry :: #type proc "c" (_context: rawptr, fnNumber: FunctionNumber)
Exit  :: #type proc "c" (_context: rawptr, fnNumber: FunctionNumber, fmt: cstring, args: rawptr /* va_list */)
Data  :: #type proc "c" (_context: rawptr, fnNumber: FunctionNumber, level: Level, fmt: cstring, args: rawptr /* va_list */)

@(default_calling_convention="c", link_prefix="utrace_")
foreign libicu {
	setLevel     :: proc(traceLevel: Level) ---
	getLevel     :: proc() -> Level ---
	setFunctions :: proc(_context: rawptr, e: Entry, x: Exit, d: Data) ---
	getFunctions :: proc(_context: ^rawptr, e: ^Entry, x: ^Exit, d: ^Data) ---
	vformat      :: proc(outBuf: [^]u8, capacity: i32, indent: i32, fmt: cstring, args: rawptr /* va_list */) -> i32 ---
	format       :: proc(outBuf: [^]u8, capacity: i32, indent: i32, fmt: cstring, #c_vararg args: ..any) -> i32 ---
	functionName :: proc(fnNumber: FunctionNumber) -> cstring ---
}
