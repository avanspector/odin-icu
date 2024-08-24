package test_icu

import "../icu"
import "../icu/col"
import "../icu/loc"

import "core:testing"
import "core:unicode/utf16"

@(test)
test_collate_with_locale :: proc(t: ^testing.T) {
	source := "This is a test."
	target := "THIS IS A TEST."

	display_name: [128]icu.Char
	utf8_name: [len(display_name)*2]u8
	status: icu.ErrorCode

	collator := col.open(loc.US, &status)
	if icu.FAILURE(status) {
		buf_len := loc.getDisplayName(loc.US, nil, raw_data(&display_name), len(display_name), &status)
		str_len := utf16.decode_to_utf8(utf8_name[:], display_name[:])

		testing.expectf(t, false, "Failed to create the collator for {}.\n", string(utf8_name[:str_len]))
	}

	result := col.strcollUTF8(collator, raw_data(source), cast(i32)len(source), raw_data(target), cast(i32)len(target), &status)
	testing.expect(t, icu.SUCCESS(status))
	testing.expect(t, result == .LESS)

	col.setStrength(collator, .PRIMARY)
	result = col.strcollUTF8(collator, raw_data(source), cast(i32)len(source), raw_data(target), cast(i32)len(target), &status)
	testing.expect(t, icu.SUCCESS(status))
	testing.expect(t, result == .EQUAL)
}
