import Testing
@testable import ValidationKit

struct IsTest {
	@Test("Should correctly check predicate")
	func shouldCorrectlyCheckPredicate() {
		let validator = Validator.string().is { $0 == "hello" }

		#expect(validator.validate("hello") == .success("hello"))
		#expect(validator.validate("hello world!") == .failure(.init("Expected value to satisfy predicate")))
	}
}
