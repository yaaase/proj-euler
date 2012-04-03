Prime = {}
Prime.Iterator = function() {
  var current = 0;
  this.next = function() {
    while(Prime.isPrime(++current) === false) {}
    return current;
  }
}
Prime.isPrime = function(x) {
  if(x <= 1) return false;
  if(x === 2) return true;
  if(x % 2 === 0) return false;
  var sqrtX = Math.sqrt(x);
  for(var i = 3; i <= sqrtX; i += 2) {
    if(x % i === 0) {return false;}
  }
  return true;
}
var pi = new Prime.Iterator();
var current = pi.next();
var total = 0;
while(current < 2000000) {
  total += current;
  current = pi.next();
}
console.log(total);
