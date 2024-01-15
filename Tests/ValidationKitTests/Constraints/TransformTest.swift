import Testing
@testable import ValidationKit

struct TransformTest {
	@Test("Should correctly transform")
	func shouldCorrectlyTransform() {
		#expect(Validator.string().transform { $0.uppercased() }.validate("hello") == .success("HELLO"))
		#expect(Validator.string().transform { $0 + $0 }.validate("hello") == .success("hellohello"))
		#expect(Validator.string().transform { $0 + $0 }.validate(10) == .failure(.init("Expected a string")))

		#expect(Validator.array(Int.self).transform { $0.reduce(0, +) }.validate([10, 5, 5]) == .success(20))
	}
}
