
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

// 내부를 구현하는 것이 아닌 오로지 정의만 함
protocol Talkable{
    // 프로토콜 요구는 항상 var 키워드 사용
    // get 은 읽기만 해도 상관이 없다는 뜻이고
    // get 과 set 을 모두 명시하면
    // 읽기 쓰기 모두 가능한 프로퍼티여야 함
    var topic: String { get set }
    
    // 메소드 요구
    func talk(to: SwiftPerson)
    
    // 이니셜라이저 요구
    init(name: String, topic: String)
}

// SwiftPerson 구조체는 Talkable 프로토콜을 채택함!
struct SwiftPerson: Talkable{
    var topic: String // 프로토콜 요구 준수
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

class SuperClass: Readable {
    func read() { }
}
class SubClass: SuperClass, Writable, ReadSpeakable {
    func write() { }
    func speak() { }
}

let sup: SuperClass = SuperClass()
let sub: SubClass = SubClass()
var someAny: Any = sup
someAny is Readable // true
someAny is ReadSpeakable // false
someAny = sub
someAny is Readable // true
someAny is ReadSpeakable // true
someAny = sup
if let someReadable: Readable = someAny as? Readable {
    someReadable.read()
} // read
if let someReadSpeakable: ReadSpeakable = someAny as? ReadSpeakable {
    someReadSpeakable.speak()
} // 동작하지 않음
someAny = sub
if let someReadable: Readable = someAny as? Readable {
    someReadable.read()
} // read
