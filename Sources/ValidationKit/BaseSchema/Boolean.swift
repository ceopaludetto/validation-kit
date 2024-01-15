public struct BooleanSchema: Schema {
	public typealias Input = Any
	public typealias Output = Bool

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
	static func boolean(message: String = "Expected a boolean") -> BooleanSchema {
		.init(message: message)
	}
}
