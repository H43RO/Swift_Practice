
/* 구조체 */

struct BasicInformation {
    var name: String
    var age: Int
}

var myInfo: BasicInformation = BasicInformation(name: "H43RO", age: 22)
print(myInfo.age)
print(myInfo.name)

struct Sample {
    // 가변 프로퍼티
    var mutableProperty: Int = 100
    
    // 불변 프로퍼티
    let immutableProperty: Int = 100
    
    // 타입 프로퍼티
    static var typeProperty: Int = 100
    
    // 인스턴스 메소드
    func instanceMethod() {
        print("instance method")
    }
    
    // 타입 메소드
    static func typeMethod() {
        print("type method")
    }
}

// 가변 인스턴스 생성 (불변 프로퍼티 수정 불가)
var mutable: Sample = Sample()
mutable.mutableProperty = 200
//mutable.immutableProperty = 200

// 불변 인스턴스 생성 (프로퍼티가 뭐든간에 수정 불가)
let immutable: Sample = Sample()
//mutable.mutableProperty = 200
//mutable.immutableProperty = 200

// 타입 프로퍼티 및 메소드 (인스턴스로는 접근 불가)
Sample.typeProperty = 300
Sample.typeMethod()

struct Student {
    // 가변 프로퍼티
    var name: String = "unknown"

    // 키워드도 `로 묶어주면 이름으로 사용할 수 있음
    var `class`: String = "Swift"
    
    // 타입 메서드
    static func selfIntroduce() {
        print("학생타입입니다")
    }
    
    // 인스턴스 메서드
    // self는 인스턴스 자신을 지칭하며, 몇몇 경우를 제외하고 사용은 선택사항
    func selfIntroduce() {
        print("저는 \(self.class)반 \(name)입니다")
    }
}

// 타입 메서드 사용
Student.selfIntroduce() // Student

// 가변 인스턴스 생성
var haero: Student = Student()
haero.name = "H43RO"
haero.class = "스위프트"
haero.selfIntroduce()   // 저는 스위프트반 haero입니다

// 불변 인스턴스 생성
let jina: Student = Student()

// 불변 인스턴스이므로 프로퍼티 값 변경 불가
// 컴파일 오류 발생
//jina.name = "jina"
jina.selfIntroduce() // 저는 Swift반 unknown입니다
