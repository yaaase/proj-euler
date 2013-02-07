#include <stdio.h>

int main(int argc, char *argv[])
{
  int sum_of_squares = 0;
  int square_of_sums = 0;

  int x;
  for(x = 1; x <= 100; x++) {
    sum_of_squares = sum_of_squares + (x * x);
  }

  for(x = 1; x <= 100; x++) {
    square_of_sums = square_of_sums + x;
  }

  square_of_sums = (square_of_sums * square_of_sums);
  int solution = square_of_sums - sum_of_squares;

  printf("Solved: %d\n", solution);

  return 0;
}
