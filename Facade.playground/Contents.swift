import UIKit

struct ImageOrColor {
   private var color: UIColor?
   private var image: UIImage?
    
    init(color: UIColor) {
        self.color = color
        
    }
    
    init(image: UIImage) {
        self.image = image
    }
    
    
    
    func fill(rect: CGRect, in ctx: UIGraphicsImageRendererContext) {
        if let image = image {
            image.draw(in: rect)
        } else if let color = color {
            color.setFill()
            ctx.fill(rect)
        }
    }
}

let rect = CGRect(x: 0, y: 0, width: 512, height: 512)
let orangeColor = ImageOrColor(color: .red)
let renderer = UIGraphicsImageRenderer(bounds: rect)
let final = renderer.image {
    ctx in orangeColor.fill(rect: rect, in: ctx)
}
final
