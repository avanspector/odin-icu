package icu

DisplayContext :: enum i32 {
	STANDARD_NAMES                           = cast(i32)DisplayContextType.DIALECT_HANDLING    << 8 + 0,
	DIALECT_NAMES                            = cast(i32)DisplayContextType.DIALECT_HANDLING    << 8 + 1,
	CAPITALIZATION_NONE                      = cast(i32)DisplayContextType.CAPITALIZATION      << 8 + 0,
	CAPITALIZATION_FOR_MIDDLE_OF_SENTENCE    = cast(i32)DisplayContextType.CAPITALIZATION      << 8 + 1,
	CAPITALIZATION_FOR_BEGINNING_OF_SENTENCE = cast(i32)DisplayContextType.CAPITALIZATION      << 8 + 2,
	CAPITALIZATION_FOR_UI_LIST_OR_MENU       = cast(i32)DisplayContextType.CAPITALIZATION      << 8 + 3,
	CAPITALIZATION_FOR_STANDALONE            = cast(i32)DisplayContextType.CAPITALIZATION      << 8 + 4,
	LENGTH_FULL                              = cast(i32)DisplayContextType.DISPLAY_LENGTH      << 8 + 0,
	LENGTH_SHORT                             = cast(i32)DisplayContextType.DISPLAY_LENGTH      << 8 + 1,
	SUBSTITUTE                               = cast(i32)DisplayContextType.SUBSTITUTE_HANDLING << 8 + 0,
	NO_SUBSTITUTE                            = cast(i32)DisplayContextType.SUBSTITUTE_HANDLING << 8 + 1,
}

DisplayContextType :: enum i32 {
	DIALECT_HANDLING    = 0,
	CAPITALIZATION      = 1,
	DISPLAY_LENGTH      = 2,
	SUBSTITUTE_HANDLING = 3,
}
