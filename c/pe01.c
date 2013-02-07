#include <stdio.h>

int main(int argc, char *argv[])
{
  int limit = 1000;
  int sum = 0;

  int i;
  for(i = 1; i < limit; i++)
  {
    if(i % 3 == 0 || i % 5 == 0)
    {
      sum = sum + i;
    }
  }

  printf("Solved: %d\n", sum);

  return 0;
}
