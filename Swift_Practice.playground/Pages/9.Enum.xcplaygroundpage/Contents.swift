
/* 열거형 */
// Camel-Case 로 이름 정의
// 각 case는 그 자체가 고유의 값

enum Weekday {
    case mon
    case tue
    case wed
    case thu, fri, sat, sun
}

// 열거형 타입과 케이스를 모두 사용할 수 있음
var day: Weekday = Weekday.mon

// 타입이 명확하다면 .케이스 처럼 표현해도 무방
day = .tue
print(day)

switch day {
case .mon, .tue, .wed, .thu:
    print("평일입니다")
case Weekday.fri:
    print("불금 파티!")
case .sat, .sun:
    print("신나는 주말!")
}

enum Fruit: Int {
    case apple = 0
    case grape = 1
    case peach
    // case mango = 0 이런식으로 하면 apple과 원시값이 같으므로 정의할 수 없음
}

print("Fruit.peach.rawValue == \(Fruit.peach.rawValue)")

enum School: String {
    case elementary = "초등"
    case middle = "중등"
    case high = "고등"
    case university
}

print("School.middle.rawValue == \(School.middle.rawValue)")

// 열거형의 원시값 타입이 String 일 때, 원시값이 지정되지 않았다면
// case 의 이름을 원시값으로 사용하게 됨
print("School.university.rawValue == \(School.university.rawValue)")

// 원시값을 통한 초기화
// rawValue를 통해 초기화한 열거형 값은 옵셔널 타입이므로 Fruit 타입이 아님
let apple: Fruit? = Fruit(rawValue: 0)

// if let 구문을 사용하면 rawValue에 해당하는 케이스를 곧바로 사용 가능
if let orange: Fruit = Fruit(rawValue: 5) {
    print("rawValue 5에 해당하는 케이스는 \(orange) 입니다")
} else{
    print("rawValue 5에 해당하는 케이스가 없습니당")
}

// 열거형에 메소드 추가하기
enum Month {
    case dec, jan, feb
    case mar, apr, may
    case jun, jul, aug
    case sep, oct, nov
    
    func printMessage() {
        switch self {
        case .mar, .apr, .may:
            print("봄!")
        case .jun, .jul, .aug:
            print("여름!")
        case .sep, .oct, .nov:
            print("가을!")
        case .dec, .jan, .feb:
            print("겨울!")
        }
    }
}

Month.mar.printMessage()
