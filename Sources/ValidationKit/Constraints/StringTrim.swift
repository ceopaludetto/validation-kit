#if canImport(Foundation)
	import Foundation

	public extension Schema {
		func trim(in characterSet: CharacterSet) -> TransformConstraint<Self, String> where Self.Output == String {
			transform { $0.trimmingCharacters(in: characterSet) }
		}
	}
#endif
