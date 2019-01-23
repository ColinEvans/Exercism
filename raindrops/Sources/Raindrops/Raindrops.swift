//Solution goes in Sources
struct Raindrops {

    /// MARK: - Properties
    let drops: Int


    /// MARK: - Lifecycle functions
    init(_ drops: Int) {
        self.drops = drops
    }

    /// Methods
    var sounds: String {
        var sound = ""
        if drops % 3 == 0 { sound.append("Pling")}
        if drops % 5 == 0 { sound.append("Plang")}
        if drops % 7 == 0 { sound.append("Plong")}
        if sound.count == 0 { return String(drops)}
        return sound
    }

}
