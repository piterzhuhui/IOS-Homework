import Cocoa
import Foundation

func newLine() {
    print()
}
enum MyError:Error {
    case Zero
    case NotURL
}
////1.显示当前准确的中文时间，包括北京、东京、纽约、伦敦，格式为（2016年9月28日星期三 上午10:25）
////a)显示中文需要设置locale

let currentDate = Date()
var dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy年MM月dd日 EEEE a HH:mm"
let time = dateFormatter.string(from: currentDate)
print("当前北京时间为：\(dateFormatter.string(from: currentDate))")
let dateAsString = Date()
let timeZH = DateFormatter()
//设置中文时间
timeZH.locale = Locale(identifier: "zh_CN")
timeZH.dateFormat="yyyy年MMMd日EEEE a HH:mm "
//默认为英国伦敦时间
print(timeZH.string(from: dateAsString))
let calendar = Calendar.current
var components = DateComponents()
components.timeZone = TimeZone(abbreviation:"UTC+9")
//设置时区为东八区，北京时间
var dateComponets1 = calendar.dateComponents(in: TimeZone.init(secondsFromGMT: 3600*8)!, from: dateAsString)
dateComponets1.timeZone = TimeZone(abbreviation:"UTC+9")
let dateCh = calendar.date(from:dateComponets1)
print(timeZH.string(from: dateCh!))
//设置时区为东九区，东京时间
var dateComponets2 = calendar.dateComponents(in: TimeZone.init(secondsFromGMT: 3600*9)!, from: dateAsString)
dateComponets1.timeZone = TimeZone(abbreviation:"UTC+10")
let dateJp = calendar.date(from:dateComponets2)
print(timeZH.string(from: dateJp!))
//设置时区为，纽约时间
var dateComponets3 = calendar.dateComponents(in: TimeZone.init(secondsFromGMT: -3600*5)!, from: dateAsString)
dateComponets1.timeZone = TimeZone(abbreviation:"UTC-5")
let dateAm = calendar.date(from:dateComponets3)
print(timeZH.string(from:dateAm!))





//let calendar = Calendar.current
//var components = DateComponents()
//components.timeZone = TimeZone(abbreviation: "UTC+9")
////设置为东八区
////components.timeZone = TimeZone.init(SecondsFromGMT:8*3600)!
//let newDate1 = calendar.date(from: components)
//let dateformatter2 = DateFormatter()
//dateformatter2.dateFormat = "YYYY年MM月dd日 EEEE hh:mm:ss"
//print("\(dateformatter2.string(from: newDate1!))")


//2.处理字符串
//a)新建字符串：“Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS.”；
//b)返回字符串从第6个字符到第20个字符的子串；
//c)删除其中所有的OS字符；
print()
let strings = "Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS."
let index1 = strings.index(strings.startIndex, offsetBy: 5)
let index2 = strings.index(strings.startIndex, offsetBy: 20)
let sub = strings[index1..<index2]
print("返回字符串从第6个字符到第20个字符的子串:\(sub)")
let sub2 = strings.replacingOccurrences(of: "OS", with: "")
print("删除其中所有的OS字符:\n\(sub2)")
let dict = ["\(time)":"\(sub2)"] as AnyObject
let fileManager1 = FileManager.default
if var docPath = fileManager1.urls(for: .documentDirectory, in: .userDomainMask).first{
    docPath.appendPathComponent("test.txt")
    dict.write(to: docPath,atomically:true)
}else{
    throw MyError.NotURL
}
let fileManager = FileManager.default
var url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
let imageUrl = URL(string: "http://pic1.win4000.com/pic/b/18/c1601227067.jpg")!
let imageData = try? Data(contentsOf: imageUrl)
url.appendPathComponent("mypic.jpg")
try? imageData?.write(to: url)
//从网上查找访问一个JSon接口文件，并采用JSONSerialization和字典对其进行简单解析
guard let weatherUrl = URL(string: "http://www.weather.com.cn/data/cityinfo/101010100.html") else{
    throw MyError.NotURL
}
let jsondata = try Data(contentsOf: weatherUrl)
//let jsondata = try! Data(contentsOf: weatherUrl)
let json = try! JSONSerialization.jsonObject(with: jsondata, options: .allowFragments)
guard let dic = json as? [String:Any] else{
    throw MyError.NotURL
}
guard let weather = dic["weatherinfo"] as? [String:String] else{
    throw MyError.NotURL
}
