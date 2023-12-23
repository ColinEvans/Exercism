import Foundation

enum Allergens: Int {
  case eggs = 1
  case peanuts = 2
  case shellfish = 4
  case strawberries = 8
  case tomatoes = 16
  case chocolate = 32
  case pollen = 64
  case cats = 128
}

extension Allergens: CustomStringConvertible {
  var description: String {
    switch self {
    case .eggs:
      return "eggs"
    case .peanuts:
      return "peanuts"
    case .shellfish:
      return "shellfish"
    case .strawberries:
      return "strawberries"
    case .tomatoes:
      return "tomatoes"
    case .chocolate:
      return "chocolate"
    case .pollen:
      return "pollen"
    case .cats:
      return "cats"
    }
  }
}

class Allergies {
  private let allergyScore: Double
  init(_ allergyScore: Double) {
    self.allergyScore = allergyScore
  }
  
  func allergicTo(item: String) -> Bool {
    list().contains(item)
  }
  
  func list() -> [String] {
    getAllAllergies().map { String(describing: $0) }
  }
  
  private func getHighestBase(for score: Double) -> Int {
    var score = score
    while log2(score).rounded() != log2(score) {
      score -= 1
    }
    
    return Int(score)
  }
  
  private func getAllAllergies() -> [Allergens] {
    var start = allergyScore
    var allergies = [Int]()
    while start > 0 {
      let highestBase = getHighestBase(for: start)
      allergies.append(highestBase)
      start -= Double(highestBase)
    }
  
    return allergies
      // Sorted required for unwritten test requirement where allergies
      // are sorted from lowest to highest
      .sorted(by: <)
      .compactMap { allergyScore -> Allergens? in
        guard let allergen = Allergens(rawValue: allergyScore) else {
          return nil
        }
        return allergen
      }
  }
}
