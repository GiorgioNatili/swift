// Playground - noun: a place where people can play

import UIKit

protocol Accounting {
    
    var fullname:String { get }
    var accountID:Int { get }
    func getBalance() -> Int
    
}

print("test")

class CheckingAccount:Accounting{
    
    var name:String
    var surname:String 
    var id:Int
    var balance:Int
    
    init(name n:String, surname s:String){
        
        name = n
        surname = s
        
        id = Int(arc4random())
        balance = 0
        
    }
    
    func deposit(val:Int){
        
        balance += val
        
    }
    //
    func getBalance() -> Int {
        
        return balance
    
    }
    
    var fullname:String{
        
        get{
            
            return name + " " + surname
        }
        
    }
    
    var accountID:Int{
        
        get{
            
            return id
        }
        
    }
    
    
}
print("next")
var account = CheckingAccount(name: "giorgio", surname: "natili")
print("instantiated")
print(account.fullname)
print(account.accountID)
print(account.getBalance())
account.deposit(val: 100)
account.deposit(val: 89)
print(account.getBalance())



func minMax(numbers:[Int]) -> (min: Int, max: Int, average: Int)?{
    
    if(numbers.isEmpty){return nil}
    
    var average = 0
    var currentMin = numbers[0]
    var currentMax = numbers[0]
    
    for value in numbers[1..<numbers.count]{
        
        if value < currentMin{
            
            currentMin = value
            
        }else if value > currentMax{
            
            currentMax = value
            
        }
        
        average += value
        
    }
    
    return (currentMin, currentMax, average/numbers.count)
}









