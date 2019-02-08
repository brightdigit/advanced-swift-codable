public struct TweetEntities : Codable {
  public let user_mentions : [TweetUserMentionsEntity]?
  public let urls : [TweetURL]?
  public let media : [TweetMediaEntity]?
}

