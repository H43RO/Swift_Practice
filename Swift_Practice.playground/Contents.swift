import UIKit

var str = "Hello, playground"
print(str)

// 변수 선언 및 초기화는 코틀린과 매우 유사
var name: String = "H43RO"
print(name)

var age: Int = 100
var height = 180
var job = "Student"
print(job)

let const_name: String = "Hyeon Jun"
print(const_name)

/* 기본 데이터 타입 */

// Int, Unit
var integer: Int = -100
let unsignedInteger: UInt = 50 // UInt 타입에는 음수값 할당할 수 없음
print(integer)
print(unsignedInteger)
print(Int.max)
print(Int.min)
print(UInt.max)
print(UInt.min)

// 크기에 따라 8, 16, 32, 64비트의 형태를 가짐
let largeInteger: Int64 = Int64.max
let smallUnsignedInteger: UInt8 = UInt8.max
print("64비트 Int의 최댓값 : \(largeInteger)")
print("8비트 UInt의 최솟값 : \(smallUnsignedInteger)")

// Bool
let boolean: Bool = true
let iLoveYou: Bool = true
let isTimeUnlimited: Bool = false
print("시간은 무한합니까? : \(isTimeUnlimited)")

// Float, Double
var floatValue: Float = 1234567890.1 // Range Over
let doubleValue: Double = 1234567890.1
floatValue = 123456.1

// Character
// Swift는 유니코드 문자를 사용하므로 특문, 한글 모두 사용 가능
let alphabetA: Character = "A"
print(alphabetA)

let 한글변수이름: Character = "ㄱ"
print(한글변수이름)

// String
// 마찬가지로 특문, 한글 등 유니코드 문자 모두 사용 가능
var introduce: String = String() // 빈 문자열 생성
introduce.append("제 이름은")
introduce = introduce + " " + name + "입니다."
print(introduce)

/* 함수 */

func hello(name: String) -> String{
    return "Hello \(name)!"
}

let greeting: String = hello(name:"H43RO")
print(greeting)

func helloWorld() -> String{
    return "Hello, World!"
}

print(helloWorld())

func sayHello(myName: String, yourName: String)->String{
    return "Hello \(yourName)! I'm \(myName)"
}

print(sayHello(myName: "H43RO", yourName: "JSON"))

/* Collection */

// Array
var names1: Array<String> = ["H43RO", "Yeonju", "LULU"]
var names2: [String] = ["H43RO", "Yeonju", "LULU"] // Array<String> == [String]

var emptyArray1: [String] = [String]()
var emptyArray2: [String] = Array<String>()
var emptyArray3: [String] = []

print(emptyArray1.isEmpty)
print(names1.count)
print(names2[2])

names1.append(contentsOf: ["john", "max"])
names1.insert("happy", at: 2)
names1.insert(contentsOf: ["Minsoo", "Cat"], at: 5)

print(names1)

names1.removeFirst()
names1.removeLast()

print(names1)
print(names1[1 ... 3])

// Dictionary
//var numberForName: Dictionary<String, Int> = Dictionary<String, Int>()
var numberForName: [String: Int] = [String: Int]()
numberForName = [:] // 빈 딕셔너리 생성
numberForName = ["H43RO": 100, "LULU": 200, "Kong": 300]
print(numberForName.isEmpty)
print(numberForName.count)

print(numberForName["H43RO"])
print(numberForName["Kong"])

numberForName["LULU"] = 150
print(numberForName["LULU"])

// 새로운 값 추가
numberForName["max"] = 999
print(numberForName["max"])

print(numberForName.removeValue(forKey: "Kong"))
print(numberForName.removeValue(forKey: "Kong")) // 없는 값 접근 시 nil 출력

/* 구조체와 클래스 */

// 구조체
struct BasicInformation {
    var name: String
    var age: Int
}

var myInfo: BasicInformation = BasicInformation(name: "H43RO", age: 22)
print(myInfo.age)
print(myInfo.name)

// 클래스
class Person{
    var height: Float = 0.0
    var weight: Float = 0.0
    deinit {
        print("Person 클래스의 인스턴스가 소멸됨") // 클래스 인스턴스 소멸시 호출
    }
}

var person: Person = Person()
person.height = 123.4
person.weight = 123.4

var test: Person? = Person()
test = nil

/* 프로토콜과 익스텐션 */

// Protocol
// 특정 역할을 수행하기 위한 메소드, 프로퍼티, 기타 요구사항 등의 청사진을 정의
// 구조체, 열거형, 클래스은 프로토콜을 채택해서 특정 기능을 수행하기 위한 프로토콜의 요구사항을 실제로 구현할 수 있음
// -> 어떤 프로토콜의 요구사항을 모두 따르는 것을 '프로토콜을 준수한다' 라고 표현함

// 프로토콜은 기능을 정의하고 제시할 뿐, 스스로 기능을 구현하지는 않음 (Java, Kotlin의 Interface 개념이라고 보면 됨)

protocol SomeProtocol{
    var settableProperty: String {get set} // 읽기 쓰기가 가능한 프로퍼티
    var notNeedToBeSettableProperty: String {get} // 읽기 전용 프로퍼티
}

protocol AnotherProtocol{
    static var someTypeProperty: String { get set } // 타입 프로퍼티를 요구하려면 static 사용
    static var anotherTypeProperty: Int { get }
}

protocol Talkable{ // 내부를 구현하는 것이 아닌 오로지 정의만 함
    var topic: String { get set }
    func talk(to: SwiftPerson)
    init(name: String, topic: String)
}

struct SwiftPerson: Talkable{
    var topic: String // Talkable 프로토콜을 채택하였으므로 topic 프로퍼티 가져야 함
    var name: String
    
    func talk(to: SwiftPerson) { // 마찬가지로 talk 메소드를 가져야 함 (실제 구현해야함)
        print("\(topic)에 대해 \(to.name)에게 이야기합니다")
    }
    
    init(name: String, topic: String){ // 이니셜라이저 역시 구현이 되어야 함
        self.name = name
        self.topic = topic
    }
}

let haero: SwiftPerson = SwiftPerson(name: "H43RO", topic: "스위프트")
let lulu: SwiftPerson = SwiftPerson(name: "LULU", topic: "코딩")

haero.talk(to: lulu)

// Java, Kotlin 에서 intertace를 상속하는 interface가 있듯, protocol도 상속이 가능하다
protocol Readable{
    func read()
}

protocol Writable{
    func write()
}

protocol ReadSpeakable: Readable{
    func speak()
}

protocol ReadWriteSpeakable: Readable, Writable{
    func speak()
}

class SomeClass: ReadWriteSpeakable{ // read, write, speak 메소드를 모두 구현해야함
    func read() {
        print("Read")
    }
    
    func write() {
        print("Write")
    }
    
    func speak() {
        print("Speak")
    }
}

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


/* 반복문 */

// for-in
var integers = [1, 2, 3]
let people = ["H43RO": 10, "Eric": 15, "Mike": 12]

for integer in integers {
    print(integer)
}

for (name, age) in people {
    print("\(name) : \(age)")
}

// While
while integers.count > 1 {
    integers.removeLast()
}

// Repeat-While
repeat {
    integers.removeLast()
} while integers.count > 0
