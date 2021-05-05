let numbers: [Int] = [0, 1, 2, 3, 4]
var doubledNumbers: [Int]
var strings: [String]

doubledNumbers = [Int]()
strings = [String]()

for number in numbers {
    doubledNumbers.append(number * 2)
    strings.append("\(number)")
}

print(doubledNumbers)
print(strings)

// map 함수는 기존 컨테이너 내의 데이터를 정의한 동작에 맞게 변형하여 새로운 컨테이너를 생성 후 반환해 줌
doubledNumbers = numbers.map({ (number: Int) -> Int in
    return number * 2
})

strings = numbers.map({ (number: Int) -> String in
    return "\(number)"
})

print(doubledNumbers)
print(strings)

// 매개변수, 반환 타입, 반환 키워드 생략, 후행 클로저!
doubledNumbers = numbers.map { $0 * 2 }
print(doubledNumbers)



var filtered: [Int] = [Int]()
 
for number in numbers{
    if number % 2 == 0{
        filtered.append(number)
    }
}

print(filtered)

// filter 함수는 컨테이너 내부의 값을 특정 조건에 맞게 걸러서 새로운 컨테이너로 추출함
let evenNumbers: [Int] = numbers.filter { (number: Int) -> Bool in
    return number % 2 == 0
}
print(evenNumbers)

let oddNumbers: [Int] = numbers.filter{ $0 % 2 != 0 }
print(oddNumbers)


// reduce 함수는 컨테이너 내부의 콘텐츠를 하나로 통합해줌
let someNumbers: [Int] = [2, 8, 15]
var result: Int = 0

for number in someNumbers{
    result += number
}

print(result)

let sum: Int = someNumbers.reduce(0, { (result: Int, currentItem: Int) -> Int in
    print("\(result) + \(currentItem)")
    return first + second
})

print(sum)

// 초깃값이 0이고 someNumbers 내부의 모든 값을 뺍니다.
var subtract: Int = someNumbers.reduce(0, { (result: Int, currentItem: Int) -> Int in
    return result - currentItem
})

print(subtract) // -25

// 초깃값이 3이고 someNumbers 내부의 모든 값을 더합니다.
let sumFromThree = someNumbers.reduce(3) { $0 + $1 }

print(sumFromThree) // 28






