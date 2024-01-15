import Testing
@testable import ValidationKit

struct StringLengthTest {
	@Test
	func successfullyCreate() {
		let validator = Validator.string().length(5)

		#expect(validator.validate("Hello") == .success("Hello"))
		#expect(validator.validate("Hello world!") == .failure(.init("Expected a string of size 5")))
		#expect(validator.validate(10) == .failure(.init("Expected a string")))
	}
}
