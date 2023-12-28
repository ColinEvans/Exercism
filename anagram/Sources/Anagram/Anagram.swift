class Anagram {

  private let word: String
  private let sortedWord: [Character]

  init(word: String) {
    self.word = word
    sortedWord = word.lowercased().sorted(by: <)
  }

  func match(_ candidates: [String]) -> [String] {
    var result = [String]()
    candidates
      .filter { $0.lowercased() != word.lowercased() }
      .forEach {
        let sortedCandidate = $0.lowercased().sorted(by: <)
        if sortedWord == sortedCandidate {
          result.append($0)
      }
    }
    return result
  }
}