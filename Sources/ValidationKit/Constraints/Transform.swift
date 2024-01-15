public struct TransformConstraint<Previous, Output>: Schema where Previous: Schema {
	public typealias Input = Previous.Output
	public typealias Output = Output

	private let previous: Previous
	private let transform: (Input) -> Output

	public init(_ previous: Previous, _ transform: @escaping (Input) -> Output) {
		self.previous = previous
		self.transform = transform
	}

	public func validate(_ value: Any) -> Result<Output, ValidationError> {
		previous.validate(value).map(transform)
	}
}

public extension Schema {
	func transform<R>(_ transform: @escaping (Output) -> R) -> TransformConstraint<Self, R> {
		.init(self, transform)
	}
}
