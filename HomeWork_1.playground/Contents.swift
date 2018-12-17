//: Playground - noun: a place where people can play

import UIKit

////var str = "Hello, playground"
var primes = [Int]()
for i in 2...100{
    var isPrime = true
    for j in 2..<i{
        if i % j == 0{
            isPrime = false
        }
    }
    if isPrime == true{
        primes.append(i)
    }
}
//正排序
primes.sort()
print(primes)

//反排序第一种
func compare(one:Int,two:Int)->Bool{
    return one > two
}
primes.sort(by:compare)
print(primes)

//反排序第二种
//恢复一下
primes.sort()
primes.sort(by:{(one,two) in one > two })
print(primes)

//反排序第三种
primes.sort()
primes.sort(by:{$0 > $1})
print(primes)

//反排序第四种
primes.sort()
primes.sort{$0 > $1}
print(primes)

//反排序第五种
primes.sort()
primes.sort(by: >)
print(primes)


//作业2
enum Gender:Int{
    case male
    case female
    static func >(person1:Gender,person2:Gender)->Bool{
        return person1.rawValue < person2.rawValue
    }
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
}

class Teacher:Person{
    var title:String
    init(firstName: String, lastName: String, age: Int, gender: Gender,title:String) {
        self.title = title
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    override var description: String{
        return "Name:\(fullName),Age:\(age),Gender:\(gender),title:\(title)"
    }
}

class Student:Person{
    var stuNo:String
init(firstName:String,lastName:String,age:Int,gender:Gender,stuNo:String) {
        self.stuNo = stuNo
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    convenience init(name:String){
        self.init(firstName:name,lastName:"",age:18,gender:Gender.female,stuNo:"60")
    }
    override var description: String{
        return super.description+",stuNo:\(stuNo)"
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

let t1 = Teacher(firstName: "张", lastName: "三", age: 42, gender: .female, title: "无")
print(t1)

//初始化一个空数组
var arrayPerson = [Person]()
//生成两个person对象
for i in 1...2{
    let temp = Person(firstName: "张", lastName: "\(i)", age: 20+i, gender: Gender.female)
    arrayPerson.append(temp)
}
//生成一个Teacher对象
let teacher1 = Teacher(firstName: "李", lastName: "四", age: 18, gender: Gender.male, title: "title无")
arrayPerson.append(teacher1)
//生成三个Student对象
for i in 1...3{
    let temp2 = Student(firstName: "赵", lastName: "\(i)", age: 18+i, gender: Gender.male, stuNo: "\(i)")
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




