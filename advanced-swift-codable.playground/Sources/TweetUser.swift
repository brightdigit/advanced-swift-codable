import Foundation

public struct TweetUser : Codable {
  public let id : Int
  public let name : String
  public let screenName : String
  public let location : String
  public let description : String
  public let url : URL?
  public let entities : TweetEntities
  public let protected : Bool
  public let followersCount : Int
  public let friendsCount : Int
  public let listedCount : Int
  public let createdAt : Date
  public let favouritesCount : Int
  public let utcOffset : TimeInterval
  public let timeZone : String
  public let geoEnabled : Bool
  public let verified : Bool
  public let statusesCount : Int
  public let lang : String
  public let contributorsEnabled : Bool
  public let isTranslator: Bool
  public let isTranslationEnabled: Bool
  public let profileBackgroundColor: Color
  public let profileBackgroundImageUrl: URL?
  public let profileBackgroundImageUrlHttps: URL?
  public let profileBackgroundTile: Bool
  public let profileImageUrl: URL?
  public let profileImageUrlHttps: URL?
  public let profileBannerUrl: URL?
  public let profileLinkColor: Color
  public let profileSidebarBorderColor: Color
  public let profileSidebarFillColor: Color
  public let profileTextColor: Color
  public let profileUseBackgroundImage: Bool
  public let hasExtendedProfile: Bool
  public let defaultProfile: Bool
  public let defaultProfileImage: Bool
  public let following: Bool
  public let followRequestSent: Bool
  public let notifications: Bool
}

