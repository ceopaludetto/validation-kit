private let regex = try! Regex("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}").ignoresCase()

public extension Schema {
	func email(message: String = "Expected an email address") -> IsConstraint<Self> where Self.Output == String {
		self.is(message: message) { $0.contains(regex) }
	}
}
