//Solution goes in Sources

import Foundation

/// A class that performs the sum and difference of squares meethodss
class Squares {

    /// MARK: - Properties

    /// The first N number(s)
    let num: Int

    /// The sum of the squares from 1 ... `num`
    var sumOfSquares: Int

    /// The Square of the sum from 1 ... `num`
    var squareOfSum: Int
   
    /// The Difference of the `squareOfSum` and `sumOfSquares`
    var differenceOfSquares: Int

    /// MARK: - Lifecycle functions
    init(_ num: Int) {

        self.num = num
        var sum = 0
        
        // Set the `sumOfSquares`
        for index in 1...num {
            sum += index * index
        }
        self.sumOfSquares = sum
        sum = 0
        
        // Set the `squareOfSum`
        for index in 1...num {
            sum += index
        }
        self.squareOfSum = sum * sum
        
        // Set the `differenceOfSquares`
        self.differenceOfSquares = self.squareOfSum - self.sumOfSquares
    }

}
