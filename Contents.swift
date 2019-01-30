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
}

public struct TweetEntities : Codable {
  public let user_mentions : [TweetUserMentionsEntity]?
  public let urls : [TweetURL]?
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


//  "geo": null,
//  "coordinates": null,
//  "place": null,
//  "contributors": null,
//  "quoted_status_id": 704059336788606976,
//  "quoted_status_id_str": "704059336788606976",
//  "quoted_status": {
//    "created_at": "Sun Feb 28 21:43:21 +0000 2016",
//    "id": 704059336788606976,
//    "id_str": "704059336788606976",
//    "full_text": "My favorite photographic subject, up closer than ever before. https://t.co/K958bKh9Sd",
//    "display_text_range": [
//    0,
//    85
//    ],
//    "entities": {
//      "hashtags": [],
//      "symbols": [],
//      "user_mentions": [],
//      "urls": [],
//      "media": [
//      {
//      "id": 704059330149031936,
//      "id_str": "704059330149031936",
//      "indices": [
//      62,
//      85
//      ],
//      "media_url": "http://pbs.twimg.com/media/CcVSOwJVIAAKwE6.jpg",
//      "media_url_https": "https://pbs.twimg.com/media/CcVSOwJVIAAKwE6.jpg",
//      "url": "https://t.co/K958bKh9Sd",
//      "display_url": "pic.twitter.com/K958bKh9Sd",
//      "expanded_url": "http://twitter.com/jeremycloud/status/704059336788606976/photo/1",
//      "type": "photo",
//      "sizes": {
//      "medium": {
//      "w": 600,
//      "h": 600,
//      "resize": "fit"
//      },
//      "thumb": {
//      "w": 150,
//      "h": 150,
//      "resize": "crop"
//      },
//      "large": {
//      "w": 871,
//      "h": 871,
//      "resize": "fit"
//      },
//      "small": {
//      "w": 340,
//      "h": 340,
//      "resize": "fit"
//      }
//      }
//      }
//      ]
//    },
//    "extended_entities": {
//      "media": [
//      {
//      "id": 704059330149031936,
//      "id_str": "704059330149031936",
//      "indices": [
//      62,
//      85
//      ],
//      "media_url": "http://pbs.twimg.com/media/CcVSOwJVIAAKwE6.jpg",
//      "media_url_https": "https://pbs.twimg.com/media/CcVSOwJVIAAKwE6.jpg",
//      "url": "https://t.co/K958bKh9Sd",
//      "display_url": "pic.twitter.com/K958bKh9Sd",
//      "expanded_url": "http://twitter.com/jeremycloud/status/704059336788606976/photo/1",
//      "type": "photo",
//      "sizes": {
//      "medium": {
//      "w": 600,
//      "h": 600,
//      "resize": "fit"
//      },
//      "thumb": {
//      "w": 150,
//      "h": 150,
//      "resize": "crop"
//      },
//      "large": {
//      "w": 871,
//      "h": 871,
//      "resize": "fit"
//      },
//      "small": {
//      "w": 340,
//      "h": 340,
//      "resize": "fit"
//      }
//      }
//      }
//      ]
//    },
//    "truncated": false,
//    "source": "<a href=\"http://twitter.com/download/iphone\" rel=\"nofollow\">Twitter for iPhone</a>",
//    "in_reply_to_status_id": null,
//    "in_reply_to_status_id_str": null,
//    "in_reply_to_user_id": null,
//    "in_reply_to_user_id_str": null,
//    "in_reply_to_screen_name": null,

//    "user": {

//      "protected": false,
//      "followers_count": 4324,
//      "friends_count": 410,
//      "listed_count": 103,
//      "created_at": "Mon Jun 09 17:00:58 +0000 2008",
//      "favourites_count": 815,
//      "utc_offset": -18000,
//      "time_zone": "Central Time (US & Canada)",
//      "geo_enabled": true,
//      "verified": false,
//      "statuses_count": 2218,
//      "lang": "en",
//      "contributors_enabled": false,
//      "is_translator": false,
//      "is_translation_enabled": false,
//      "profile_background_color": "000000",
//      "profile_background_image_url": "http://abs.twimg.com/images/themes/theme1/bg.png",
//      "profile_background_image_url_https": "https://abs.twimg.com/images/themes/theme1/bg.png",
//      "profile_background_tile": false,
//      "profile_image_url": "http://pbs.twimg.com/profile_images/436903139183054849/i_MbCcoW_normal.jpeg",
//      "profile_image_url_https": "https://pbs.twimg.com/profile_images/436903139183054849/i_MbCcoW_normal.jpeg",
//      "profile_banner_url": "https://pbs.twimg.com/profile_banners/15062340/1447451621",
//      "profile_link_color": "4A913C",
//      "profile_sidebar_border_color": "000000",
//      "profile_sidebar_fill_color": "000000",
//      "profile_text_color": "000000",
//      "profile_use_background_image": false,
//      "has_extended_profile": true,
//      "default_profile": false,
//      "default_profile_image": false,
//      "following": true,
//      "follow_request_sent": false,
//      "notifications": false
//    },
//    "geo": null,
//    "coordinates": null,
//    "place": null,
//    "contributors": null,
//    "is_quote_status": false,
//    "retweet_count": 0,
//    "favorite_count": 11,
//    "favorited": false,
//    "retweeted": false,
//    "possibly_sensitive": false,
//    "possibly_sensitive_appealable": false,
//    "lang": "en"
//  },
//  "is_quote_status": true,
//  "retweet_count": 0,
//  "favorite_count": 0,
//  "favorited": false,
//  "retweeted": false,
//  "possibly_sensitive": false,
//  "possibly_sensitive_appealable": false,
//  "lang": "en"
//}
