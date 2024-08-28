package test_icu

import "core:testing"

import u    "../icu"
import ucol "../icu/col"
import uloc "../icu/loc"

@(test)
test_collate_with_locale :: proc(t: ^testing.T) {
	source := "This is a test."
	target := "THIS IS A TEST."

	status: u.ErrorCode

	collator := ucol.open(uloc.US, &status)
	testing.expect(t, u.SUCCESS(status))

	result := ucol.strcollUTF8(collator,
	                           raw_data(source),
	                           cast(i32)len(source),
	                           raw_data(target),
	                           cast(i32)len(target),
	                           &status)
	testing.expect(t, u.SUCCESS(status))
	testing.expect(t, result == .LESS)

	ucol.setStrength(collator, .PRIMARY)
	result = ucol.strcollUTF8(collator,
	                          raw_data(source),
	                          cast(i32)len(source),
	                          raw_data(target),
	                          cast(i32)len(target),
	                          &status)
	testing.expect(t, u.SUCCESS(status))
	testing.expect(t, result == .EQUAL)
}
