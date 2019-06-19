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
    
    
    /// Error Types
    static let InitError: QueensErrors = QueensErrors.InitError
    
    /// Returns a `String` of the current `board` state
    var description: String {
        return board.joined().joined(separator: "\n")
    }
    
    
    private var board: [[String]] = {
        let row = Array.init(repeating: "-", count: 8)
        return Array.init(repeating: row, count: 8)
    }()
    
    /// MARK: Lifecycle Functions
    init(white: [Int], black: [Int]) throws {
        if (white == black) { throw Queens.InitError }
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
    
}

/// MARK: Extensions <Error>
extension Queens {
    
    enum QueensErrors: Error {
        case InitError
    }
}
