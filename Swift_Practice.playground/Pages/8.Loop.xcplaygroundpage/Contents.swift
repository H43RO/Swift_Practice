
/* 반복문 */

// for-in : For-each 구문과 유사함
var integers = [1, 2, 3]
let people = ["H43RO": 10, "Eric": 15, "Mike": 12]

for integer in integers {
    print(integer)
}

for (name, age) in people {
    print("\(name) : \(age)")
}

// While
while integers.count > 1 {
    integers.removeLast()
}

// Repeat-While : Do-While 구문과 유사함
repeat {
    integers.removeLast()
} while integers.count > 0

