import Testing
@testable import ValidationKit

struct StringTest {
	@Test
	func successfullyCreate() {
		#expect(Validator.string().validate("Hello, world!") == .success("Hello, world!"))
		#expect(Validator.string().validate(42) == .failure(.init("Expected a string")))
	}
}
