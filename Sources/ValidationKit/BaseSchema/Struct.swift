public class StructSchema<T>: Schema {
	public typealias Input = Any
	public typealias Output = T

	private let message: String

	private var schemas: [AnyKeyPath: (Any) -> Result<Any, ValidationError>] = [:]

	public init(message: String) {
		self.message = message
	}

	public func validate(_ value: Input) -> Result<Output, ValidationError> {
		guard let value = value as? Output else {
			return .failure(.init(message))
		}

		for (key, schema) in schemas {
			guard let input = value[keyPath: key] else {
				fatalError("Unexpected \(key) in \(value)")
			}

			guard case let .failure(error) = schema(input) else {
				continue
			}

			return .failure(error)
		}

		return .success(value)
	}

	public func `for`<U, S>(key: KeyPath<T, U>, _ builder: @autoclosure @escaping () -> S) -> Self where S: Schema, S.Output == U {
		let schema = builder()

		schemas[key] = { value in schema.validate(value).map { $0 as Any } }
		return self
	}
}

public extension Validator {
	static func `struct`<T>(message: String = "Expected a struct", _: T.Type) -> StructSchema<T> {
		.init(message: message)
	}
}
