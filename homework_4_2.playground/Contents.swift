
import UIKit
import PlaygroundSupport

class TrangleView:UIView{  //从view中派生出自定义的View
    override func draw(_ rect:CGRect){  //重写父类的draw方法
        //        let firstpath = UIBezierPath(rect: rect)
        
        //创建一个UIBezierPath变量，用于画三角形
        let path = UIBezierPath()
        path.move(to: CGPoint(x: rect.size.width/2, y: 0)) //设置线段的起始点
        path.addLine(to: CGPoint(x: rect.size.width, y: rect.size.height))//添加一条线段
        path.addLine(to: CGPoint(x: 0, y: rect.size.height))//添加一条线段
        UIColor.black.setStroke()
        path.stroke()
        UIColor.green.setFill()
        path.fill()
        
        
        //画椭圆和圆
        let path3 = UIBezierPath(ovalIn:rect)
        UIColor.blue.setStroke()
        path3.stroke()
        UIColor.yellow.setFill()
        path3.fill()
        
        
    }
}
class Controller:UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 800))
        view.backgroundColor = UIColor.gray
        //画椭圆
        let ovel = TrangleView(frame:CGRect(x:50,y:100,width:60,height:130))
        ovel.backgroundColor = UIColor.clear
        self.view.addSubview(ovel)
        //画椭圆
        let circle = TrangleView(frame:CGRect(x:210,y:220,width:150,height:80))
        circle.backgroundColor = UIColor.clear
        self.view.addSubview(circle)
        //画圆
        let triangle = TrangleView(frame: CGRect(x: 100, y: 400, width: 200, height: 200))
        triangle.backgroundColor = UIColor.clear
        view.addSubview(triangle)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
let ct = Controller()
PlaygroundPage.current.liveView = ct
