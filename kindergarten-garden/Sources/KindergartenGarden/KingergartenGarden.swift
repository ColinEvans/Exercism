
public enum Constants {
    static let defaultNames = ["Alice", "Bob", "Charlie",
                               "David", "Eve", "Fred",
                               "Ginny", "Harriet", "Ileana",
                               "Joseph", "Kincaid", "Larry"]
    
    enum Plants {
        case violets
        case radishes
        case grass
        case clover
    }
}

// Given rows, determine which plants belong to each student
class Garden {
    
    /// MARK: Properties
    
    /// The completed garden diagram split by the number of rows `\n`
    private let gardenDiagram: [Substring]
    
    /// The names of the class students ordered Alphabetically
    private var children: [String]
    
    /// MARK: Lifecycle functions
    init(_ gardenDiagram: String, children: [String] = Constants.defaultNames) {
        self.children = children.sorted{ $0 < $1} // sort alphabetically
        self.gardenDiagram = gardenDiagram.split(separator: "\n")
    }
 
    /// MARK: Functions

    /// split the array into first or second half and look in there
    func plantsForChild(_ child: String) -> [Constants.Plants] {
        guard var index = children.firstIndex(of: child) else { return [] }
        // Each index needs an offset of 2 since they have two plants per row
        index *= 2
        let range = String.Index(encodedOffset: index)...String.Index(encodedOffset: index+1)
        var childRow:[Constants.Plants] = []
        for row in gardenDiagram {
            let plants = String(row)[range]
            childRow += translate(plants: plants)
        }
        return childRow
    }
    
    /// Translates the enum in the garden into an array
    private func translate(plants: Substring) -> [Constants.Plants] {
        var convertedGarden: [Constants.Plants] = []
        for plant in plants {
            switch plant {
            case "G":
                convertedGarden.append(.grass)
            case "V":
                convertedGarden.append(.violets)
            case "R":
                convertedGarden.append(.radishes)
            case "C":
                convertedGarden.append(.clover)
            default:
                break
            }
        }
        return convertedGarden
    }
}


/* Notes:
 - Strings are value not reference types thus the introduction to Substring as a reference type allows for
   a reference to the original string without copying all the values over again
 
 - Cannot Index each substring in the ORIGINAL STRING RANGE as it's own index since it's shared with the string
 
 - Need to use a String.Index in order to index into a string instead of just a regular Integer
 
 Question:
   // TODO: Remove use of `encodedOffset` as it is deprecated in swift 4.2+
   - Don't know what to use instead of the deprecated method to get an Int index into a String.Index
 */
