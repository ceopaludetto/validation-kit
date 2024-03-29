import Testing
@testable import ValidationKit

struct StringUppercasedTest {
	@Test
	func successfullyCreate() {
		let validator = Validator.string().uppercased()

		#expect(validator.validate("HELLO") == .success("HELLO"))
		#expect(validator.validate("hello") == .success("HELLO"))
		#expect(validator.validate(10) == .failure(.init("Expected a string")))
	}
}
