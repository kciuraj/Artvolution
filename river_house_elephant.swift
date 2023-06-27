//
//  Artvolution.swift
//

import UIKit

class Artvolution {
    
    // MARK: - Properties
    // MARK: - Properties
    var canvasSize: CGSize
    var brushColor: UIColor
    var brushSize: Int
    var canvasImage: UIImage
    var brushShading: CGFloat
    
    // MARK: - Initializer
    init(canvasSize: CGSize, brushSize: Int, brushShading: CGFloat, brushColor: UIColor){
        self.canvasSize = canvasSize
        self.brushSize = brushSize
        self.brushShading = brushShading
        self.brushColor = brushColor
        self.canvasImage = UIImage(named: "canvas")!
    }
    
    // MARK: - Helpers
    func pixelToImage(point: CGPoint) -> UIImage{
        UIGraphicsBeginImageContext(canvasSize)
        let rect = CGRect(x: 0, y: 0, width: canvasSize.width, height: canvasSize.height)
        let path = UIBezierPath(ovalIn: rect.insetBy(dx: point.x - brushSize, dy: point.y - brushSize))
        UIColor.black.setFill()
        path.fill()
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image ?? UIImage()
    }
    
    // MARK: - Rendering
    // MARK: - Rendering
    func render(toImage image: UIImage) -> UIImage{
        UIGraphicsBeginImageContext(canvasSize)
        image.draw(in: CGRect(x: 0, y: 0, width: canvasSize.width, height: canvasSize.height))
        let brushImage = pixelToImage(point: CGPoint(x: canvasSize.width / 2, y: canvasSize.height / 2))
        brushImage.draw(in:CGRect(x: 0, y: 0, width: canvasSize.width, height: canvasSize.height), blendMode: .normal, alpha: brushShading)
        canvasImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return canvasImage
    }
    
    // MARK: - Touch Events
    // MARK: - Touch Events
    func touchBegan(atPoint point: CGPoint){
        UIGraphicsBeginImageContext(canvasSize)
        canvasImage.draw(in: CGRect(x: 0, y: 0, width: canvasSize.width, height: canvasSize.height))
        brushImage = pixelToImage(point: point)
        brushImage.draw(in: CGRect(x: 0, y: 0, width: canvasSize.width, height: canvasSize.height), blendMode: .normal, alpha: brushShading)
        canvasImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    func touchMoved(toPoint point: CGPoint){
        UIGraphicsBeginImageContext(canvasSize)
        canvasImage.draw(in: CGRect(x: 0, y: 0, width: canvasSize.width, height: canvasSize.height))
        brushImage = pixelToImage(point: point)
        brushImage.draw(in: CGRect(x: 0, y: 0, width: canvasSize.width, height: canvasSize.height), blendMode: .normal, alpha: brushShading)
        canvasImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    func touchEnded(atPoint point: CGPoint){
        UIGraphicsBeginImageContext(canvasSize)
        canvasImage.draw(in: CGRect(x: 0, y: 0, width: canvasSize.width, height: canvasSize.height))
        brushImage = pixelToImage(point: point)
        brushImage.draw(in: CGRect(x: 0, y: 0, width: canvasSize.width, height: canvasSize.height), blendMode: .normal, alpha: brushShading)
        canvasImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    // MARK: - Drawing Tools
    // MARK: - Drawing Tools
    func drawLine(from point1: CGPoint, to point2: CGPoint){
        UIGraphicsBeginImageContext(canvasSize)
        canvasImage.draw(in: CGRect(x: 0, y: 0, width: canvasSize.width, height: canvasSize.height))
        let path = UIBezierPath()
        path.move(to: point1)
        path.addLine(to: point2)
        path.lineWidth = CGFloat(brushSize)
        brushColor.setStroke()
        path.stroke()
        canvasImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    func drawCircle(withCenterAt point: CGPoint){
        UIGraphicsBeginImageContext(canvasSize)
        canvasImage.draw(in: CGRect(x: 0, y: 0, width: canvasSize.width, height: canvasSize.height))
        let path = UIBezierPath(ovalIn: CGRect(x: point.x - CGFloat(brushSize), y: point.y - CGFloat(brushSize), width: CGFloat(brushSize) * 2, height: CGFloat(brushSize)*2))
        brushColor.setFill()
        path.fill()
        canvasImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    func drawRectangle(from point1: CGPoint, to point2: CGPoint){
        UIGraphicsBeginImageContext(canvasSize)
        canvasImage.draw(in: CGRect(x: 0, y: 0, width: canvasSize.width, height: canvasSize.height))
        let width = point2.x - point1.x
        let height = point2.y - point1.y
        let rect = CGRect(x: point1.x, y: point1.y, width: width, height: height)
        let path = UIBezierPath(rect: rect)
        brushColor.setFill()
        path.fill()
        canvasImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    // MARK: - Reset
    // MARK: - Reset
    func resetCanvas(){
        UIGraphicsBeginImageContext(canvasSize)
        let rect = CGRect(x: 0, y: 0, width: canvasSize.width, height: canvasSize.height)
        UIColor.clear.setFill()
        UIRectFill(rect)
        canvasImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
}