import Foundation

public struct QuotedTweet : Codable {
  public let created_at : Date
  public let id : Int
  public let full_text : String
  public let display_text_range : [Int]
  public let entities : TweetEntities
  public let user : TweetUser
  public let source : String
  public let extended_entities : TweetEntities
  public let is_quote_status : Bool
  public let retweet_count : Int
  public let favorite_count : Int
  public let favorited : Bool
  public let retweeted : Bool
  public let possibly_sensitive : Bool
  public let possibly_sensitive_appealable : Bool
  public let lang : String
}

extension QuotedTweet : TweetProtocol {
  public var quoted_tweet: TweetProtocol? {
    return nil
  }
}
