public extension Schema {
	func length<T>(_ size: UInt) -> IsConstraint<Self> where Self.Output == [T] {
		length(message: "Expected an array of size \(size)", size)
	}

	func length<T>(message: String, _ size: UInt) -> IsConstraint<Self> where Self.Output == [T] {
		self.is(message: message) { $0.count == size }
	}

	func min<T>(_ size: UInt) -> IsConstraint<Self> where Self.Output == [T] {
		min(message: "Expected an array of minimum size \(size)", size)
	}

	func min<T>(message: String, _ size: UInt) -> IsConstraint<Self> where Self.Output == [T] {
		self.is(message: message) { $0.count >= size }
	}

	func max<T>(_ size: UInt) -> IsConstraint<Self> where Self.Output == [T] {
		max(message: "Expected an array of maximum size \(size)", size)
	}

	func max<T>(message: String, _ size: UInt) -> IsConstraint<Self> where Self.Output == [T] {
		self.is(message: message) { $0.count <= size }
	}
}
