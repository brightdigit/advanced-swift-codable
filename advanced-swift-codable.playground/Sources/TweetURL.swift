import Foundation

public struct TweetURL : Codable {
  public let url : URL
  public let expanded_url : URL
  public let display_url : String
  public let indices : [Int]
}
