//: Playground - noun: a place where people can play

import Cocoa

//作业1
//(1)
print("(1)")
let dic:[[String:Any]] = [["name":"张三","age":18],["name":"李四","age":20],["name":"赵五","age":19]]
let dicResult = dic.map( { $0["name"]!} )
print("名字为：\(dicResult)")

//(2)
print()
print("(2)")
let string = ["dfbje","4447","eaoc","781"]
let result = string.filter{Int($0) != nil}
print(result)
//(3)
print()
print("(3)")
let string_3 = ["I ","am ","a ","student"]
let resString3 = string_3.reduce("", {$0 + $1})
print(resString3)
//(4)
print()
print("(4)")
var arr_4 = [1,2,3,4,5,6,7,8]
let result_4 = arr_4.reduce((max:Int.min,min:Int.max,sum:0)){
    (result_4,i) in return(max(result_4.max,i),min(result_4.min, i),result_4.sum+i)
}
print("Max is \(result_4.max)")
print("Min is \(result_4.min)")
print("Sum is \(result_4.sum)")

//(5)
//
//(6)
print()
print("(6)")
extension Int{
    func sqrt(data:Int)->Double{
        return Darwin.sqrt(Double(data))
    }
}
print(sqrt(25))

//(7)
print()
print("(7)")
func supportFanxin<T:Comparable>(data: [T])->(max:T,min:T){
    var max = data[0]
    var min = data[0]
    for i in data{
        if max < i{
            max = i
        }else if min > i{
            min = i
        }
    }
    return (max,min)
}
let tempInt = supportFanxin(data: [1,1,2,5,3])
print("Max is \(tempInt.max),Min is \(tempInt.min)")

let tempDouble = supportFanxin(data: [4.1,2.3,1.1,7.2])
print("Max is \(tempDouble.max),Min is \(tempDouble.min)")

let tempString = supportFanxin(data: ["Xadu","sfwuf","qeiuh"])
print("Max is \(tempString.max),Min is \(tempString.min)")


//作业2
enum Gender:Int{
    case male
    case female
    static func >(person1:Gender,person2:Gender)->Bool{
        return person1.rawValue < person2.rawValue
    }
}
enum Department{
    case departmentOne,departmentTwo,departmentThree
}


//新建一个协议
protocol SchoolProtocol{
    var department:Department {get set}
    func lendBook()
}


class Person:CustomStringConvertible{
    var firstName:String
    var lastName:String
    var age:Int
    var gender:Gender
    var fullName:String{
        get{
            return firstName + " " + lastName
        }
    }
    init(firstName:String,lastName:String,age:Int,gender:Gender) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    convenience init(name:String){
        self.init(firstName: name, lastName: "", age: 18, gender: Gender.female)
    }

    var description: String{
        return "Name:\(fullName),Age:\(age),Gender:\(gender)"
    }

    static func == (person1:Person,person2:Person)->Bool{
        return person1.fullName == person2.fullName && person1.age == person2.age
            && person1.gender == person2.gender
    }
    static func != (person1:Person,person2:Person)->Bool{
        return !(person1 == person2)
    }
    func run(){
        print("Person \(fullName) is running")
    }
}

class Teacher:Person,SchoolProtocol{
    var department: Department
    var title:String
    init(firstName: String, lastName: String, age: Int, gender: Gender,title:String,department:Department) {
        self.department = department
        self.title = title
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    override var description: String{
        return "Name:\(fullName),Age:\(age),Gender:\(gender),title:\(title),department:\(department)"
    }
    override func run() {
        print("Teacher \(fullName) is running")
    }
    func lendBook() {
        print("\(fullName) lend a book")
    }
}

class Student:Person,SchoolProtocol{
    var department: Department

    func lendBook() {
        print("Student \(fullName) lend a book")
    }

    var stuNo:String
    init(firstName:String,lastName:String,age:Int,gender:Gender,stuNo:String,department:Department) {
        self.department = department
        self.stuNo = stuNo
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    convenience init(name:String){
        self.init(firstName:name,lastName:"",age:18,gender:Gender.female,stuNo:"60",department:Department.departmentOne)
    }
    override var description: String{
        return super.description+",stuNo:\(stuNo)"
    }
    override func run() {
        print("Student \(fullName) is running")
    }
}

//结果检测
let p1 = Person(firstName:"Li",lastName:"guiyang",age:43,gender:Gender.male)
let p2 = Person(name:"gaoyuexiang")
print(p1.description)
print(p2.description)
print(p1 == p2)
print(p1 != p2)

let s1 = Student(name:"fan")
print(s1.description)

let t1 = Teacher(firstName: "张", lastName: "三", age: 42, gender: .female, title: "无", department:Department.departmentThree )
print(t1)

//初始化一个空数组
var arrayPerson = [Person]()
//生成两个person对象
for i in 1...2{
    let temp = Person(firstName: "张", lastName: "\(i)", age: 20+i, gender: Gender.female)
    arrayPerson.append(temp)
}
//生成一个Teacher对象
let teacher1 = Teacher(firstName: "李", lastName: "四", age: 18, gender: Gender.male, title: "title无", department: Department.departmentTwo)
arrayPerson.append(teacher1)
//生成三个Student对象
for i in 1...3{
    let temp2 = Student(firstName: "赵", lastName: "\(i)", age: 18+i, gender: Gender.male, stuNo: "\(i)",department:Department.departmentOne)
    arrayPerson.append(temp2)
}

//统计每个类的对象个数
var dict = ["Person":0,"Teacher":0,"Student":0]

for item in arrayPerson{
    if item is Teacher{
        dict["Teacher"]! += 1
    }else if item is Student{
        dict["Student"]! += 1
    }else{
        dict["Person"]! += 1
    }
}
//输出
for (key,value) in dict{
    print("\(key) : \(value)")
}

//对数组按以下要求排序并输出：age、fullName、gender+age；
for item in arrayPerson{
    print(item)
}

//按age从大到小排序输出
print()
print("按age排序输出:")
arrayPerson.sort(by:{$0.age > $1.age})
for item in arrayPerson{
    print(item)
}
//按fullName排序输出
print()
print("按fullName排序输出:")
arrayPerson.sort(by:{$0.fullName > $1.fullName})
for item in arrayPerson{
    print(item)
}

//按gender+age排序输出
print()
print("按gender+age排序输出:")
arrayPerson.sort{return ($0.gender > $1.gender)&&($0.age > $1.age)}
for item in arrayPerson{
    print(item)
}

//对数组进行穷举
print()
print("穷举，调用run()方法和lendBook方法")
for item in arrayPerson{
    item.run()
    if let student = item as? Student{
        student.lendBook()
    }else if let teacher = item as? Teacher{
        teacher.lendBook()
    }
}


