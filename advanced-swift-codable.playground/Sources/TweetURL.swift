import Foundation

public struct TweetURL : Codable {
  public let url : URL
  public let expandedUrl : URL
  public let displayUrl : String
  public let indices : [Int]
}
