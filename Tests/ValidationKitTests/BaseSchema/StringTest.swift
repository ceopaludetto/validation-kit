import Testing
@testable import ValidationKit

struct StringTest {
	@Test("Should correctly create string schema")
	func shouldCorrectlyCreateStringSchema() {
		let validator = Validator.string()

		#expect(validator.validate("Hello, world!") == .success("Hello, world!"))
		#expect(validator.validate(42) == .failure(.init("Expected a string")))
	}
}
