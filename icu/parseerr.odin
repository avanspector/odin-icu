package icu

PARSE_CONTEXT_LEN :: 16

ParseError :: struct {
	line:        i32,
	offset:      i32,
	preContext:  [PARSE_CONTEXT_LEN]Char,
	postContext: [PARSE_CONTEXT_LEN]Char,
}
