public struct StringLengthConstraint<Previous>: Schema where Previous: Schema, Previous.Output == String {
	public typealias Input = Previous.Output
	public typealias Output = String

	private let previous: Previous
	private let size: UInt

	public init(_ previous: Previous, _ size: UInt) {
		self.previous = previous
		self.size = size
	}

	public func validate(_ value: Any) -> Result<Output, ValidationError> {
		previous.validate(value)
			.flatMap {
				guard $0.count == size else {
					return .failure(ValidationError("Expected a string of size \(size)"))
				}

				return .success($0)
			}
	}
}

public extension Schema {
	func length(_ size: UInt) -> StringLengthConstraint<Self> where Self.Output == String {
		.init(self, size)
	}
}
