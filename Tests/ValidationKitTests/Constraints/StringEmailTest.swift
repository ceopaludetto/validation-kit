import Testing
@testable import ValidationKit

struct StringEmailTest {
	@Test("Should correctly validate email")
	func shouldCorrectlyValidateEmail() {
		let validator = Validator.string().email()

		#expect(validator.validate("ceo.paludetto@gmail.com") == .success("ceo.paludetto@gmail.com"))
		#expect(validator.validate("ceo.paludetto@gmail.c") == .failure(.init("Expected an email address")))
		#expect(validator.validate("ceo.paludetto@gmail") == .failure(.init("Expected an email address")))
		#expect(validator.validate("ceo.paludetto") == .failure(.init("Expected an email address")))
		#expect(validator.validate(42) == .failure(.init("Expected a string")))
	}
}
