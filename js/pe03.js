var largest = 0;

// this function works
var isPrime = function(n) {
  for(i = 2; i < (n/2); i++) {
    if(n % i == 0) {
      return false;
    }
  }
  return true;
}

// this one does not
var largestPrimeFactor = function(n) {
  for(i = 2; i < Math.sqrt(n); i++) {
    if(isPrime(i)) {
      if(i > largest) {
        largest = i;
        console.log("Largest prime so far: " + i);
      }
    }
  }
}

largestPrimeFactor(13195);
