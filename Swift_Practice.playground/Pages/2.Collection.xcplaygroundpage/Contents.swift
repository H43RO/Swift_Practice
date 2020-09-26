
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
