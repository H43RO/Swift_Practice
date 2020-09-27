
/* Optional */

// 암시적 추출 옵셔널
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
var optionalValue: Int? = 100
optionalValue = nil
// 기존 변수와 다른 타입으로 취급하여 연산 불가
//optionalValue = optionalValue + 1
