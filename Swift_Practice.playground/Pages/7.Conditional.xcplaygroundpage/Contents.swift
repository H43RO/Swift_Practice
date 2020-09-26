
/* 조건문 */

// if-else
// 스위프트의 조건에는 항상 Bool 타입이 들어와야함
let someInteger = 100

if someInteger < 100 {
    print("100 미만")
} else if someInteger > 100 {
    print("100 초과")
} else {
    print("100")
}

// switch
// 정수형 이외에도 대부분 기본 타입 비교를 지원하고, 다양한 패턴과도 응용 가능
switch someInteger {
case 0:
    print("Zero")
case 1..<100:
    print("1~99")
case 100:
    print("100")
case 101...Int.max:
    print("over 100")
default:
    print("Unknown")
}

switch "H43RO" {
case "jake":
    print("Jake")
case "Mina":
    print("Mina")
case "H43RO":
    print("H43RO")
default:
    print("Unknown")
}
