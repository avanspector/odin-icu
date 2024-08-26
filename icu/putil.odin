package icu

when ODIN_OS == .Windows {
	foreign import libicu "system:icu.lib"
} else {
	foreign import libicu "system:icuuc"
}

@(default_calling_convention="c", link_prefix="u_", link_suffix=LINK_VERSION)
foreign libicu {
	UCharsToChars :: proc(us: [^]Char, cs: [^]u8, length: i32) ---
	charsToUChars :: proc(cs: [^]u8, us: [^]Char, length: i32) ---
}
