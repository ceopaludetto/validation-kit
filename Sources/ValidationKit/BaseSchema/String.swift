public struct StringSchema: Schema {
	public typealias Input = Any
	public typealias Output = String

	public func validate(_ value: Input) -> Result<Output, ValidationError> {
		guard let value = value as? Output else {
			return .failure(ValidationError("Expected a string"))
		}

		return .success(value)
	}
}

public extension Validator {
	static func string() -> StringSchema {
		.init()
	}
}
