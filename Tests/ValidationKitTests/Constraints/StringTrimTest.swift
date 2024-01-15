import Testing
@testable import ValidationKit

struct StringTrimTest {
	@Test
	func successfullyCreate() {
		let validator = Validator.string().trim(in: .whitespaces)

		#expect(validator.validate("         hello  ") == .success("hello"))
		#expect(validator.validate("hello") == .success("hello"))
		#expect(validator.validate(10) == .failure(.init("Expected a string")))
	}
}
