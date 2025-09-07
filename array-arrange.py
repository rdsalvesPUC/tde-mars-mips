numeros = [4, 3, 9, 5, 2, 1]

n = len(numeros)
for i in range(n):
    for j in range(0, n - i - 1):
        if numeros[j] > numeros[j + 1]:
            numeros[j], numeros[j + 1] = numeros[j + 1], numeros[j]

print(numeros)
