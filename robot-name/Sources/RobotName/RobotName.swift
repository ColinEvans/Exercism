//Solution goes in Sources

class Robot {

    /// MARK: - Properties
    var name: String

    /// MARK: - Lifecycle functions
    init() {

        self.name = { () in
            var robotName = ""

            for index in 0...4 {
                if index < 2 {
                    let letter = UnicodeScalar(Int.random(in: 65...90))
                    if let letter = letter?.description {
                        robotName.append(letter)
                    }
                } else {
                    robotName.append(String(Int.random(in: 0 ..< 10)))
                }
            }

            return robotName
        }()
    }

    private func setName() -> String {
        var robotName = ""

        for index in 0...4 {
            if index < 2 {
                let letter = UnicodeScalar(Int.random(in: 65...90))
                if let letter = letter?.description {
                    robotName.append(letter)
                }
            } else {
                robotName.append(String(Int.random(in: 0 ..< 10)))
            }
        }

        return robotName
    }

    func resetName() {
        name = setName()
    }

}
