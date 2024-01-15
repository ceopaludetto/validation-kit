public protocol Schema {
	associatedtype Input
	associatedtype Output

	@discardableResult
	func validate(_ value: Any) -> Result<Output, ValidationError>
}
