import Swift

struct Student{
    var name: String = ""
    var `class`: String = "Swift"
    var koreanAge: Int = 0
    
    var westernAge: Int{
        get {
            return koreanAge - 1
        }
        set (inputValue) {
            koreanAge = inputValue - 1
        }
    }
    
    static var typeDescription: String = "학생"
    
//    var selfIntroduction: String {
//        get {
//            return "저는 \(self.class)반 \(name)입니다"
//        }
//    }
    
    static var selfIntroduction: String {
        return "학생입니다"
    }
}

print(Student.selfIntroduction)

var yagom: Student = Student()
yagom.name = "yagom"
print(yagom.name)


struct Money{
    var currencyRate: Double = 1100{
        willSet(newRate){
            print("환율이 \(currencyRate)에서 \(newRate)으로 변경 예정")
        }
        didSet(oldRate){
            print("환율이 \(oldRate)에서 \(currencyRate)으로 변경됨")
        }
    }
    
    var dollar: Double = 0 {
        willSet{
            print("\(dollar)달러에서 \(newValue)달러로 변경 예정")
        }
        didSet{
            print("\(oldValue)달러에서 \(dollar)달러로 변경됨")
        }
    }
    
    var won: Double{
        get{
            return dollar * currencyRate
        }
        set{
            dollar = newValue / currencyRate
        }
    }
}

var moneyInMyPocket: Money = Money()
moneyInMyPocket.currencyRate = 1150
moneyInMyPocket.dollar = 10
print(moneyInMyPocket.won)
