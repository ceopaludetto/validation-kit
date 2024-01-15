public extension Schema {
	func uppercased() -> TransformConstraint<Self, String> where Self.Output == String {
		transform { $0.uppercased() }
	}
}
