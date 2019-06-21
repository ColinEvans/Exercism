//Solution goes in Sources

/// some stuff about queens
class Queens {
    
    /// MARK: variables
    
    /// Default positions for the white and black pieces
    private let whiteDefault = (0, 3)
    private let blackDefault = (7, 3)
    
    /// Current positions for the white and black pieces
    var white: [Int]
    var black: [Int]
    
    /// Returns a `String` of the current `board` state
    /// TODO: Can this be done functionally??
    var description: String {
        var mutatedStr = ""
        for string in board {
            for (index, char) in string.enumerated() {
                if index == string.count - 1 {
                    mutatedStr.append(char)
                    mutatedStr.append("\n")
                } else {
                    mutatedStr.append(char)
                    mutatedStr.append(" ")
                }
            }
        }
        mutatedStr.removeLast()
        return mutatedStr
    }
    
    
    private var board: [[String]] = {
        let row = Array.init(repeating: "_", count: 8)
        return Array.init(repeating: row, count: 8)
    }()
    
    /// MARK: Lifecycle Functions
    init(white: [Int], black: [Int]) throws {

        if (white == black) { throw InitError.sameSpace }
        if (white.count != 2 || black.count != 2) { throw InitError.incorrectNumberOfCoordinates }
        if (white.filter { $0 > 7 || $0 < 0 }.count > 0 || black.filter { $0 > 7 || $0 < 0 }.count > 0) { throw InitError.invalidCoordinates }

        self.white = white
        self.black = black
        board[white[0]][white[1]] = "W"
        board[black[0]][black[1]] = "B"
    }
    
    init() {
        white = [whiteDefault.0, whiteDefault.1]
        black = [blackDefault.0, blackDefault.1]
        placeQueenToDefault()
    }
    
    
    /// MARK: Functions
    private func placeQueenToDefault() {
        board[whiteDefault.0][whiteDefault.1] = "W"
        board[blackDefault.0][blackDefault.1] = "B"
    }
    
    var canAttack: Bool {
        // Check the same row
        if (black[0] == white[0]) { return true }
        
        // Check the same column
        if (black[1] == white[1]) { return true }
        
        // Check diag
        if (black[1] != white[1] && black[0] != white[0]) { return true }
 
        return false
    }
    
}

/// MARK: Extensions <Error>
extension Queens {
    enum InitError: Error {
        case incorrectNumberOfCoordinates
        case invalidCoordinates
        case sameSpace
    }
}
