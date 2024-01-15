import Testing
@testable import ValidationKit

struct ArrayLengthTest {
	@Test
	func successfullyCreate() {
		let validator = Validator.array(String.self).length(3)

		#expect(validator.validate(["a", "b", "c"]) == .success(["a", "b", "c"]))
		#expect(validator.validate(["a", "b"]) == .failure(.init("Expected an array of size 3")))
		#expect(validator.validate(42) == .failure(.init("Expected an array")))
	}
}
