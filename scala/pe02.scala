def problem2(): Int = {
  var sum = 0
  var a = 1
  var b = 1
  while(b < 4000000) {
    if(b % 2 == 0) { sum += b }
    var c = a
    a = b
    b = a + c
  }
  return sum
}
println(problem2())
