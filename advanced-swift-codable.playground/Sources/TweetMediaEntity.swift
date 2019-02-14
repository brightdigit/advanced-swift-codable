import Foundation

public struct TweetMediaEntity : Codable {
  public let id : Int
  public let indices : [Int]
  public let mediaUrl : URL
  public let mediaUrlHttps : URL
  public let url : URL
  public let displayUrl : String
  public let expandedUrl : URL
  public let type : String
  public let sizes : TweetMediaEntitySizeSet
}


