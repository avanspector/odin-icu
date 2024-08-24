package icu_col

import icu   ".."
import _enum "../enum"
import       "../iter"
import       "../loc"
import       "../script"
import       "../set"

when ODIN_OS == .Windows {
	foreign import libicu "system:icu.lib"
} else {
	foreign import libicu "system:icu"
}

Bool           :: icu.Bool
Char           :: icu.Char
CharIterator   :: iter.CharIterator
DataLocaleType :: loc.DataLocaleType
Enumeration    :: _enum.Enumeration
ErrorCode      :: icu.ErrorCode
ParseError     :: icu.ParseError
ScriptUsage    :: script.ScriptUsage
Set            :: set.Set
VersionInfo    :: icu.VersionInfo

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

@(default_calling_convention="c", link_prefix="ucol_")
foreign libicu {
	open                         :: proc(loc: cstring, status: ^ErrorCode) -> ^Collator ---
	openRules                    :: proc(
		rules:             [^]Char,
		rulesLength:       i32,
		normalizationMode: AttributeValue,
		strength:          CollationStrength,
		parseError:        ^ParseError,
		status:            ^ErrorCode,
	) -> ^Collator ---
	getContractionsAndExpansions :: proc(coll: ^Collator, contraptions: ^Set, expansions: ^Set, addPrefixes: Bool, status: ^ErrorCode) ---
	close                        :: proc(coll: ^Collator) ---
	strcoll                      :: proc(coll: ^Collator, source: [^]Char, sourceLength: i32, target: [^]Char, targetLength: i32) -> CollationResult ---
	strcollUTF8                  :: proc(coll: ^Collator, source: [^]u8, sourceLength: i32, target: [^]u8, targetLength: i32, status: ^ErrorCode) -> CollationResult ---
	greater                      :: proc(coll: ^Collator, source: [^]Char, sourceLength: i32, target: [^]Char, targetLength: i32) -> Bool ---
	greaterOrEqual               :: proc(coll: ^Collator, source: [^]Char, sourceLength: i32, target: [^]Char, targetLength: i32) -> Bool ---
	equal                        :: proc(coll: ^Collator, source: [^]Char, sourceLength: i32, target: [^]Char, targetLength: i32) -> Bool ---
	strcollIter                  :: proc(coll: ^Collator, sIter: CharIterator, tIter: CharIterator, status: ^ErrorCode) -> CollationResult ---
	getStrength                  :: proc(coll: ^Collator) -> CollationStrength ---
	setStrength                  :: proc(coll: ^Collator, strength: CollationStrength) ---
	getReorderCodes              :: proc(coll: ^Collator, dest: [^]i32, destCapacity: i32, pErrorCode: ^ErrorCode) -> i32 ---
	setReorderCodes              :: proc(coll: ^Collator, reorderCodes: [^]i32, reorderCodesLength: i32, pErrorCode: ^ErrorCode) ---
	getEquivalentReorderCodes    :: proc(reorderCode: i32, dest: [^]i32, destCapacity: i32, pErrorCode: ^ErrorCode) -> i32 ---
	getDisplayName               :: proc(objLoc: cstring, dispLoc: cstring, result: [^]Char, resultLength: i32, status: ^ErrorCode) -> i32 ---
	getAvailable                 :: proc(localeIndex: i32) -> cstring ---
	countAvailable               :: proc() -> i32 ---
	openAvailableLocales         :: proc(status: ^ErrorCode) -> ^Enumeration ---
	getKeywords                  :: proc(status: ^ErrorCode) -> ^Enumeration ---
	getKeywordValues             :: proc(keyword: cstring, status: ^ErrorCode) -> ^Enumeration ---
	getKeywordValuesForLocale    :: proc(key: cstring, locale: cstring, commonlyUsed: Bool, status: ^ErrorCode) -> ^Enumeration ---
	getFunctionalEquivalent      :: proc(result: [^]u8, resultCapacity: i32, keyword: cstring, locale: cstring, isAvailable: ^Bool, status: ^ErrorCode) -> i32 ---
	getRules                     :: proc(coll: ^Collator, length: ^i32) -> [^]Char ---
	getSortKey                   :: proc(coll: ^Collator, source: [^]Char, sourceLength: i32, result: [^]u8, resultLength: i32) -> i32 ---
	nextSortKeyPart              :: proc(coll: ^Collator, iter: ^CharIterator, state: ^[2]u32, dest: [^]u8, count: i32, status: ^ErrorCode) -> i32 ---
	getBound                     :: proc(
		source:       [^]u8,
		sourceLength: i32,
		boundType:    BoundMode,
		noOfLevels:   u32,
		result:       [^]u8,
		resultLength: i32,
		stats:        ^ErrorCode,
	) -> i32 ---
	getVersion                   :: proc(coll: ^Collator, info: ^VersionInfo) ---
	getUCAVersion                :: proc(coll: ^Collator, info: ^VersionInfo) ---
	mergeSortkeys                :: proc(src1: [^]u8, src1Length: i32, src2: [^]u8, src2Length: i32, dest: [^]u8, destCapacity: i32) -> i32 ---
	setAttribute                 :: proc(coll: ^Collator, attr: Attribute, value: AttributeValue, status: ^ErrorCode) ---
	getAttribute                 :: proc(coll: ^Collator, attr: Attribute, status: ^ErrorCode) -> AttributeValue ---
	setMaxVariable               :: proc(coll: ^Collator, group: ReorderCode, pErrorCode: ^ErrorCode) ---
	getMaxVariable               :: proc(coll: ^Collator) -> ReorderCode ---
	getVariableTop               :: proc(coll: ^Collator, status: ^ErrorCode) -> u32 ---
	safeClone                    :: proc(coll: ^Collator, stackBuffer: rawptr, pBufferSize: rawptr, status: ^ErrorCode) -> ^Collator ---
	getRulesEx                   :: proc(coll: ^Collator, delta: RuleOption, buffer: [^]Char, bufferLen: i32) -> i32 ---
	getLocaleByType              :: proc(coll: ^Collator, type: DataLocaleType, status: ^ErrorCode) -> cstring ---
	getTailoredSet               :: proc(coll: ^Collator, status: ^ErrorCode) -> ^Set ---
	cloneBinary                  :: proc(coll: ^Collator, buffer: [^]u8, capacity: i32, status: ^ErrorCode) -> i32 ---
	openBinary                   :: proc(bin: [^]u8, length: i32, base: ^Collator, status: ^ErrorCode) -> ^Collator ---
}
