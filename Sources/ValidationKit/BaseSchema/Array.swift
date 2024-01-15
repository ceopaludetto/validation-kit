public struct ArraySchema<T>: Schema {
	public typealias Input = Any
	public typealias Output = [T]

	private let message: String

	public init(message: String) {
		self.message = message
	}

	public func validate(_ value: Input) -> Result<Output, ValidationError> {
		guard let value = value as? Output else {
			return .failure(.init(message))
		}

		return .success(value)
	}
}

public extension Validator {
	static func array<T>(message: String = "Expected an array", _: T.Type) -> ArraySchema<T> {
		.init(message: message)
	}
}
