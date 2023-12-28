class Board {
  private static let bomb: Character = "*"

  let grid: [String]

  init(_ boardComponents: [String]) {
    self.grid = boardComponents
  }
  
  // MARK: - Public functions
  func transform() -> [String] {
    grid.enumerated().map { rowNumber, row in
      row.enumerated().map { index, character in
        guard character == " " else { return String(character) }
        var count = 0
        count += isAdjacentBomb(for: row, index: index)
        count += isAboveOrBelowBomb(for: rowNumber, index: index)
        count += isDiagonalBomb(for: rowNumber, index: index)
        
        return count == 0 ? " " : String(count)
      }.joined()
    }
  }
  
  // MARK: - Private Function check for bomb
  // Given the resections on input, we don't need to worry about incorrect Unicode conversions
  private func isAdjacentBomb(for row: String, index: Int) -> Int {
    let characters = Array(row)
    var count = 0
    if index > 0,
       characters[index - 1] == Self.bomb {
      count += 1
    }
    if index < row.count - 1,
       characters[index + 1] == Self.bomb {
      count += 1
    }
    return count
  }
  
  private func isAboveOrBelowBomb(for rowNumber: Int, index: Int) -> Int {
    var count = 0
    var skipAbove = false
    var skipBelow = false
    if rowNumber == .zero {
      skipAbove = true
    }
    if rowNumber == grid.count - 1 {
      skipBelow = true
    }
    
    if !skipAbove {
      let aboveRow = Array(grid[rowNumber - 1])
      if aboveRow[index] == Self.bomb {
        count += 1
      }
    }
    
    if !skipBelow {
      let belowRow = Array(grid[rowNumber + 1])
      if belowRow[index] == Self.bomb {
        count += 1
      }
    }
    return count
  }
  
  private func isDiagonalBomb(for rowNumber: Int, index: Int) -> Int {
    var count = 0
    var skipAbove = false
    var skipBelow = false
    if rowNumber == .zero {
      skipAbove = true
    }
    if rowNumber == grid.count - 1 {
      skipBelow = true
    }
    
    if !skipAbove {
      let aboveRow = Array(grid[rowNumber - 1])
      if index > 0,
        aboveRow[index - 1] == Self.bomb {
        count += 1
      }
      if index < aboveRow.count - 1,
        aboveRow[index + 1] == Self.bomb {
        count += 1
      }
    }
    
    if !skipBelow {
      let belowRow = Array(grid[rowNumber + 1])
      if index > 0,
        belowRow[index - 1] == Self.bomb {
        count += 1
      }
      if index < belowRow.count - 1,
        belowRow[index + 1] == Self.bomb {
        count += 1
      }
    }

    return count
  }
}
