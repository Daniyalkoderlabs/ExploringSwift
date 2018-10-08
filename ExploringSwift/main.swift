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
    return namesArray.compactMap({$0})
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

struct Login_Info {
    var user_Email:String!
    var user_Password:String!
}
enum Login {
    case success(Login_Info)
    case failure(String)
}

enum ConstantsEnums{
    struct Login {
        static let USERNAME:String = "USERNAME"
        static let PASSWORD:String = "PASSWORD"
    }
    struct Logout {
        static let USERNAME:String = "USERNAME"
        static let PASSWORD:String = "PASSWORD"
    }
}

typealias completionHandlerdDasti = (Login) -> Void
func getAuthentication(email:String?,pass:String,verdict:completionHandlerdDasti) {
    if let isEmail = email,email == "da" && pass == "31" {
        verdict(.success(Login_Info.init(user_Email: isEmail, user_Password: pass)))
    } else {
        verdict(.failure(ConstantsEnums.Login.PASSWORD))
    }
}
getAuthentication(email: "da", pass: "31") { (callBackObj) in
    
    switch callBackObj {
    case .success(let obj):
        print(obj.user_Email)
    case .failure(let obj):
        print(obj)
    }
}
//How can use constants a perfect data structure
class Constants {
    struct LOGINConstants{
        static let USERNAME:String = "USER_NAME"
        static let USERPASS:String = "USER_PASS"
    }
    
    struct LOGOUTConstans {
        static var USERTOKEN:String!
    }
}


enum LoginErr:Error {
    case failureDuetoEmptyEmail(String)
    case failureDuetoEmptyPass(String)
}
func getAuthenticationusingdotryCatch(email:String,password:String) throws -> Login_Info {
    if email == "" {
        throw LoginErr.failureDuetoEmptyEmail("email is Empty")
    } else if password == "" {
        throw LoginErr.failureDuetoEmptyPass("Pass is Empty")
    }
    return Login_Info(user_Email: email, user_Password: password)
}

do {
  let loginObj = try getAuthenticationusingdotryCatch(email: "da", password: "2")
    print(loginObj)
} catch LoginErr.failureDuetoEmptyEmail(let msg) {
    print(msg)
} catch LoginErr.failureDuetoEmptyPass(let msg) {
    print(msg)
    print(Constants.LOGINConstants.USERNAME)
}
class Cars {
    var carModel:String!
    init(_ carModel:String) {
        self.carModel = carModel
    }
}
class Bike {
    var bikeSpeed:String!
    init(_ bikeSpeed:String) {
        self.bikeSpeed = bikeSpeed
    }
}
class General {
    var dataSource : [Any]
    init(_ dataSoruce:[Any]) {
        self.dataSource = dataSoruce
    }
}
var GeneralObject = General.init([Cars.init("Mehran"),Bike.init("32"),Cars.init("SkyeLine"),Bike.init("Honda!")])
for (_,eachObject) in GeneralObject.dataSource.enumerated() {
    if eachObject is Cars {
        print("The Object is Car!")
    } else if eachObject is Bike {
        print("The Object is Bike!")
    }
}
//Swift Hashable Example
let enumerateOnDogs :[String] = ["Dog1","Dog2","Dog3","Dog4","Dog5"]
enumerateOnDogs.forEach { (dog) in
    
}


class Cities:Hashable{
    var hashValue: Int {
        return cityPopulation.hashValue
    }
    
    static func ==(lhs: Cities, rhs: Cities) -> Bool {
        return lhs.cityPopulation == rhs.cityPopulation
    }
    
    var cityPopulation:String
    var citySize :String
    init(population:String,size:String) {
        self.citySize = size
        self.cityPopulation = population
    }
}

class Country : Hashable{
    var hashValue: Int {
        return countryCode.hashValue
    }
    
    static func ==(lhs: Country, rhs: Country) -> Bool {
        return lhs.countryCode == rhs.countryCode
    }
    
    var listOfCities:Set<Cities> = []
    var countryName:String
    var countryCode:Int
    init(cities:Set<Cities> , cName:String , cCode:Int) {
        self.listOfCities = cities
        self.countryName = cName
        self.countryCode = cCode
    }
}

let ob1 = Country(cities: [Cities.init(population: "21", size: "12"),Cities.init(population: "221", size: "12"),Cities.init(population: "21", size: "12")], cName: "Pakistan", cCode: 1)
let ob2 = Country(cities: [], cName: "India", cCode: 2)
let ob3 = Country(cities: [], cName: "Iran", cCode: 3)
let ob4 = Country(cities: [], cName: "Bangladesh", cCode: 1)
let setArrayOfCountry: Set<Country> = [ob1,ob2,ob3,ob4]
setArrayOfCountry.forEach { (country) in
    country.listOfCities.forEach({ (city) in
        print(city.cityPopulation)
    })
}


//MARK:-Convert Model to KeyValue
enum EnumForObjectOrientedClass:Int{
    case Green = 0
    case Blue
    case yellow
    
    var getColorString:String{
        switch self {
        case .Blue:
            return "Blue"
        case .Green:
            return "Green"
        default:
            return "Yellow"
        }
    }
}
struct FooterView {
    var footViewSize:CGSize
    var footViewPoint:CGPoint
    
    var dictModel:[String:AnyObject]{
        return ["footViewSize":getFootViewSizeDictModel as AnyObject,"footViewPoint":getFootViewPointModel as AnyObject]
    }
    var getFootViewSizeDictModel:[String:AnyObject]{
        return ["width":footViewSize.width as AnyObject,"height":footViewSize.height as AnyObject]
    }
    var getFootViewPointModel:[String:AnyObject]{
        return ["x":footViewPoint.x as AnyObject , "y":footViewPoint.y as AnyObject]
    }
}

class ObjectOrientedClass {
    var name:String
    var password:String
    var colorEnum:EnumForObjectOrientedClass!
    var footViewArray:[FooterView]
    init(_name:String , _password:String , _colorEnum:EnumForObjectOrientedClass,_footViewArray:[FooterView] = []) {
        self.name = _name
        self.password = _password
        self.colorEnum = _colorEnum
        self.footViewArray = _footViewArray
    }
    var dictModel:[String:AnyObject]{
        return ["name":name as AnyObject,"password":password as AnyObject,"colorEnum":colorEnum.getColorString as AnyObject,"footViewArray":getFootViewArrayDictModel as AnyObject]
    }
    var getFootViewArrayDictModel:[[String:AnyObject]]{
        var tempModel = [[String:AnyObject]]()
        footViewArray.forEach { (footView) in
            tempModel.append(footView.dictModel)
        }
        return tempModel
    }
 
}

var model1 = ObjectOrientedClass(_name: "Daniyal", _password: "@#!@xzcz231", _colorEnum: .Blue, _footViewArray: [FooterView.init(footViewSize: CGSize.init(width: 10.0, height: 10.0), footViewPoint: CGPoint.init(x: 10.0, y: 2.2))])

print(model1.dictModel)

do {

    let jsonData = try JSONSerialization.data(withJSONObject: model1.dictModel, options: .prettyPrinted)
    // here "jsonData" is the dictionary encoded in JSON data
    print(String.init(data: jsonData, encoding: .ascii)!)
    _ = try JSONSerialization.jsonObject(with: jsonData, options: [])
    // here "decoded" is of type `Any`, decoded from JSON data
    
    // you can now cast it with the right type

} catch {
    print(error.localizedDescription)
}


//MARK:-Parse JSON USING Decodeable
struct ParseJSONModel:Decodable{
    let id:String
    let name:String
    let link:String
    let imageURL:String
    
}

let jsonURLString  = "https://api.letsbuildthatapp.com/jsondecodable/course"
if let url = URL(string: jsonURLString) {
    URLSession.shared.dataTask(with: url, completionHandler: { (isData, isReponse, isError) in
        if let data = isData {
            do{
                let parsedModel = try JSONDecoder().decode(ParseJSONModel.self, from: data)
                print(parsedModel)
            } catch {
                
            }
        }
    }).resume()
}


enum Color:Int {
    case green = 0
    case red
    case blue
    var getColorString:String {
        switch self {
        case .green:
            return "green"
        case .red:
            return "red"
        case .blue:
            return "blue"
        }
    }
}

let colorsArray = ["a","b","c","d","e","f"]
for (index,value) in colorsArray.enumerated() {
    print("\(index) and \(value)")
}
colorsArray.forEach { (color) in
    
}
for i in 0...colorsArray.count - 1 {
    print("\(colorsArray[i])")
}


protocol PersonClassDelegate:class{
    func getResultedValue(name:String)
}
class Person{
    weak var delegate:PersonClassDelegate?
    
    func getNumberofNames(){
        self.delegate?.getResultedValue(name: "Daniyal")
    }
}


class SecondPerson {
    var person:Person
    init(_person:Person) {
        self.person = _person
        self.person.delegate = self
    }
}
extension SecondPerson : PersonClassDelegate {
    func getResultedValue(name: String) {
        print(name)
    }
}
var person = Person()
var personModel = SecondPerson(_person: person)
person.getNumberofNames()


class ViewController/*: UIViewController*/ {
    
    
  //  @IBOutlet weak var loader: UIActivityIndicatorView!
 //   var viewLoader : UIActivityIndicatorView!
     func viewDidLoad() {
        viewDidLoad()
        //   viewLoader = UIActivityIndicatorView.init(activityIndicatorStyle: .gray)
        //   viewLoader.frame = CGRect.init(x: 100, y: 100, width: 200, height: 200)
        //  self.view.addSubview(viewLoader)
       // loader.startAnimating()
        let operationQueue = OperationQueue()
        let operation1 = BlockOperation { [unowned self] in
            self.performWork()
        }
        operation1.qualityOfService = .userInteractive
        operation1.completionBlock = { [unowned self] in
            DispatchQueue.main.async {
              //  self.loader.stopAnimating()
            }
            
        }
        
        
        let operation2 = BlockOperation { [unowned self] in
            self.performWork1()
        }
        operation2.qualityOfService = .userInteractive
        operation2.completionBlock = { [unowned self] in
            DispatchQueue.main.async {
                //self.loader.stopAnimating()
            }
            
        }
        operationQueue.maxConcurrentOperationCount = 2
        operationQueue.name = "PerformTask1"
        operationQueue.qualityOfService = .userInitiated
        operationQueue.addOperation(operation1)
        operationQueue.addOperation(operation2)
        
        //--------------------------------------------------
        let operationQueue2 = OperationQueue()
        let operation12 = BlockOperation { [unowned self] in
            self.performWork2()
        }
        operation12.qualityOfService = .userInteractive
        operation12.completionBlock = { [unowned self] in
            DispatchQueue.main.async { //Queue2
                //self.loader.stopAnimating()
            }
            
        }
        
        
        let operation22 = BlockOperation { [unowned self] in
            self.performWork3()
        }
        operation22.qualityOfService = .userInteractive
        operation22.completionBlock = { [unowned self] in
            DispatchQueue.main.async {//Queue2
                //self.loader.stopAnimating()
            }
            
        }
        operationQueue2.maxConcurrentOperationCount = 2
        operationQueue2.name = "PerformTask2"
        operationQueue2.qualityOfService = .userInteractive
        operationQueue2.addOperation(operation12)
        operationQueue2.addOperation(operation22)
        
        //Till now usage was through operation block.
        
        
        //Direct Usage
        DispatchQueue.global(qos:.background).async {
            
        }
        
        
        /*DispatchQueue.global(qos: .utility).async { [unowned self] in
         self.performWork()
         DispatchQueue.main.async {
         self.loader.stopAnimating()
         }
         }
         DispatchQueue.global(qos: .unspecified).async {
         self.performWork3()
         DispatchQueue.main.async {
         self.loader.stopAnimating()
         }
         }
         DispatchQueue.global(qos:.userInteractive).async { [unowned self] in
         self.performWork1()
         DispatchQueue.main.async {
         self.loader.stopAnimating()
         }
         }
         DispatchQueue.global(qos: .userInitiated).async {
         self.performWork2()
         DispatchQueue.main.async {
         self.loader.stopAnimating()
         }
         }*/
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
     func didReceiveMemoryWarning() {
        didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func performWork() {
        let n = 500
        var matrix = Array(repeating: [Int](repeating: 0, count: n), count: n)
        for i in 0..<n {
            for j in 0..<n {
                matrix[i][j] = i + j
                print("dani")
            }
        }
    }
    func performWork1() {
        let n = 500
        var matrix = Array(repeating: [Int](repeating: 0, count: n), count: n)
        for i in 0..<n {
            for j in 0..<n {
                matrix[i][j] = i + j
                print("you")
            }
        }
    }
    
    func performWork2() {
        let n = 500
        var matrix = Array(repeating: [Int](repeating: 0, count: n), count: n)
        for i in 0..<n {
            for j in 0..<n {
                matrix[i][j] = i + j
                print("nabel")
            }
        }
    }
    func performWork3() {
        let n = 500
        var matrix = Array(repeating: [Int](repeating: 0, count: n), count: n)
        for i in 0..<n {
            for j in 0..<n {
                matrix[i][j] = i + j
                print("nehal")
            }
        }
    }
    
    
}







