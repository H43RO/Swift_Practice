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
