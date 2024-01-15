public protocol Schema {
	associatedtype Input
	associatedtype Output

	func validate(_ value: Any) -> Result<Output, ValidationError>
}
