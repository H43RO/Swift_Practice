class PersonA{
    var name: String = "unknown"
    var age: Int = 0
    var nickName: String = "nick"
}

let jason: PersonA = PersonA()
jason.name = "jason"
jason.age = 30
jason.nickName = "j"


class PersonB{
    var name: String
    var age: Int
    var nickName: String
    
    init(name: String, age: Int, nickName: String){
        self.name = name
        self.age = age
        self.nickName = nickName
    }
}

let haha: PersonB = PersonB(name: "haha", age: 20, nickName: "하나")


class PersonC{
    var name: String
    var age: Int
    var nickName: String?
    
    init(name: String, age: Int, nickName: String) {
        self.name = name
        self.age = age
        self.nickName = nickName
    }
    
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
}

let jenny: PersonC = PersonC(name: "jenny", age: 10)
let mike: PersonC = PersonC(name: "mike", age: 15, nickName: "m")

class Puppy {
    var name: String
    var owner: PersonC!
    init(name: String){
        self.name = name
    }
    func goOut(){
        print("\(name)가 주인 \(owner.name)와 산책합니다")
    }
}

let happy: Puppy = Puppy(name: "happy")

happy.owner = jenny
happy.goOut()

class PersonD{
    var name: String
    var age: Int
    var nickName: String?
    
    init?(name: String, age: Int){
        if (0...120).contains(age) == false{
            return nil
        }
        if name == "" {
            return nil
        }
        self.name = name
        self.age = age
    }
}

let john: PersonD? = PersonD(name: "john", age: 23)
let joker: PersonD? = PersonD(name: "joker", age: 123)
let batman: PersonD? = PersonD(name: "", age: 10)
print(joker)
print(batman)


class PersonE{
    var name: String
    var pet: Puppy?
    var child: PersonC
    
    init(name: String, child: PersonC){
        self.name = name
        self.child = child
    }
    
    deinit {
        if let petName = pet?.name{
            print("\(name)가 \(child.name)에게 \(petName)를 인도합니다")
            self.pet?.owner = child
        }
    }
}

var donald: PersonE? = PersonE(name: "donald", child: jenny)
donald?.pet = happy
donald = nil
