public struct ValidationError: Error, Equatable, Codable {
	public let message: String

	public init(_ message: String) {
		self.message = message
	}
}
