package icu

when ODIN_OS == .Windows {
	foreign import libicu "system:icu.lib"
} else {
	foreign import libicu "system:icu"
}

COPYRIGHT_STRING_LENGTH   :: 128
MAX_VERSION_LENGTH        :: 4
VERSION_DELIMITER         :: '.'
MAX_VERSION_STRING_LENGTH :: 20

VersionInfo :: [MAX_VERSION_LENGTH]u8

@(default_calling_convention="c", link_prefix="u_")
foreign libicu {
	versionFromString  :: proc(versionArray: ^VersionInfo, versionString: cstring) ---
	versionFromUString :: proc(versionArray: ^VersionInfo, versionString: [^]Char) ---
	versiontoString    :: proc(versionArray: ^VersionInfo, versionString: [^]u8) ---
	getVersion         :: proc(versionArray: ^VersionInfo) ---
}
