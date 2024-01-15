import Testing
@testable import ValidationKit

struct BooleanFalseTest {
	@Test("Should correctly check if is false")
	func shouldCorrectlyCheckIfIsFalse() {
		let validator = Validator.boolean().false()

		#expect(validator.validate(false) == .success(false))
		#expect(validator.validate(true) == .failure(.init("Expected a false boolean")))
		#expect(validator.validate("hello") == .failure(.init("Expected a boolean")))
	}
}
