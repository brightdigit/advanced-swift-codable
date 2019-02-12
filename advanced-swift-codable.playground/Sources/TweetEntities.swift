public struct TweetEntities : Codable {
  public let userMentions : [TweetUserMentionsEntity]?
  public let urls : [TweetURL]?
  public let media : [TweetMediaEntity]?
}

