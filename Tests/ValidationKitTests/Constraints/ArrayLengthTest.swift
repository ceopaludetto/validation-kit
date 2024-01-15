import Testing
@testable import ValidationKit

struct ArrayLengthTest {
	@Test("Should correctly validate array length")
	func shouldCorrectlyValidateArrayLength() {
		let validator = Validator.array(String.self).length(3)

		#expect(validator.validate(["a", "b", "c"]) == .success(["a", "b", "c"]))
		#expect(validator.validate(["a", "b"]) == .failure(.init("Expected an array of size 3")))
		#expect(validator.validate(42) == .failure(.init("Expected an array")))
	}

	@Test("Should correctly validate array min length")
	func shouldCorrectlyValidateArrayMinLength() {
		let validator = Validator.array(String.self).min(3)

		#expect(validator.validate(["a", "b", "c", "d"]) == .success(["a", "b", "c", "d"]))
		#expect(validator.validate(["a", "b"]) == .failure(.init("Expected an array of minimum size 3")))
		#expect(validator.validate(42) == .failure(.init("Expected an array")))
	}

	@Test("Should correctly validate array max length")
	func shouldCorrectlyValidateArrayMaxLength() {
		let validator = Validator.array(String.self).max(3)

		#expect(validator.validate(["a", "b", "c", "d"]) == .failure(.init("Expected an array of maximum size 3")))
		#expect(validator.validate(["a", "b"]) == .success(["a", "b"]))
		#expect(validator.validate(42) == .failure(.init("Expected an array")))
	}
}
