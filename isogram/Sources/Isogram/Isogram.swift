//Solution goes in Sources

private struct allowedChars {
    let allowedConstants = [" ", "-"]
}

/// MARK: - Functions
func isIsogram(_ string: String) -> Bool {
    var processed = ""
    let allowed = allowedChars()

    for char in string.lowercased() {
        if processed.contains(char) && !allowed.allowedConstants.contains(String(char)) {
            return false
        }
        processed.append(char)
    }

    return true
}
