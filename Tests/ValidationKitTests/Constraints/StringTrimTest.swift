import Testing
@testable import ValidationKit

struct StringTrimTest {
	@Test("Should correctly trim string")
	func shouldCorrectlyTrimString() {
		let validator = Validator.string().trim(in: .whitespaces)

		#expect(validator.validate("         hello  ") == .success("hello"))
		#expect(validator.validate("hello") == .success("hello"))
		#expect(validator.validate(10) == .failure(.init("Expected a string")))
	}
}
