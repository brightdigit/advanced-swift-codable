import Foundation

public protocol TweetProtocol {
  var full_text : String { get }
  var quoted_tweet : TweetProtocol? { get }
}
