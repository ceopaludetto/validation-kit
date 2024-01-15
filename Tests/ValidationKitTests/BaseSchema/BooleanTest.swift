import Testing
@testable import ValidationKit

struct BooleanTest {
	@Test("Should correctly create boolean schema")
	func shouldCorrectlyCreateBooleanSchema() {
		let validator = Validator.boolean()

		#expect(validator.validate(true) == .success(true))
		#expect(validator.validate(false) == .success(false))
		#expect(validator.validate(42) == .failure(.init("Expected a boolean")))
	}
}
