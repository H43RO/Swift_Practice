
/* 함수 */

func hello(name: String) -> String{
    return "Hello \(name)!"
}

let greeting: String = hello(name:"H43RO")
print(greeting)

func helloWorld() -> String{
    return "Hello, World!"
}

print(helloWorld())

func sayHello(myName: String, yourName: String)->String{
    return "Hello \(yourName)! I'm \(myName)"
}

print(sayHello(myName: "H43RO", yourName: "JSON"))


// 가변 매개변수 사용 가능
func sayHelloToFriends(me: String, friends: String...) -> String {
    return "Hello \(friends)! I'm \(me)!"
}

print(sayHelloToFriends(me:"H43RO", friends: "haha","eric","wing"))


// 데이터 타입으로서의 함수
// 참고로, 전달인자 레이블을 활용하여 호출할 때 to, from 등으로 인자를 전달할 수 있음 (명확하게 표현)
func greeting(to friend: String, from me: String) {
    print("Hello \(friend)! I'm \(me)")
}
greeting(to: "Eric", from: "H43RO") // 전달인자 레이블로만 전달 가능

var someFunction: (String, String) -> Void = greeting(to:from:)
someFunction("eric", "H43RO")


// 기본값을 갖는 매개변수는 매개변수 목록 중 가장 맨 뒤쪽에 위치하는 것이 좋음
func greet(friend: String, me: String = "H43RO") ->Void{
    print("Hello \(friend), I'm \(me)!")
}

greet(friend: "LULU")
