a = 1
b = 1
c = 1
total = 0

while(b < 4000000):
    if(b % 2 == 0):
        total += b
    c = a
    a = b
    b = a + c

print total
