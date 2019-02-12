import Foundation

public protocol TweetProtocol {
  var fullText : String { get }
  var quotedTweet : TweetProtocol? { get }
}
