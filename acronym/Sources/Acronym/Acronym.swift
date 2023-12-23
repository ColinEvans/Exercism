struct Acronym {
  static func abbreviate(_ inString: String) -> String {
    let components = inString.replacing("-", with: " ")
      .filter { $0.isLetter || $0.isWhitespace }
      .split(separator: " ")

    return components.compactMap { component -> String? in
      guard let first = component.first else { return nil }
      return first.uppercased()
    }.joined()
  }
}
