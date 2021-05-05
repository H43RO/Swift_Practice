// 보통 열거형에 Error 프로토콜을 구현하여 오류 표현
enum VendingMachineError: Error{
    case invalidInput
    case insufficientFunds(moneyNeeded: Int)
    case outOfStock
}

class Vendingmachine {
    let itemPrice: Int = 100
    var itemCount: Int = 5
    var deposited: Int = 0
    
    // 에러를 발생할 여지가 있는 메소드는 throws 키워드 붙임
    // 돈 받기 메소드
    func receiveMoney(_ money: Int) throws{
        guard money > 0 else{
            throw VendingMachineError.invalidInput
        }
        
        self.deposited += money
        print("\(money)원 받음")
    }
    
    // 물건 팔기 메소드
    func vend(numberOfItems numberOfItemsToVend: Int) throws -> String{
        // 원하는 아이템 수량이 0 이하라면 Error Throw
        guard numberOfItemsToVend > 0 else{
            throw VendingMachineError.invalidInput
        }
        
        // 구매하려는 수량보다 미리 넣어둔 돈이 적으면 Error Throw
        guard numberOfItemsToVend * itemPrice <= deposited else {
            let moneyNeeded: Int
            moneyNeeded = numberOfItemsToVend * itemPrice - deposited
            throw VendingMachineError.insufficientFunds(moneyNeeded: moneyNeeded)
        }
        
        // 구매하려는 수량보다 요구하는 수량이 많으면 Error Throw
        guard itemCount >= numberOfItemsToVend else{
            throw VendingMachineError.outOfStock
        }
        
        // 오류가 없다면 정상처리 완료 (있으면 이미 guard 에 의해 조기 종료됨)
        let totalPrice = numberOfItemsToVend * itemPrice
        self.deposited -= totalPrice
        self.itemCount -= numberOfItemsToVend
        return "\(numberOfItemsToVend)개 제공함"
    }
}

let machine: Vendingmachine = Vendingmachine()
var result: String?


// 오류 처리
// - 오류 발생의 여지가 있는 throw 메소드는 try 를 사용하여 호출해야 함
// - do-catch 문을 활용하여 모든 오류 발생 대비가 정석

do {
    try machine.receiveMoney(0)
} catch VendingMachineError.invalidInput {
    print("입력이 잘못되었습니다")
} catch VendingMachineError.insufficientFunds(let moneyNeeded){
    print("\(moneyNeeded)원이 부족합니다")
} catch VendingMachineError.outOfStock {
    print("수량이 부족합니다")
} // 입력이 잘못되었습니다

do {
    try machine.receiveMoney(300)
} catch {
    switch error {
    case VendingMachineError.invalidInput:
        print("입력이 잘못되었습니다")
    case VendingMachineError.insufficientFunds(let moneyNeeded):
        print("\(moneyNeeded)원이 부족합니다")
    case VendingMachineError.outOfStock:
        print("수량이 부족합니다")
    default:
        print("알 수 없는 오류 \(error)")
    }
} // 300원 받음

do {
    result = try machine.vend(numberOfItems: 4)
} catch {
    print(error)
} // insufficientFunds(100)

do {
    result = try machine.vend(numberOfItems: 4)
}

result = try? machine.vend(numberOfItems: 2)
print(result)
result = try? machine.vend(numberOfItems: 2)
result

result = try! machine.vend(numberOfItems: 1)
result // 1개 제공함
//result = try! machine.vend(numberOfItems: 1)
// 런타임 오류 발생!
