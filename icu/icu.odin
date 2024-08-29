package icu

VERSION :: #config(ICU_VERSION, "")

when VERSION != "" {
	LINK_VERSION :: VERSION when VERSION[0] == '_' else "_" + VERSION
} else {
	LINK_VERSION :: ""
}

/*
	NOTE: Code unused or not supported in the Windows ICU SDK has been removed:
		appendable.h
		brkiter.h
		bytestream.h
		bytestrie.h
		bytestriebuilder.h
		caniter.h
		char16ptr.h
		chariter.h
		dbbi.h
		docmain.h
		dtintrv.h
		edits.h
		enumset.h
		errorcode.h
		filteredbrk.h
		icuplug.h
		localebuilder.h
		localpointer.h
		locdspnm.h
		locid.h
		messagepattern.h
		normalizer2.h
		normlzr.h
		parsepos.h
		rbbi.h
		rep.h
		resbund.h
		schriter.h
		simpleformatter.h
		std_string.h
		strenum.h
		stringpiece.h
		stringtriebuilder.h
		symtable.h
		ucharstrie.h
		ucharstriebuilder.h
		uchriter.h

	Everything else gets added as needed.
*/
