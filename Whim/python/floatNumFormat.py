import numpy as np

def getFloatMat(num):
    print num
    num_sign = 0
    byte = 32
    sign = 1
    exponet = 8
    manti = byte - exponet - sign

    exponet_bit = np.zeros(exponet)
    manti_bit = np.zeros(manti)

    if num < 0:
        num_sign = 1
        num = - num
    cout = 0

    while num > 2:
        num /= 2
        cout += 1

    while num < 1:
        num *= 2
        cout -= 1

    total_num = cout + 127

    for i in range(7,-1,-1):
        tmp = 2 ** i
        if total_num - tmp >= 0:
            total_num -= tmp
            exponet_bit[i] = 1

    num -= 1
    for i in range(1,manti+1):
        tmp = 2 ** -i
        # print num - tmp
        if num - tmp >= 0:
            num -= tmp
            manti_bit[i-1] = 1

    print "Sign:\t" + str(num_sign)
    print "Exp:\t" + str(exponet_bit)
    print "Manti:\t" + str(manti_bit)


getFloatMat(0.125)
getFloatMat(125.0)
getFloatMat(125.125)
getFloatMat(1.2312315)
getFloatMat(-123154123123.1)
getFloatMat(0.12341233)