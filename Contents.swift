import UIKit
import PlaygroundSupport

public typealias Color = String
let twitterDateFormatString = "eee MMM dd HH:mm:ss ZZZZ yyyy"
let twitterDateFormatter = {
  dateFormat -> DateFormatter in
  let formatter = DateFormatter ()
  formatter.locale = Locale(identifier: "en_US_POSIX")
  formatter.dateFormat = dateFormat
  return formatter
}(twitterDateFormatString)



guard let twitterURL = Bundle.main.url(forResource: "twitter", withExtension: "json")  else {
  PlaygroundPage.current.finishExecution()
}

guard let twitterData = try? Data(contentsOf: twitterURL) else {
  PlaygroundPage.current.finishExecution()
}
public struct TweetUser : Codable {
  public let id : Int
  public let name : String
  public let screen_name : String
  public let location : String
  public let description : String
  public let url : URL?
  public let entities : TweetEntities
  public let protected : Bool
  public let followers_count : Int
  public let friends_count : Int
  public let listed_count : Int
  public let created_at : Date
  public let favourites_count : Int
  public let utc_offset : TimeInterval
  public let time_zone : String
  public let geo_enabled : Bool
  public let verified : Bool
  public let statuses_count : Int
  public let lang : String
  public let contributors_enabled : Bool
  public let is_translator: Bool
  public let is_translation_enabled: Bool
  public let profile_background_color: Color
  public let profile_background_image_url: URL?
  public let profile_background_image_url_https: URL?
  public let profile_background_tile: Bool
  public let profile_image_url: URL?
  public let profile_image_url_https: URL?
  public let profile_banner_url: URL?
  public let profile_link_color: Color
  public let profile_sidebar_border_color: Color
  public let profile_sidebar_fill_color: Color
  public let profile_text_color: Color
  public let profile_use_background_image: Bool
  public let has_extended_profile: Bool
  public let default_profile: Bool
  public let default_profile_image: Bool
  public let following: Bool
  public let follow_request_sent: Bool
  public let notifications: Bool
}

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

public struct TweetMediaEntitySizeSet : Codable {
  public let medium : TweetMediaEntitySize
  public let thumb : TweetMediaEntitySize
  public let large : TweetMediaEntitySize
  public let small : TweetMediaEntitySize
}

public struct TweetMediaEntitySize : Codable {
  public let w : Int
  public let h : Int
  public let resize : String
}
public struct TweetMediaEntity : Codable {
  public let id : Int
  public let indices : [Int]
  public let media_url : URL
  public let media_url_https : URL
  public let url : URL
  public let display_url : String
  public let expanded_url : URL
  public let type : String
  public let sizes : TweetMediaEntitySizeSet
}


public struct TweetEntities : Codable {
  public let user_mentions : [TweetUserMentionsEntity]?
  public let urls : [TweetURL]?
  public let media : [TweetMediaEntity]?
}

public struct TweetUserMentionsEntity : Codable {
  public let screen_name : String
  public let name : String
  public let id : Int
  public let indices : [Int]
}

public struct TweetURL : Codable {
  public let url : URL
  public let expanded_url : URL
  public let display_url : String
  public let indices : [Int]
}
let decoder = JSONDecoder()

decoder.dateDecodingStrategy = .formatted(twitterDateFormatter)
let tweet = try decoder.decode(Tweet.self, from: twitterData)

