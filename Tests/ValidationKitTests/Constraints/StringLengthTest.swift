import Testing
@testable import ValidationKit

struct StringLengthTest {
	@Test("Should correctly validate string length")
	func shouldCorrectlyValidateStringLength() {
		let validator = Validator.string().length(5)

		#expect(validator.validate("Hello") == .success("Hello"))
		#expect(validator.validate("Hello world!") == .failure(.init("Expected a string of size 5")))
		#expect(validator.validate(10) == .failure(.init("Expected a string")))
	}

	@Test("Should correctly validate string min length")
	func shouldCorrectlyValidateStringMinLength() {
		let validator = Validator.string().min(5)

		#expect(validator.validate("Hell") == .failure(.init("Expected a string of minimum size 5")))
		#expect(validator.validate("Hello") == .success("Hello"))
		#expect(validator.validate("Hello world!") == .success("Hello world!"))
		#expect(validator.validate(10) == .failure(.init("Expected a string")))
	}

	@Test("Should correctly validate string max length")
	func shouldCorrectlyValidateStringMaxLength() {
		let validator = Validator.string().max(5)

		#expect(validator.validate("Hell") == .success("Hell"))
		#expect(validator.validate("Hello") == .success("Hello"))
		#expect(validator.validate("Hello world!") == .failure(.init("Expected a string of maximum size 5")))
		#expect(validator.validate(10) == .failure(.init("Expected a string")))
	}
}
