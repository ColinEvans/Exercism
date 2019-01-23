

/// A board for the game `Mine Sweeper`
class Board {
    
    /// MARK: Properties
    let gameboard: [String]
    
    /// MARK: Lifecycle functions
    init(_ input: [String]){
        self.gameboard = input
    }
    
    /// MARK: Methods
    
    /// Outputs the gameboard where each line has the numeric hints
    func transform() {
        
        var scoreTracker: [[Int]] = []
        for line in gameboard {
            for piece in line {
                if piece == "*" {
                    scoreTracker[line][piece]
                }
            }
        }
    }
}
