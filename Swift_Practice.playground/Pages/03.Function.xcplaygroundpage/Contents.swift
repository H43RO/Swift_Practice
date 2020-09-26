
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
func greeting(to friend: String, from me: String) {
    print("Hello \(friend)! I'm \(me)")
}

var someFunction: (String, String) -> Void = greeting(to:from:)
someFunction("eric", "H43RO")
