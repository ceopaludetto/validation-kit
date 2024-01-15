import Testing
@testable import ValidationKit

struct BooleanTrueTest {
	@Test("Should correctly check if is true")
	func shouldCorrectlyCheckIfIsTrue() {
		let validator = Validator.boolean().true()

		#expect(validator.validate(true) == .success(true))
		#expect(validator.validate(false) == .failure(.init("Expected a true boolean")))
		#expect(validator.validate("hello") == .failure(.init("Expected a boolean")))
	}
}
