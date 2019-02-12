import Foundation

public struct QuotedTweet : Codable {
  public let createdAt : Date
  public let id : Int
  public let fullText : String
  public let displayTextRange : [Int]
  public let entities : TweetEntities
  public let user : TweetUser
  public let source : String
  public let extendedEntities : TweetEntities
  public let isQuoteStatus : Bool
  public let retweetCount : Int
  public let favoriteCount : Int
  public let favorited : Bool
  public let retweeted : Bool
  public let possiblySensitive : Bool
  public let possiblySensitiveAppealable : Bool
  public let lang : String
}

extension QuotedTweet : TweetProtocol {
  public var quotedTweet: TweetProtocol? {
    return nil
  }
}
