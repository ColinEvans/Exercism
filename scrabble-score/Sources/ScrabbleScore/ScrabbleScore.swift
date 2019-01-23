//Solution goes in Sources

/// A representation of a scrabble word followed by its score
class Scrabble {

    /// MARK: - Constants
    private struct Constants {

        /// Breakdowns for each point per letter in the game of `Scrabble`
        let scrabbleValues = ["A": 1, "E": 1, "I": 1, "O": 1, "U": 1,
                              "L": 1, "N": 1, "R": 1, "S": 1, "T": 1,
                              "D": 2, "G": 2, "B": 3, "C": 3, "M": 3,
                              "P": 3, "F": 4, "H": 4, "V": 4, "W": 4,
                              "Y": 4, "K": 5, "J": 8, "X": 8, "Q": 10,
                              "Z": 10]
    }

    /// MARK: Properties
    private let word: String?

    /// Computes the associated score for the associated `word`
    var score: Int {
        var score = 0

        guard let vaildWord = word else { return 0 }
        for letter in vaildWord {
            let upperLetter = String(letter).uppercased()
            if let charValue = Constants().scrabbleValues[upperLetter] {
                score += charValue
            }
        }

        return score
    }

    /// MARK: - Lifecycle Functions
    init(_ word: String?) {
        self.word = word
    }

    /// MARK: - Methods

    /// Given a new string compute its associated `Scrabble` score
    public static func score(_ newWord: String?) -> Int {
        return Scrabble(newWord).score
    }
}
