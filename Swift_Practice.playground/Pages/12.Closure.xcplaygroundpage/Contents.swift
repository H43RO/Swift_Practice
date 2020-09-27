
/* Closure */

// 코드의 블럭을 변수, 상수 등으로 저장할 수 있고 전달인자로 전달 가능
// 함수도 클로저의 일종임 (이름이 있는 클로저일 뿐)

// { (매개변수) -> 반환 타입 in
//     print("Closure!")
// }

// 함수를 사용한다면
func sumFunction(a: Int, b: Int) -> Int {
    return a + b
}

var sumResult: Int = sumFunction(a: 1, b: 2)

// 클로저를 사용한다면
var sum: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
    return a + b
}

sumResult = sum(1, 2)
print(sumResult) // 3

// 함수도 클로저의 일종이므로 sum 에 sumFunction 을 할당할 수 있음
sum = sumFunction(a:b:)
print(sum(1, 2)) // 3


// 함수 전달인자로서의 클로저
let add: (Int, Int) -> Int
add = { (a: Int, b: Int) -> Int in
    return a + b
}

let substract: (Int, Int) -> Int
substract = { (a: Int, b: Int) -> Int in
    return a - b
}

let divide: (Int, Int) -> Int
divide = { (a: Int, b: Int) -> Int in
    return a / b
}

// Method 파라미터에 클로저들이 담기게 됨
func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
    return method(a, b) // 함수 안에서 전달받은 클로저를 실행하도록 구현
}

var calculated: Int
// add 클로저를 전달함으로써 덧셈 연산이 일어남
calculated = calculate(a: 50, b: 10, method: add)
print(calculated)

// 위를 응용하여, 따로 클로저를 미리 구성해두지 않고 호출할 때 작성하여 전달할 수도 있음
calculated = calculate(a: 50, b: 10, method: { (left: Int, right: Int) -> Int in
    return left * right
})
print(calculated)
