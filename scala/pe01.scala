def problem1(): Int = {
  var sum = 0
  for(i <- 1 until 1000)
    if(i % 3 == 0) sum += i
    else if(i % 5 == 0) sum += i
  return sum
}
println(problem1())
