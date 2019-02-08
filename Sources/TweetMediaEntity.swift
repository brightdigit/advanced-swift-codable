import Foundation

public struct TweetMediaEntity : Codable {
  public let id : Int
  public let indices : [Int]
  public let media_url : URL
  public let media_url_https : URL
  public let url : URL
  public let display_url : String
  public let expanded_url : URL
  public let type : String
  public let sizes : TweetMediaEntitySizeSet
}


