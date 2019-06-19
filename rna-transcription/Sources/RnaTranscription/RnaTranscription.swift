
class Nucleotide {

    /// MARK: - Properties

    /// The given DNA strand
    let strand: String

    /// MARK: - Functions
    func complementOfDNA() throws -> String {
      return try strand.map {
            try switchStrand(strand: $0)
        }.joined()
    }

    /// For each valid strand returns its complement and fails otherwise
    func switchStrand(strand: Character) throws -> String {
        switch String(strand) {
        case "A":
            return "U"
        case "C":
            return "G"
        case "T":
            return "A"
        case "G":
            return "C"
        default:
            throw TranscriptionError.invalidNucleotide("\(strand) is not a valid Nucleotide")
        }
    }

    /// MARK: - lifecycle functions
    init(_ strand: String) {
        self.strand = strand
    }
}

/// MARK: - Error Handling
enum TranscriptionError: Error {
    case invalidNucleotide(String)
}
