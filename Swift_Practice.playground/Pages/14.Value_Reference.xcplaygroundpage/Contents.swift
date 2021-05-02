import Swift

struct ValueType{
    var property = 1
}

class ReferenceType{
    var property = 1
}

// 구조체는 Value Type이기 때문에 값이 복사됨
let firstStructInstance = ValueType()
var secondStructInstance = firstStructInstance
secondStructInstance.property = 2
print(firstStructInstance.property)
print(secondStructInstance.property)


// 클래스는 Reference Type이기 때문에 참조가 복사됨
let firstClass = ReferenceType()
var secondClass = firstClass
secondClass.property = 2
print(firstClass.property)
print(secondClass.property)


