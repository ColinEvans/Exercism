import Foundation

enum GrainsError: Error {
  case inputTooLow
  case inputTooHigh
}

struct Grains {
  static func square(_ num: Int) throws -> UInt64 {
    if num <= 0 {
      throw GrainsError.inputTooLow
    } else if num > 64 {
      throw GrainsError.inputTooHigh
    }
    
    let squared = calculate(num: num, total: 1) as NSNumber
    return UInt64(truncating: squared)
  }
  
  static var total: UInt64 {
    return (1...64).reduce(0, { partialResult, number in
      try! partialResult + square(number)
    })
  }
  
  private static func calculate(num: Int, total: Double) -> Double {
    switch num {
    case 1:
      return total
    default:
      let newTotal = total * 2
      return calculate(num: num - 1, total: newTotal)
    }
  }
}
