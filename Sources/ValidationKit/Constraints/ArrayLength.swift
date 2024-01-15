public struct ArrayLengthConstraint<Previous, T>: Schema where Previous: Schema, Previous.Output == [T] {
	public typealias Input = Previous.Output
	public typealias Output = [T]

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
					return .failure(ValidationError("Expected an array of size \(size)"))
				}

				return .success($0)
			}
	}
}

public extension Schema {
	func length<T>(_ size: UInt) -> ArrayLengthConstraint<Self, T> where Self.Output == [T] {
		.init(self, size)
	}
}
