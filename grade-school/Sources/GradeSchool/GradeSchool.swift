//Solution goes in Sources

class GradeSchool {
    
    /// MARK: Properties
    var roster: [Int:[String]]
    
    /// Sort the students in each grade by name
    var sortedRoster: [Int:[String]] {
        return roster.mapValues { (classList) -> [String] in
            var classList = classList
            classList.sort()
            return classList
        }
    }
    
    /// MARK: Lifecycle Functions
    init(_ roster:[Int:[String]] = [:]) {
        self.roster = roster
    }
    
    /// MARK: Methods
    
    /// Add a student to the correct class list based off of grade
    func addStudent(_ name: String, grade: Int) {
        if roster[grade] != nil {
            roster[grade]?.append(name)
        }else {
            roster[grade] = [name]
        }
    }
    
    /// Returns the class list for the students in a given grade
    func studentsInGrade(_ grade: Int) -> [String] {
        guard let classList = roster[grade] else { return [] }
        
        return classList
    }
}
