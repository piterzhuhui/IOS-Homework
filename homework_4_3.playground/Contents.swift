//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

class TriangleView: UIView{
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        let firstpath = UIBezierPath(rect: rect)
        //创建一个UIBezierPath变量，UIBezierPath可创建基于矢量的路径，常用来绘图
        UIColor.red.setStroke()  //红色边界
        firstpath.stroke()   //将视图边界弄成红色
        UIColor.yellow.setFill()//黄色填充
        firstpath.fill()//将TrangleView将视图填充为黄色
        
        //画椭圆和圆
        let secondpath = UIBezierPath(ovalIn:rect)
        UIColor.blue.setStroke()
        secondpath.stroke()
        UIColor.green.setFill()
        secondpath.fill()
        
        //画三角形
        path.move(to: CGPoint(x:rect.size.width/2,y:0))
        path.addLine(to: CGPoint(x:rect.size.width,y:rect.size.height))
        path.addLine(to: CGPoint(x:0,y:rect.size.height))
        path.close()
        UIColor.black.setStroke()
        path.stroke()
        UIColor.cyan.setFill()
        path.fill()
    }
}
class Controller:UIViewController{
    var label:UILabel!
    var triangle:TriangleView!
    @IBAction func clicked(){ //生成点击事件
        print("i am clicked")
        label?.text = "i am clicked!!"
        UIView.animate(withDuration: 1){
            self.triangle.center = CGPoint(x: 200, y: 0)
        }
    }
    override func loadView() { //加载视图
        view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 800))
        view.backgroundColor = UIColor.lightGray
        label = UILabel(frame: CGRect(x: 100, y: 20, width: 200, height: 50))
        label.backgroundColor = UIColor.blue
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = "hello,word"
        view.addSubview(label)//将从网上下载的图片作为背景图片
        let url = URL(string: "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=280692610,4239256719&fm=26&gp=0.jpg")!
        let data = try! Data(contentsOf: url)
        let image = UIImage(data: data)
        let imageView = UIImageView(frame: CGRect(x: 0, y: 100, width: 400, height:400))
        imageView.image = image
        view.addSubview(imageView)
        //添加按钮
        let button = UIButton(frame: CGRect(x: 100, y: 600, width: 200, height: 50))
        button.backgroundColor = UIColor.brown
        button.setTitle("clicked me", for: .normal)
        button.addTarget(self, action: #selector(Controller.clicked), for: UIControl.Event.touchUpInside)
        view.addSubview(button)
        //画图
        triangle = TriangleView(frame: CGRect(x: 100, y: 400, width: 200, height: 200))
        triangle.backgroundColor = UIColor.clear
        view.addSubview(triangle)
    }
}
let ct = Controller()
PlaygroundPage.current.liveView = ct
