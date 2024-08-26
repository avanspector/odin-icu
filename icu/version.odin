package icu

when ODIN_OS == .Windows {
	foreign import libicu "system:icu.lib"
} else {
	foreign import libicu "system:icuuc"
}

COPYRIGHT_STRING_LENGTH   :: 128
MAX_VERSION_LENGTH        :: 4
MAX_VERSION_STRING_LENGTH :: 20
VERSION_DELIMITER         :: '.'

VersionInfo :: [MAX_VERSION_LENGTH]u8

@(default_calling_convention="c", link_prefix="u_", link_suffix=LINK_VERSION)
foreign libicu {
	getVersion         :: proc(versionArray: ^VersionInfo) ---
	versionFromString  :: proc(versionArray: ^VersionInfo, versionString: [^]u8) ---
	versionFromUString :: proc(versionArray: ^VersionInfo, versionString: [^]Char) ---
	versionToString    :: proc(versionArray: ^VersionInfo, versionString: [^]u8) ---
}
