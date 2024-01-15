public struct StringSchema: Schema {
	public typealias Input = Any
	public typealias Output = String

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
	static func string(message: String = "Expected a string") -> StringSchema {
		.init(message: message)
	}
}
