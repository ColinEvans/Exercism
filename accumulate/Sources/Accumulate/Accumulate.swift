//Solution goes in Sources



extension Collection {

    func accumulate<TransformedElement>(_ input: (Element) -> TransformedElement) -> [TransformedElement]{

        // using map
        // return map{ input($0) }

        // not using map
        var transformedArray: [TransformedElement] = []
        for element in self {
            let transformedElement = input(element)
            transformedArray.append(transformedElement)
        }

        return transformedArray
    }
}
