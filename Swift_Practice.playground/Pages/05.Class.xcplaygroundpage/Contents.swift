
/* 클래스 */

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
