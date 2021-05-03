class Person {
    var name: String
    var job: String?
    var home: Apartment?
    init(name: String){
        self.name = name
    }
}

class Apartment {
    var buildingNumber: String
    var roomNumber: String
    var `guard`: Person?
    var owner: Person?
    init(dong: String, ho: String){
        buildingNumber = dong
        roomNumber = ho
    }
}

let yagom: Person? = Person(name: "yagom")
let apart: Apartment? = Apartment(dong: "101", ho: "202")
let superman: Person? = Person(name: "superman")

// 옵셔널 체이닝을 사용하지 않는다면...
func guardJob(owner: Person?) {
    if let owner = owner {
        if let home = owner.home {
            if let `guard` = home.guard {
                if let guardJob = `guard`.job {
                    print("우리집 경비원의 직업은 \(guardJob)입니다")
                } else {
                    print("우리집 경비원은 직업이 없어요")
                }
            }
        }
    }
}

// 옵셔널 체이닝을 사용한다면
func guardJobWithOptionalChaining(owner: Person?){
    if let guardJob = owner?.home?.guard?.job {
        print("우리집 경비원 직원은 \(guardJob) 입니당")
    }else{
        print("우리집 경비원은 직업이 업서요")
    }
}

guardJobWithOptionalChaining(owner: yagom)  // 우리집 경비원은 직업이 없어요
yagom?.home?.guard?.job  // nil
yagom?.home = apart
yagom?.home  // Optional(Apartment)
yagom?.home?.guard  // nil
yagom?.home?.guard = superman
yagom?.home?.guard  // Optional(Person)
yagom?.home?.guard?.name  // superman
yagom?.home?.guard?.job  // nil
yagom?.home?.guard?.job = "경비원"


/**
 nil 병합 연산자
 - Kotlin 의 ?: 와 비슷함
 */

var guardJob: String
guardJob = yagom?.home?.guard?.job ?? "슈퍼맨"
print(guardJob) // 경비원
yagom?.home?.guard?.job = nil
guardJob = yagom?.home?.guard?.job ?? "슈퍼맨"
print(guardJob) // 슈퍼맨
