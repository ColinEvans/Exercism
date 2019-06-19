//Solution goes in Sources

/// This class does the transform step of the `ETL` process for scrabble scores
struct ETL {
    
   static func transform(_ oldDict: [Int:[String]]) -> [String:Int] {
        var newDict: [String:Int] = [:]
        for (index,value) in oldDict {
            for string in value {
                newDict[string.lowercased()] = index
            }
        }
        return newDict
    }
}
