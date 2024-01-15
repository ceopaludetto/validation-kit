import Testing
@testable import ValidationKit

struct StringLowercasedTest {
	@Test("Should correctly lowercase string")
	func shouldCorrectlyLowercaseString() {
		let validator = Validator.string().lowercased()

		#expect(validator.validate("HELLO") == .success("hello"))
		#expect(validator.validate("hello") == .success("hello"))
		#expect(validator.validate(10) == .failure(.init("Expected a string")))
	}
}
