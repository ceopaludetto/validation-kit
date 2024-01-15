public extension Schema {
	func `true`(message: String = "Expected a true boolean") -> IsConstraint<Self> where Self.Output == Bool {
		self.is(message: message) { $0 == true }
	}
}
