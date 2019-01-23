import Foundation

/// MARK: - Extensions <Collection>
extension Collection {
    
    /// Keep takes a predicate method and returns a filtered collection where the predicate on each element is true
    func keep<Element>(_ predicate: (Element) -> Bool) -> [Element] {
        var newCollection: [Element] = []
        for index in self {
            if let element = index as? Element,
                predicate(element) {
                newCollection.append(element)
            }
        }
        return newCollection
    }
    
    /// Discard takes a predicate method and returns a filtered collection where the predicte on each element is false
    func discard<Element>(_ predicate: (Element) -> Bool) -> [Element] {
        var newCollection: [Element] = []
        for index in self {
            if let element = index as? Element,
                !predicate(element) {
                newCollection.append(element)
            }
        }
        return newCollection
    }
}
