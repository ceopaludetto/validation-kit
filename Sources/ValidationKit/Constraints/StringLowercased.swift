public extension Schema {
	func lowercased() -> TransformConstraint<Self, String> where Self.Output == String {
		transform { $0.lowercased() }
	}
}
