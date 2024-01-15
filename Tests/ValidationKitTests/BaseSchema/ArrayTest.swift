import Testing
@testable import ValidationKit

struct ArrayTest {
	@Test
	func successfullyCreate() {
		#expect(Validator.array(Int.self).validate([1, 2, 3]) == .success([1, 2, 3]))
		#expect(Validator.array(String.self).validate(["1", "2", "3"]) == .success(["1", "2", "3"]))
		#expect(Validator.array(String.self).validate(42) == .failure(.init("Expected an array")))
	}
}
