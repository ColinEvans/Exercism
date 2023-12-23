import Foundation

class Bob {
  
  private struct Responses {
    static let lowercaseQuestion = "Sure."
    static let yelling = "Whoa, chill out!"
    static let yellingQuestion = "Calm down, I know what I'm doing!"
    static let silence = "Fine. Be that way!"
    static let theRest = "Whatever."
  }
  
  static func response(_ message: String) -> String {
    if isUppercase(message),
       isQuestion(message) {
      return Responses.yellingQuestion
    } else if isUppercase(message) {
      return Responses.yelling
    } else if isQuestion(message) {
      return Responses.lowercaseQuestion
    } else if checkSilence(message) {
      return Responses.silence
    } else {
      return Responses.theRest
    }
  }
  
  private static func isUppercase(_ message: String) -> Bool {
    let isGivenMessageUppercase = message
      .filter { $0.isLetter }
      .isUpperCase()
    let doesMessageContainCharacters = message.containsLetters()
   
    return isGivenMessageUppercase && doesMessageContainCharacters
  }
  
  private static func isQuestion(_ message: String) -> Bool {
    guard let last = message
      .trimmingCharacters(in: .whitespacesAndNewlines)
      .last else {
      return false
    }

    return last == "?"
  }
  
  private static func checkSilence(_ message: String) -> Bool {
    message.isWhiteSpace()
  }
}

// MARK: - Extensions<String>
extension String {
  /// Checks if the String contains all uppercase characters
  ///
  ///  - Returns: A boolean indicating if all of the characters in the`String` are uppercased.
  func isUpperCase() -> Bool {
    self.filter { $0.isUppercase }.count == self.count
  }

  /// Checks if the String contains all whitespace characters
  ///
  ///  - Returns: A boolean indicating if all of the characters in the`String` are whitespace.
  func isWhiteSpace() -> Bool {
    self.filter { $0.isWhitespace }.count == self.count
  }
  
  /// Checks if the String contains at least one `Character`
  ///
  ///  - Returns: A boolean indicating if there are at least one `Character` in the `String`
  func containsLetters() -> Bool {
    self.filter { $0.isLetter }.count > 0
  }
}
