
/* Optional */

// 암시적 추출 옵셔널
// nil 을 포함할 수 있는데, 접근할 때 바인딩, 언래핑 과정을 거치지 않아도 됨
// 하지만 값이 없을 경우 (초기화 안한 경우) 런타임 에러 발생
var optionalValue: Int! = 100

switch optionalValue {
case .none:
    print("This Optional Value is nil")
case .some(let value):
    print("Value is \(value)")
}

// 기존 변수처럼 사용 가능
optionalValue = optionalValue + 1

// nil 할당 가능
optionalValue = nil
// 잘못된 접근으로 인한 런타임 오류 발생 가능
//optionalValue = optionalValue + 1


// ? 옵셔널
var optionalValues: Int? = 100
optionalValues = nil
// 기존 변수와 다른 타입으로 취급하여 연산 불가
//optionalValue = optionalValue + 1


// 옵셔널 추출 - 옵셔널 바인딩
func printName(_ name: String){ // 참고로 파라미터 앞에 _ 를 붙이면 호출 시 파라미터 이름을 생략할 수 있음
    print(name)
}

var myName: String! = "H43RO"

//if let 상수를 생성하여 바인딩 가능
if let name: String = myName {
    printName(name)
} else {
    print("MyName == nil")
}

var yourName: String? = nil

// 여러 개의 변수도 다음과 같이 한번에 바인딩 가능
if let name = myName, let friend = yourName {
    print("\(name) and \(friend)")
}
// yourName 이 nil 이기 때문에 실행되지 않음

yourName = "hana"

if let name = myName, let friend = yourName {
    print("\(name) and \(friend)")
}

// 옵셔널 추출 - 강제 추출 (추천하진 않음)

// ! 를 붙여 강제로 값을 추출하되, 값이 없으면 런타임 오류 발생
printName(myName!)

