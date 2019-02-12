import Foundation

public struct Tweet : Codable {
  public let createdAt : Date
  public let id : Int
  public let fullText : String
  public let displayTextRange : [Int]
  public let entities : TweetEntities
  public let source : String
  public let inReplyToStatusId : Int?
  public let inReplyToUserId : Int?
  public let inReplyToScreenName : String
  public let user : TweetUser
  public let quotedStatus : QuotedTweet
  public let isQuoteStatus : Bool
  public let retweetCount : Int
  public let favoriteCount : Int
  public let favorited : Bool
  public let retweeted : Bool
  public let possiblySensitive : Bool
  public let possiblySensitiveAppealable : Bool
  public let lang : String
}

extension Tweet : TweetProtocol {
  public var quotedTweet: TweetProtocol? {
    return self.quotedStatus
  }
}
