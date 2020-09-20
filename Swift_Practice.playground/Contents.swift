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

