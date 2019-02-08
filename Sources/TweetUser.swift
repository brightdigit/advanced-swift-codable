import Foundation

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

