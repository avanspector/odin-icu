package test_icu

import "core:log"
import "core:testing"

import u    "../icu"
import ucol "../icu/col"
import uloc "../icu/loc"

TEST_LOCALES :: #config(ICU_TEST_LOCALES, false)

@(test)
test_collate_with_locale :: proc(t: ^testing.T) {
	source := "This is a test."
	target := "THIS IS A TEST."

	status: u.ErrorCode

	collator := ucol.open(uloc.US, &status)
	testing.expect(t, u.SUCCESS(status))

	result := ucol.strcollUTF8(collator,
	                           raw_data(source), cast(i32)len(source),
	                           raw_data(target), cast(i32)len(target),
	                           &status)
	testing.expect(t, u.SUCCESS(status))
	testing.expect(t, result == .LESS)

	ucol.setStrength(collator, .PRIMARY)
	result = ucol.strcollUTF8(collator,
	                          raw_data(source), cast(i32)len(source),
	                          raw_data(target), cast(i32)len(target),
	                          &status)
	testing.expect(t, u.SUCCESS(status))
	testing.expect(t, result == .EQUAL)
}

@(test)
test_print_locales :: proc(t: ^testing.T) {
	count := uloc.countAvailable()
	log.infof("Found {} locales.\n", count)

	when TEST_LOCALES {
		for i in 0..<count {
			locale := uloc.getAvailable(i)
			log.infof("\t{}\n", locale)
		}
	}
}

@(test)
test_bool_procs :: proc(t: ^testing.T) {
	testing.expect(t, u.islower('t'))
	testing.expect(t, u.isupper('T'))
}
