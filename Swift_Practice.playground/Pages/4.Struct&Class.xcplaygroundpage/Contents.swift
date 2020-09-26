
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
