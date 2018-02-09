//
//  main.swift
//  ExploringSwift
//
//  Created by Daniyal Yousuf on 2/9/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//

import Foundation

//: Playground - noun: a place where people can play

import Foundation
import os.log
typealias completionHandler = (String) -> Void
var namesArray : [String?] = ["a",nil,"d"]
var namesarrayEliminatingNil:[String] {
    return namesArray.flatMap({$0})
}
for a in namesArray where a != nil {
    print(a!)
}

print(namesarrayEliminatingNil)
enum Result {
    case animal(String)
    case thing(String,Int)
}
typealias completionHandler90 = (Result) -> Void
let object = Result.thing("Umbrella", 90)

switch object {
case .animal(let x):
    print(x)
case .thing(let x , let y):
    print("\(x) and \(y)")
}

func uploadApiResponseToServer(token:String,verdict:completionHandler90) {
    if token == "A122" {
        verdict(Result.animal("Tiger"))
    } else {
        verdict(Result.thing("Glass", 10))
    }
}

uploadApiResponseToServer(token: "A12") { (result) in
    switch result {
    case .animal(let x):
        print(x)
    case .thing(let x , let y):
        print("\(x) and \(y)")
    default:
        print("NSError!")
    }
}

let lowBatterMode  : Bool = false
let weakgpsSignals : Bool = true
enum TeslaError:Error {
    case lowBattery
    case gpsLost
}

func thisFunctionthrowsError() throws -> String {
    if lowBatterMode {
        throw TeslaError.lowBattery
    } else if weakgpsSignals{
        throw TeslaError.gpsLost
    }
    return "Everything seems to be fine!"
}
do {
    let msg =  try thisFunctionthrowsError()
    print(msg)
} catch TeslaError.lowBattery {
    
} catch TeslaError.gpsLost {
    
}

struct UserInfo {
    var firstName:String!
    var lastName:String!
    var middleName:String!
}

enum UserloginError : Error {
    case emptyField(String)
    case characterLimited(Int)
}

func calculateMass() {
    
}
func userloginInfo(fName:String,lName:String,midName:String) throws -> UserInfo {
    if fName.isEmpty {
        throw UserloginError.emptyField("First Name")
    }
    if fName.count <= 1 {
        throw UserloginError.characterLimited(1)
    }
    if lName.isEmpty {
        throw UserloginError.emptyField("Last Name")
    }
    if lName.count <= 1 {
        throw UserloginError.characterLimited(1)
    }
    if midName.isEmpty {
        throw UserloginError.emptyField("Middle Name")
    }
    if midName.count <= 1 {
        throw UserloginError.characterLimited(1)
    }
    return UserInfo(firstName: fName, lastName: lName, middleName: midName)
}

do {
    let loginUser = try userloginInfo(fName: "", lName: "Khan", midName: "Not")
    print(loginUser)
} catch UserloginError.emptyField(let name) {
    print(name)
} catch UserloginError.characterLimited(let length) {
    print(length)
}

enum ReadingError:Error {
    case blurred
    case colorIssue
    var getString:String {
        switch self {
        case .blurred:
            return "Blurred"
        default:
            return "Color Issue"
        }
    }
}

func checkifReadingDone(criteria:String) throws -> String{
    if criteria == "!OK" {
        throw ReadingError.blurred
    } else if criteria == "!!OK" {
        throw ReadingError.colorIssue
    } else {
        
    }
    return "Done!"
}
do {
    let isData = try checkifReadingDone(criteria:"!OK")
    print(isData)
} catch ReadingError.blurred {
    print(ReadingError.blurred.getString)
} catch ReadingError.colorIssue {
    print(ReadingError.colorIssue.getString)
}
var descriptions: [AnyHashable: Any] = [
    AnyHashable("😄"): "emoji",
    AnyHashable(42): "an Int",
    AnyHashable(Int8(43)): "an Int8",
    AnyHashable(Set(["a", "b"])): "a set of strings"
]

let a = descriptions.updateValue(2, forKey: "an Int")

let names:[String] = ["da","na","bi","neh","mu","um"]
var numberArray: [Int] = [1,2,3,4,5,6,1,2,3]
var setArray = Set<Int>(numberArray).sorted()

class Datafoo : Hashable{
    
    var name:String
    var idNumber:Int
    var hashValue: Int {
        return idNumber.hashValue
    }
    init(name1:String,idNumber1:Int) {
        self.name = name1
        self.idNumber = idNumber1
    }
    static func ==(lhs:Datafoo,rhs:Datafoo) -> Bool{
        return lhs.idNumber == rhs.idNumber
    }
}

let da1 = Datafoo(name1: "da", idNumber1: 1)
let da2 = Datafoo(name1: "da", idNumber1: 2)
let da3 = Datafoo(name1: "daa", idNumber1: 1)
var daSet : Set<Datafoo> = [da1,da2,da3]

class Dog: Hashable {
    var uid: Int
    var name: String
    var age: Int
    var hashValue: Int {
        return uid.hashValue
    }
    init(uid:Int, name: String, age: Int) {
        self.uid = uid
        self.name = name
        self.age = age
    }
    static func ==(lhs: Dog, rhs: Dog) -> Bool {
        return lhs.uid == rhs.uid
    }
}
let dog1 = Dog(uid: 1, name: "Scrappy", age: 4)
let dog2 = Dog(uid: 2, name: "Sparky", age: 3)
var dogArray: [Dog: String] = [
    dog1: "Woff Woff",
    dog2: "!"
]
var dogs: Set<Dog> = [dog1, dog2]

var name:AnyObject!
name = "Daniyal" as AnyObject

var toString = name as? String
//toString


enum FunctionalEmum {
    case Result(String)
    case Failure(AnyObject)
    case Success(Int)
    static func printMe() {
        print("PrintMe")
    }
    var getString:String{
        return "Func"
    }
}
typealias completionHandlerx = (FunctionalEmum) -> Void

os_log("dani")
FunctionalEmum.printMe()






