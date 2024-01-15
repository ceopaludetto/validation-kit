public struct IsConstraint<Previous>: Schema where Previous: Schema {
	public typealias Input = Previous.Output
	public typealias Output = Previous.Output

	private let previous: Previous
	private let predicate: (Input) -> Bool

	private let message: String

	public init(
		_ previous: Previous,
		_ predicate: @escaping (Input) -> Bool,
		message: String
	) {
		self.previous = previous
		self.predicate = predicate
		self.message = message
	}

	public func validate(_ value: Any) -> Result<Output, ValidationError> {
		previous.validate(value)
			.flatMap {
				guard predicate($0) else {
					return .failure(.init(self.message))
				}

				return .success($0)
			}
	}
}

public extension Schema {
	func `is`(message: String = "Expected value to satisfy predicate", _ predicate: @escaping (Output) -> Bool) -> IsConstraint<Self> {
		.init(self, predicate, message: message)
	}
}
