import Testing
@testable import ValidationKit

private struct User: Equatable {
	public let name: String
	public let items: [String]
}

struct StructTest {
	@Test("Should correctly create struct schema")
	func shouldCorrectlyCreateStructSchema() {
		let validator = Validator.struct(User.self)

		#expect(validator.validate(User(name: "Carlos", items: [])) == .success(User(name: "Carlos", items: [])))
		#expect(validator.validate(10) == .failure(.init("Expected a struct")))
	}

	@Test("Should correctly validate struct keys")
	func shouldCorrectlyValidateStructKeys() {
		let validator = Validator.struct(User.self)
			.for(key: \.name, Validator.string().min(3))
			.for(key: \.items, Validator.array(String.self).min(1))

		#expect(validator.validate(User(name: "Carlos", items: ["Test"])) == .success(User(name: "Carlos", items: ["Test"])))

		#expect(validator.validate(User(name: "Ca", items: ["Test"])) == .failure(.init("Expected a string of minimum size 3")))
		#expect(validator.validate(User(name: "Carlos", items: [])) == .failure(.init("Expected an array of minimum size 1")))
		#expect(validator.validate(10) == .failure(.init("Expected a struct")))
	}
}
