import Foundation

public struct Tweet : Codable {
  public let created_at : Date
  public let id : Int
  public let full_text : String
  public let display_text_range : [Int]
  public let entities : TweetEntities
  public let source : String
  public let in_reply_to_status_id : Int?
  public let in_reply_to_user_id : Int?
  public let in_reply_to_screen_name : String
  public let user : TweetUser
  public let quoted_status : QuotedTweet
  public let is_quote_status : Bool
  public let retweet_count : Int
  public let favorite_count : Int
  public let favorited : Bool
  public let retweeted : Bool
  public let possibly_sensitive : Bool
  public let possibly_sensitive_appealable : Bool
  public let lang : String
}

extension Tweet : TweetProtocol {
  public var quoted_tweet: TweetProtocol? {
    return self.quoted_status
  }
}
