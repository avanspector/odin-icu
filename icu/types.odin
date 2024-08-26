package icu

when ODIN_OS == .Windows {
	foreign import libicu "system:icu.lib"
} else {
	foreign import libicu "system:icuuc"
}

Date :: f64

DATE_MAX :: max(Date)
DATE_MIN :: -DATE_MAX

MILLIS_PER_DAY    :: 86400000
MILLIS_PER_HOUR   :: 3600000
MILLIS_PER_MINUTE :: 60000
MILLIS_PER_SECOND :: 1000

ErrorCode :: enum i32 {
	USING_FALLBACK_WARNING        = -128,
	ERROR_WARNING_START           = -128,
	USING_DEFAULT_WARNING         = -127,
	SAFECLONE_ALLOCATED_WARNING   = -126,
	STATE_OLD_WARNING             = -125,
	STRING_NOT_TERMINATED_WARNING = -124,
	SORT_KEY_TOO_SHORT_WARNING    = -123,
	AMBIGUOUS_ALIAS_WARNING       = -122,
	DIFFERENT_UCA_VERSION         = -121,
	PLUGIN_CHANGED_LEVEL_WARNING  = -120,

	ZERO_ERROR                    =  0,

	ILLEGAL_ARGUMENT_ERROR        =  1,
	MISSING_RESOURCE_ERROR        =  2,
	INVALID_FORMAT_ERROR          =  3,
	FILE_ACCESS_ERROR             =  4,
	INTERNAL_PROGRAM_ERROR        =  5,
	MESSAGE_PARSE_ERROR           =  6,
	MEMORY_ALLOCATION_ERROR       =  7,
	INDEX_OUTOFBOUNDS_ERROR       =  8,
	PARSE_ERROR                   =  9,
	INVALID_CHAR_FOUND            = 10,
	TRUNCATED_CHAR_FOUND          = 11,
	ILLEGAL_CHAR_FOUND            = 12,
	INVALID_TABLE_FORMAT          = 13,
	INVALID_TABLE_FILE            = 14,
	BUFFER_OVERFLOW_ERROR         = 15,
	UNSUPPORTED_ERROR             = 16,
	RESOURCE_TYPE_MISMATCH        = 17,
	ILLEGAL_ESCAPE_SEQUENCE       = 18,
	UNSUPPORTED_ESCAPE_SEQUENCE   = 19,
	NO_SPACE_AVAILABLE            = 20,
	CE_NOT_FOUND_ERROR            = 21,
	PRIMARY_TOO_LONG_ERROR        = 22,
	STATE_TOO_OLD_ERROR           = 23,
	TOO_MANY_ALIASES_ERROR        = 24,
	ENUM_OUT_OF_SYNC_ERROR        = 25,
	INVARIANT_CONVERSION_ERROR    = 26,
	INVALID_STATE_ERROR           = 27,
	COLLATOR_VERSION_MISMATCH     = 28,
	USELESS_COLLATOR_ERROR        = 29,
	NO_WRITE_PERMISSION           = 30,

	BAD_VARIABLE_DEFINITION = 0x10000,
	PARSE_ERROR_START       = 0x10000,
	MALFORMED_RULE,
	MALFORMED_SET,
	MALFORMED_SYMBOL_REFERENCE,
	MALFORMED_UNICODE_ESCAPE,
	MALFORMED_VARIABLE_DEFINITION,
	MALFORMED_VARIABLE_REFERENCE,
	MISMATCHED_SEGMENT_DELIMITERS,
	MISPLACED_ANCHOR_START,
	MISPLACED_CURSOR_OFFSET,
	MISPLACED_QUANTIFIER,
	MISSING_OPERATOR,
	MISSING_SEGMENT_CLOSE,
	MULTIPLE_ANTE_CONTEXTS,
	MULTIPLE_CURSORS,
	MULTIPLE_POST_CONTEXTS,
	TRAILING_BACKSLASH,
	UNDEFINED_SEGMENT_REFERENCE,
	UNDEFINED_VARIABLE,
	UNQUOTED_SPECIAL,
	UNTERMINATED_QUOTE,
	RULE_MASK_ERROR,
	MISPLACED_COMPOUND_FILTER,
	MULTIPLE_COMPOUND_FILTERS,
	INVALID_RBT_SYNTAX,
	INVALID_PROPERTY_PATTERN,
	MALFORMED_PRAGMA,
	UNCLOSED_SEGMENT,
	ILLEGAL_CHAR_IN_SEGMENT,
	VARIABLE_RANGE_EXHAUSTED,
	VARIABLE_RANGE_OVERLAP,
	ILLEGAL_CHARACTER,
	INTERNAL_TRANSLITERATOR_ERROR,
	INVALID_ID,
	INVALID_FUNCTION,

	UNEXPECTED_TOKEN      = 0x10100,
	FMT_PARSE_ERROR_START = 0x10100,
	MULTIPLE_DECIMAL_SEPARATORS,
	MULTIPLE_DECIMAL_SEPERATORS = MULTIPLE_DECIMAL_SEPARATORS,
	MULTIPLE_EXPONENTIAL_SYMBOLS,
	MALFORMED_EXPONENTIAL_PATTERN,
	MULTIPLE_PERCENT_SYMBOLS,
	MULTIPLE_PERMILL_SYMBOLS,
	MULTIPLE_PAD_SPECIFIERS,
	PATTERN_SYNTAX_ERROR,
	ILLEGAL_PAD_POSITION,
	UNMATCHED_BRACES,
	UNSUPPORTED_PROPERTY,
	UNSUPPORTED_ATTRIBUTE,
	ARGUMENT_TYPE_MISMATCH,
	DUPLICATE_KEYWORD,
	UNDEFINED_KEYWORD,
	DEFAULT_KEYWORD_MISSING,
	DECIMAL_NUMBER_SYNTAX_ERROR,
	FORMAT_INEXACT_ERROR,
	NUMBER_ARG_OUTOFBOUNDS_ERROR,
	NUMBER_SKELETON_SYNTAX_ERROR,

	BRK_INTERNAL_ERROR = 0x10200,
	BRK_ERROR_START    = 0x10200,
	BRK_HEX_DIGITS_EXPECTED,
	BRK_SEMICOLON_EXPECTED,
	BRK_RULE_SYNTAX,
	BRK_UNCLOSED_SET,
	BRK_ASSIGN_ERROR,
	BRK_VARIABLE_REDFINITION,
	BRK_MISMATCHED_PAREN,
	BRK_NEW_LINE_IN_QUOTED_STRING,
	BRK_UNDEFINED_VARIABLE,
	BRK_INIT_ERROR,
	BRK_RULE_EMPTY_SET,
	BRK_UNRECOGNIZED_OPTION,
	BRK_MALFORMED_RULE_TAG,

	REGEX_INTERNAL_ERROR = 0x10300,
	REGEX_ERROR_START    = 0x10300,
	REGEX_RULE_SYNTAX,
	REGEX_INVALID_STATE,
	REGEX_BAD_ESCAPE_SEQUENCE,
	REGEX_PROPERTY_SYNTAX,
	REGEX_UNIMPLEMENTED,
	REGEX_MISMATCHED_PAREN,
	REGEX_NUMBER_TOO_BIG,
	REGEX_BAD_INTERVAL,
	REGEX_MAX_LT_MIN,
	REGEX_INVALID_BACK_REF,
	REGEX_INVALID_FLAG,
	REGEX_LOOK_BEHIND_LIMIT,
	REGEX_SET_CONTAINS_STRING,
	REGEX_MISSING_CLOSE_BRACKET = REGEX_SET_CONTAINS_STRING + 2,
	REGEX_INVALID_RANGE,
	REGEX_STACK_OVERFLOW,
	REGEX_TIME_OUT,
	REGEX_STOPPED_BY_CALLER,
	REGEX_PATTERN_TOO_BIG,
	REGEX_INVALID_CAPTURE_GROUP_NAME,

	IDNA_PROHIBITED_ERROR = 0x10400,
	IDNA_ERROR_START      = 0x10400,
	IDNA_UNASSIGNED_ERROR,
	IDNA_CHECK_BIDI_ERROR,
	IDNA_STD3_ASCII_RULES_ERROR,
	IDNA_ACE_PREFIX_ERROR,
	IDNA_VERIFICATION_ERROR,
	IDNA_LABEL_TOO_LONG_ERROR,
	IDNA_ZERO_LENGTH_LABEL_ERROR,
	IDNA_DOMAIN_NAME_TOO_LONG_ERROR,

	STRINGPREP_PROHIBITED_ERROR = IDNA_PROHIBITED_ERROR,
	STRINGPREP_UNASSIGNED_ERROR = IDNA_UNASSIGNED_ERROR,
	STRINGPREP_CHECK_BIDI_ERROR = IDNA_CHECK_BIDI_ERROR,

	PLUGIN_ERROR_START = 0x10500,
	PLUGIN_TOO_HIGH    = 0x10500,
	PLUGIN_DIDNT_SET_LEVEL,
}

FAILURE :: #force_inline proc "contextless" (code: ErrorCode) -> Bool { return code >  .ZERO_ERROR }
SUCCESS :: #force_inline proc "contextless" (code: ErrorCode) -> Bool { return code <= .ZERO_ERROR }

@(default_calling_convention="c", link_prefix="u_", link_suffix=LINK_VERSION)
foreign libicu {
	errorName :: proc(code: ErrorCode) -> cstring ---
}
