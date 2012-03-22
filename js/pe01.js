var sum = 0;
var prob1 = function() {
  for(i = 1; i < 1000; i++) {
    if( (i % 3 == 0) || (i % 5 == 0) ) {
      sum += i;
    }
  }
  console.log(sum);
}

prob1();
