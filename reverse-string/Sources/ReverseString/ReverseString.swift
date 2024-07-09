func reverseString(_ input : String) -> String {
  var inputSpace: [Character] = Array(input)
  var start = 0
  var last = input.count - 1
  
  while start < last {
    let temp = inputSpace[start]
    inputSpace[start] = inputSpace[last]
    inputSpace[last] = temp


    start += 1
    last -= 1
  }
  
  return String(inputSpace)
}
