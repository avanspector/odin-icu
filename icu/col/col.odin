package icu_col

import u       ".."
import uenum   "../enum"
import uiter   "../iter"
import uloc    "../loc"
import uscript "../script"
import uset    "../set"

LINK_VERSION :: u.LINK_VERSION

when ODIN_OS == .Windows {
	foreign import libicu "system:icu.lib"
} else {
	foreign import libicu "system:icui18n"
}

Bool           :: u.Bool
Char           :: u.Char
CharIterator   :: uiter.CharIterator
DataLocaleType :: uloc.DataLocaleType
Enumeration    :: uenum.Enumeration
ErrorCode      :: u.ErrorCode
ParseError     :: u.ParseError
ScriptUsage    :: uscript.ScriptUsage
Set            :: uset.Set
VersionInfo    :: u.VersionInfo

Attribute :: enum i32 {
	FRENCH_COLLATION,
	ALTERNATE_HANDLING,
	CASE_FIRST,
	CASE_LEVEL,
	NORMALIZATION_MODE,
	DECOMPOSITION_MODE = NORMALIZATION_MODE,
	STRENGTH,
	NUMERIC_COLLATION  = STRENGTH + 2,
}

AttributeValue :: enum i32 {
	DEFAULT          = -1,
	PRIMARY          = 0,
	SECONDARY        = 1,
	TERTIARY         = 2,
	DEFAULT_STRENGTH = TERTIARY,
	CE_STRENGTH_LIMIT,
	QUATERNARY       = 3,
	IDENTICAL        = 15,
	STRENGTH_LIMIT,
	OFF              = 16,
	ON               = 17,
	SHIFTED          = 20,
	NON_IGNORABLE    = 21,
	LOWER_FIRST      = 24,
	UPPER_FIRST      = 25,
}

BoundMode :: enum i32 {
	LOWER      = 0,
	UPPER      = 1,
	UPPER_LONG = 2,
}

CollationResult :: enum i32 {
	EQUAL   = 0,
	GREATER = 1,
	LESS    = -1,
}

CollationStrength :: AttributeValue

Collator :: struct{}

ReorderCode :: enum i32 {
	DEFAULT       = -1,
	NONE          = cast(i32)ScriptUsage.UNKNOWN,
	OTHERS        = cast(i32)ScriptUsage.UNKNOWN,
	SPACE         = 0x1000,
	FIRST         = SPACE,
	PUNCTUATION   = 0x1001,
	SYMBOL        = 0x1002,
	CURRENCY      = 0x1003,
	DIGIT         = 0x1004,
}

RuleOption :: enum i32 {
	TAILORING_ONLY,
	FULL_RULES,	
}

@(default_calling_convention="c", link_prefix="ucol_", link_suffix=LINK_VERSION)
foreign libicu {
	cloneBinary                  :: proc(
		coll:     ^Collator,
		buffer:   [^]u8,
		capacity: i32,
		status:   ^ErrorCode,
	) -> i32 ---
	close                        :: proc(coll: ^Collator) ---
	countAvailable               :: proc() -> i32 ---
	equal                        :: proc(
		coll:         ^Collator,
		source:       [^]Char,
		sourceLength: i32,
		target:       [^]Char,
		targetLength: i32,
	) -> Bool ---
	getAttribute                 :: proc(
		coll:   ^Collator,
		attr:   Attribute,
		status: ^ErrorCode,
	) -> AttributeValue ---
	getAvailable                 :: proc(localeIndex: i32) -> cstring ---
	getBound                     :: proc(
		source:       [^]u8,
		sourceLength: i32,
		boundType:    BoundMode,
		noOfLevels:   u32,
		result:       [^]u8,
		resultLength: i32,
		stats:        ^ErrorCode,
	) -> i32 ---
	getContractionsAndExpansions :: proc(
		coll:         ^Collator,
		contraptions: ^Set,
		expansions:   ^Set,
		addPrefixes:  Bool,
		status:       ^ErrorCode,
	) ---
	getDisplayName               :: proc(
		objLoc:       cstring,
		dispLoc:      cstring,
		result:       [^]Char,
		resultLength: i32,
		status:       ^ErrorCode,
	) -> i32 ---
	getEquivalentReorderCodes    :: proc(
		reorderCode:  i32,
		dest:         [^]i32,
		destCapacity: i32,
		pErrorCode:   ^ErrorCode,
	) -> i32 ---
	getFunctionalEquivalent      :: proc(
		result:         [^]u8,
		resultCapacity: i32,
		keyword:        cstring,
		locale:         cstring,
		isAvailable:    ^Bool,
		status:         ^ErrorCode,
	) -> i32 ---
	getKeywordValues             :: proc(keyword: cstring, status: ^ErrorCode) -> ^Enumeration ---
	getKeywordValuesForLocale    :: proc(
		key:          cstring,
		locale:       cstring,
		commonlyUsed: Bool,
		status:       ^ErrorCode,
	) -> ^Enumeration ---
	getKeywords                  :: proc(status: ^ErrorCode) -> ^Enumeration ---
	getLocaleByType              :: proc(coll: ^Collator, type: DataLocaleType, status: ^ErrorCode) -> cstring ---
	getMaxVariable               :: proc(coll: ^Collator) -> ReorderCode ---
	getReorderCodes              :: proc(
		coll:         ^Collator,
		dest:         [^]i32,
		destCapacity: i32,
		pErrorCode:   ^ErrorCode,
	) -> i32 ---
	getRules                     :: proc(coll: ^Collator, length: ^i32) -> [^]Char ---
	getRulesEx                   :: proc(
		coll:      ^Collator,
		delta:     RuleOption,
		buffer:    [^]Char,
		bufferLen: i32,
	) -> i32 ---
	getSortKey                   :: proc(
		coll:         ^Collator,
		source:       [^]Char,
		sourceLength: i32,
		result:       [^]u8,
		resultLength: i32,
	) -> i32 ---
	getStrength                  :: proc(coll: ^Collator) -> CollationStrength ---
	getTailoredSet               :: proc(coll: ^Collator, status: ^ErrorCode) -> ^Set ---
	getUCAVersion                :: proc(coll: ^Collator, info: ^VersionInfo) ---
	getVariableTop               :: proc(coll: ^Collator, status: ^ErrorCode) -> u32 ---
	getVersion                   :: proc(coll: ^Collator, info: ^VersionInfo) ---
	greater                      :: proc(
		coll:         ^Collator,
		source:       [^]Char,
		sourceLength: i32,
		target:       [^]Char,
		targetLength: i32,
	) -> Bool ---
	greaterOrEqual               :: proc(
		coll:         ^Collator,
		source:       [^]Char,
		sourceLength: i32,
		target:       [^]Char,
		targetLength: i32,
	) -> Bool ---
	mergeSortkeys                :: proc(
		src1:         [^]u8,
		src1Length:   i32,
		src2:         [^]u8,
		src2Length:   i32,
		dest:         [^]u8,
		destCapacity: i32,
	) -> i32 ---
	nextSortKeyPart              :: proc(
		coll:   ^Collator,
		iter:   ^CharIterator,
		state:  ^[2]u32,
		dest:   [^]u8,
		count:  i32,
		status: ^ErrorCode,
	) -> i32 ---
	open                         :: proc(loc: cstring, status: ^ErrorCode) -> ^Collator ---
	openAvailableLocales         :: proc(status: ^ErrorCode) -> ^Enumeration ---
	openBinary                   :: proc(
		bin:    [^]u8,
		length: i32,
		base:   ^Collator,
		status: ^ErrorCode,
	) -> ^Collator ---
	openRules                    :: proc(
		rules:             [^]Char,
		rulesLength:       i32,
		normalizationMode: AttributeValue,
		strength:          CollationStrength,
		parseError:        ^ParseError,
		status:            ^ErrorCode,
	) -> ^Collator ---
	safeClone                    :: proc(
		coll:        ^Collator,
		stackBuffer: rawptr,
		pBufferSize: rawptr,
		status:      ^ErrorCode,
	) -> ^Collator ---
	setAttribute                 :: proc(
		coll:   ^Collator,
		attr:   Attribute,
		value:  AttributeValue,
		status: ^ErrorCode,
	) ---
	setMaxVariable               :: proc(coll: ^Collator, group: ReorderCode, pErrorCode: ^ErrorCode) ---
	setReorderCodes              :: proc(
		coll:               ^Collator,
		reorderCodes:       [^]i32,
		reorderCodesLength: i32,
		pErrorCode:         ^ErrorCode,
	) ---
	setStrength                  :: proc(coll: ^Collator, strength: CollationStrength) ---
	strcoll                      :: proc(
		coll:         ^Collator,
		source:       [^]Char,
		sourceLength: i32,
		target:       [^]Char,
		targetLength: i32,
	) -> CollationResult ---
	strcollIter                  :: proc(
		coll:   ^Collator,
		sIter:  CharIterator,
		tIter:  CharIterator,
		status: ^ErrorCode,
	) -> CollationResult ---
	strcollUTF8                  :: proc(
		coll:         ^Collator,
		source:       [^]u8,
		sourceLength: i32,
		target:       [^]u8,
		targetLength: i32,
		status:       ^ErrorCode,
	) -> CollationResult ---
}
