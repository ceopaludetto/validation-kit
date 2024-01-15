public struct ArraySchema<T>: Schema {
	public typealias Input = Any
	public typealias Output = [T]

	public func validate(_ value: Input) -> Result<Output, ValidationError> {
		guard let value = value as? Output else {
			return .failure(ValidationError("Expected an array"))
		}

		return .success(value)
	}
}

public extension Validator {
	static func array<T>(_: T.Type) -> ArraySchema<T> {
		.init()
	}
}
