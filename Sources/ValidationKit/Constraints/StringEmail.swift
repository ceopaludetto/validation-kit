private let regex = try! Regex("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}").ignoresCase()

public struct StringEmailConstraint<Previous>: Schema where Previous: Schema, Previous.Output == String {
	public typealias Input = Previous.Output
	public typealias Output = String

	private let previous: Previous

	public init(_ previous: Previous) {
		self.previous = previous
	}

	public func validate(_ value: Any) -> Result<Output, ValidationError> {
		previous.validate(value)
			.flatMap {
				guard $0.contains(regex) else {
					return .failure(ValidationError("Expected an email address"))
				}

				return .success($0)
			}
	}
}

public extension Schema {
	func email() -> StringEmailConstraint<Self> where Self.Output == String {
		.init(self)
	}
}
