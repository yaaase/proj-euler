#include <stdio.h>

int main(int argc, char *argv[])
{
  int a = 1;
  int b = 1;
  int c = 0;
  int limit = 4000000;
  int sum = 0;

  while(b < limit) {
    if(b % 2 == 0) {
      sum = sum + b;
    }
    c = a;
    a = b;
    b = a + c;
  }

  printf("Solved: %d\n", sum);

  return 0;
}
