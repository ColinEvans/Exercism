//Solution goes in Sources

/// Length
func length<Element>(_ collection:[Element]) -> Int {
    return foldLeft(collection, accumulated: 0, combine: { (element, _) in
        element + 1
    })
}


// Append
/// [1, 2] [3] => [1,2,3]
func append<Element>(_ collectionOne: [Element], _ collectionTwo: [Element]) -> [Element] {
    return foldLeft(collectionTwo, accumulated: collectionOne) { $0 + [$1] }
}

func append<Element>(_ collection: [Element], _ element: Element) -> [Element] {
    return append(collection, [element])
}

// Concat - uses Append, foldr
func concat<Element>(_ collection: [Element]...) -> [Element] {
    return foldLeft(collection, accumulated: [Element](), combine: append)
}

/// Fold left
func foldLeft<Element, FoldedElement>(_ collection: [Element], accumulated: FoldedElement, combine: (FoldedElement, Element) -> FoldedElement) -> FoldedElement {
    var result = accumulated

    for element in collection {
        result = combine(result, element)
    }

    return result
}

/// Reverse
func reverse<Element>(_ collection: [Element]) -> [Element] {

    var reverse = [Element]()

    for (index, _) in collection.enumerated() {
        reverse.append(collection[(collection.count - 1) - index])
    }

    return reverse

}

// Fold right
/// ((((1 + 2) + 3) + 4) + 5) vs (5 + (4 + (3 + (2 + 1))))
func foldRight<Element, FoldedElement>(_ collection: [Element], accumulated: FoldedElement, combine: (Element, FoldedElement) -> FoldedElement) -> FoldedElement {
    return foldLeft(reverse(collection), accumulated: accumulated, combine: { result, element in
        combine(element, result)
    })
}

// Map
func map<Element, MappedElement>(_ collection: [Element], _ function: (Element) -> MappedElement) -> [MappedElement] {
    return foldLeft(collection, accumulated: [MappedElement](), combine: { (result, element) in
        append(result, function(element))
    })
}


// Filter - Prolly a foldR
func filter<Element>(_ collection: [Element], _ function: (Element) -> Bool) -> [Element] {
    return foldLeft(collection, accumulated: [Element](), combine: { (result, element) in
        if function(element) {
            return append(result, element)
        }
        return result
    })
}
