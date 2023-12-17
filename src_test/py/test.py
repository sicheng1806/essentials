


def makeNext(p:str):
    '''返回字符创p的next数组'''
    _next = [0] # i = 0时必定为0
    for i in range(1,len(p)):
        # p[0:k] == p[i-k:i]
        _next.append(0)
        for k in range(i-1,0,-1):
            if p[0:k] == p[i-k:i]:
                _next[-1] = k
                break
    return _next

def index(s:str,p:str):
        p_next = makeNext(p)
        i = 0
        for j in range(len(s)):
            if i >= len(p):
                return j-len(p) #退出条件
            if p[i] == s[j]: 
                i += 1
                continue
            else:
                i = p_next[i]
                continue
        if i >= len(p):
            return len(s) - len(p) # 表示s与p在最末尾匹配成功
        return None

if __name__ == '__main__':
    s = "abcasfladsdaBABBABABfdfafafladfjdslfladafjlajfldaksjf"
    p = "BABBABAB"
    i = index(s,p)
    _next = makeNext(p)
    print(_next)
    print(i)
    
