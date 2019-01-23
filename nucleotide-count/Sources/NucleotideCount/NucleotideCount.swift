//Solution goes in Sources

class DNA {

    let strand: String?

    public init?(strand: String?) {
        if let strand = strand {
            let allowableStrands = ["A","C","G","T"]
            let newStrand = strand.filter{allowableStrands.contains(String($0))}
            if newStrand.count != strand.count { return nil }
            self.strand = strand
        } else {
            return nil
        }
    }

    // could probably write with filter too
    func counts() -> [String:Int] {
        var strandBreakDown = ["A": 0, "C": 0, "G": 0, "T": 0]
        strand?.forEach { (element) in
            let stringElement = String(element)

            if let updatedValue = strandBreakDown["A"], stringElement == "A" {
                strandBreakDown["A"] = updatedValue + 1
            }
            if let updatedValue = strandBreakDown["C"], stringElement == "C" {
                strandBreakDown["C"] = updatedValue + 1
            }
            if let updatedValue = strandBreakDown["G"], stringElement == "G" {
                strandBreakDown["G"] = updatedValue + 1
            }
            if let updatedValue = strandBreakDown["T"], stringElement == "T" {
                strandBreakDown["T"] = updatedValue + 1
            }
        }

        return strandBreakDown
    }

    func count(_ nuc: Character) -> Int {
        return strand?.filter{$0 == nuc}.count ?? 0
    }
}
