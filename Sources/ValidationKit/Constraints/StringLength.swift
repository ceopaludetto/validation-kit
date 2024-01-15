public extension Schema {
	func length(_ size: UInt) -> IsConstraint<Self> where Self.Output == String {
		length(message: "Expected a string of size \(size)", size)
	}

	func length(message: String, _ size: UInt) -> IsConstraint<Self> where Self.Output == String {
		self.is(message: message) { $0.count == size }
	}

	func min(_ size: UInt) -> IsConstraint<Self> where Self.Output == String {
		min(message: "Expected a string of minimum size \(size)", size)
	}

	func min(message: String, _ size: UInt) -> IsConstraint<Self> where Self.Output == String {
		self.is(message: message) { $0.count >= size }
	}

	func max(_ size: UInt) -> IsConstraint<Self> where Self.Output == String {
		max(message: "Expected a string of maximum size \(size)", size)
	}

	func max(message: String, _ size: UInt) -> IsConstraint<Self> where Self.Output == String {
		self.is(message: message) { $0.count <= size }
	}
}
