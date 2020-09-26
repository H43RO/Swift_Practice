
// Extension
// 구조체, 클래스, 열거형, 프로토콜 타입에 새로운 기능을 추가할 수 있음
// 그렇지만 상속과 다르게 기존 기능을 재정의할 수 없고, 수평적 확장 개념임 ( 모든 타입에 대해 적용 가능하다는 이점이 있다 )
// Extension 역시 다른 Protocol을 채택할 수 있도록 확장할 수도 있음
// 실제로 스위프트 표준 라이브러리의 대부분 기능은 익스텐션으로 구현되어 있을만큼 강력한 기능임

extension Int {
    var isEven: Bool{
        return self % 2 == 0
    }
    
    var isOdd: Bool {
        return self % 2 == 1
    }
    
    func multiply(by n: Int) -> Int {
        return self * n
    }
}

print(1.isEven)
print(2.isEven)
print(3.isOdd)
print(4.isOdd)

var number: Int = 3
print(number.isOdd) // true
print(number.multiply(by: 2)) // 6

extension String {
    subscript(appendValue: String)->String {
        return self + appendValue
    }
    
    subscript(repeatCount: UInt) -> String {
        var str: String = ""
        for _ in 0..<repeatCount {
            str += self
        }
        return str
    }
}

print("abc"["def"])
print("abc"[3])

// Extension 을 활용하여 Protocol 의 초기 구현을 할 수도 있음 (중복 코드 방지)

protocol Talk {
    var topic: String { get set }
    func talk(to: Self)
}

// Extension 을 사용한 프로토콜 초기 구현
extension Talk {
    func talk(to: Self){
        print("\(to)! \(topic)")
    }
}

// func talk() 를 구현하지 않아도 오류가 안남
struct PersonStruct: Talk{
    var topic: String
    var name: String
}

// func talk() 초기 구현과 다른 동작을 해야하면 재정의 하면 됨
struct Monkey: Talk{
    var topic: String
    func talk(to: Monkey){
        print("\(to)! 우끼끼")
    }
}

let personStruct = PersonStruct(topic: "Swift", name: "H43RO")
let hana = PersonStruct(topic: "Internet", name: "Hana")
personStruct.talk(to: hana)

// 프로토콜 초기 구현이 프로토콜 지향 프로그래밍(POP)의 핵심임
// POP를 추구함으로써 '다중 상속' 개념이 가능해져 기능의 모듈화가 명확해지고, 구조체 및 열거형 등 다양한 타입의 '상속' 개념이 가능해짐
