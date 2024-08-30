# Odin bindings for the ICU (ICU4C) library

Right now aims to only cover those parts of the API that are common between Windows SDK and the original library.

## Usage

If (most likely) your library distribution requires a version to successfully link, pass it through the `ICU_VERSION` constant, like:

```sh
odin build . -define:ICU_VERSION="70 " # Note the whitespace
odin build . -define:ICU_VERSION="_70" # Note the underscore
```

## Example

```odin
import u    "icu"
import ucol "icu/col"
import uloc "icu/loc"

main :: proc() {
	source := "This is a test."
	target := "THIS IS A TEST."

	status: u.ErrorCode
	result: ucol.CollationResult

	collator := ucol.open(uloc.US, &status)

	result = ucol.strcollUTF8(collator,
	                          raw_data(source), cast(i32)len(source),
	                          raw_data(target), cast(i32)len(target),
	                          &status)
	assert(result == .LESS)

	ucol.setStrength(collator, .PRIMARY)
	
	result = ucol.strcollUTF8(collator,
	                          raw_data(source), cast(i32)len(source),
	                          raw_data(target), cast(i32)len(target),
	                          &status)
	assert(result == .EQUAL)
}
```

## Resources

- https://icu.unicode.org/
- https://unicode-org.github.io/icu/
