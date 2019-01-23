//Solution goes in Sources

struct Triangle {


    /// MARK: Properties
    let sideOne: Float

    let sideTwo: Float

    let sideThree: Float

    var kind: String {

        if sideOne <= 0 || sideTwo <= 0 || sideThree <= 0 {
             return "ErrorKind"
        }

        if sideOne + sideTwo < sideThree || sideOne + sideThree < sideTwo || sideThree + sideTwo < sideOne {
            return "ErrorKind"
        }

        switch sideOne {
        case _ where sideOne == sideTwo && sideTwo == sideThree:
            return "Equilateral"
        case _ where sideOne == sideTwo || sideTwo == sideThree || sideOne == sideThree:
            return "Isosceles"
        case _ where sideOne != sideTwo && sideTwo != sideThree:
            return "Scalene"
        default:
            return "ErrorKind"
        }
    }


    /// MARK: - Lifecycle functions
    init(_ sideOne: Float, _ sideTwo: Float, _ sideThree: Float) {
        self.sideOne = sideOne
        self.sideTwo = sideTwo
        self.sideThree = sideThree
    }


}
