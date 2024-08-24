package icu

StringTrieResult :: enum i32 {
	NO_MATCH,
	NO_VALUE,
	FINAL_VALUE,
	INTERMEDIATE_VALUE,
}

STRINGTRIE_MATCHES   :: #force_inline proc "contextless" (result: StringTrieResult) -> Bool { return result != .NO_MATCH }
STRINGTRIE_HAS_VALUE :: #force_inline proc "contextless" (result: StringTrieResult) -> Bool { return result >= .FINAL_VALUE }
STRINGTRIE_HAS_NEXT  :: #force_inline proc "contextless" (result: StringTrieResult) -> Bool { return i32(result) & 1 != 0 }
