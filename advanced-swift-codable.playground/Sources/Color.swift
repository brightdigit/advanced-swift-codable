import Foundation
import CoreGraphics

public struct Color : Codable {
  public let red : CGFloat
  public let green : CGFloat
  public let blue : CGFloat
  public let alpha : CGFloat
  
  public init(from decoder: Decoder) throws {
    let hexCode = try decoder.singleValueContainer().decode(String.self)
    let scanner = Scanner(string: hexCode)
    var hexint : UInt32 = 0
    scanner.scanHexInt32(&hexint)
    
    self.red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
    self.green = CGFloat((hexint & 0xff00) >> 8) / 255.0
    self.blue = CGFloat((hexint & 0xff) >> 0) / 255.0
    self.alpha = 1
  }
  
  public func encode(to encoder: Encoder) throws {
    let string = String(format: "%02lX%02lX%02lX", lroundf(Float(red * 255.0)), lroundf(Float(green * 255.0)), lroundf(Float(blue * 255.0)))
    var container = encoder.singleValueContainer()
    try container.encode(string)
  }
}

