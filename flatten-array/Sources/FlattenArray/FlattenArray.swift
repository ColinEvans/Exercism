//Solution goes in Sources

func flattenArray<T>(_ arr: [Any] ) -> [T] {
  var solution = [T]()
  
  for element in arr {
    flattenHelper(element, &solution)
  }

  return solution
}

func flattenHelper<T>(_ element: Any, _ sol: inout [T]) {
  if let value = element as? T {
    sol.append(value)
  } else if let arr = element as? [Any] {
    for subElement in arr {
      flattenHelper(subElement, &sol)
    }
  }
}
