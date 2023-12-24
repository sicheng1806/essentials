

def to_m_decimal(N:int,m:int):
    stack = []
    while N:
        n = N % m
        N = N // m
        stack.append(n)
    result = '('
    while stack:
        result += f'{stack.pop()},'
    return result[0:-1] + f"){m}th"

if __name__ == '__main__':
    N = 1024
    print(to_m_decimal(N,16))
    print(f"{N:#x}")