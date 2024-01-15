public extension Schema {
	func `false`(message: String = "Expected a false boolean") -> IsConstraint<Self> where Self.Output == Bool {
		self.is(message: message) { $0 == false }
	}
}
