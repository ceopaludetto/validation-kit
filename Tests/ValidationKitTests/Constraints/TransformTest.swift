import Testing
@testable import ValidationKit

struct TransformTest {
	@Test
	func successfullyCreate() {
		#expect(Validator.string().transform { $0.uppercased() }.validate("hello") == .success("HELLO"))
		#expect(Validator.string().transform { $0 + $0 }.validate("hello") == .success("hellohello"))
		#expect(Validator.string().transform { $0 + $0 }.validate(10) == .failure(.init("Expected a string")))
	}
}
