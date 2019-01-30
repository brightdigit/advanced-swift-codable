import UIKit
import PlaygroundSupport

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

public struct Tweet : Codable {
  public let created_at : Date
  public let id : Int
  public let full_text : String
  public let display_text_range : [Int]
  public let entities : TweetEntities
}

public struct TweetEntities : Codable {
  public let user_mentions : [TweetUserMentionsEntity]
  public let urls : [TweetURL]
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

//  "created_at":"Tue Jan 29 00:05:53 +0000 2019",
//  "id":1090038283676065792,
//  "id_str":"1090038283676065792",
//  "full_text":"NEEENIII NEEENIII NEEENIII NEEENIII NEEENIII NEEENIII #GONENI https:\/\/t.co\/qSjcMssszy",
//  "truncated":false,
//  "display_text_range":[
//  0,
//  85
//  ],
//  "entities":{
//    "hashtags":[
//    {
//    "text":"GONENI",
//    "indices":[
//    54,
//    61
//    ]
//    }
//    ],
//    "symbols":[
//
//    ],
//    "user_mentions":[
//
//    ],
//    "urls":[
//    {
//    "url":"https:\/\/t.co\/qSjcMssszy",
//    "expanded_url":"https:\/\/twitter.com\/neniambulance\/status\/1022478993717641216",
//    "display_url":"twitter.com\/neniambulance\/\u2026",
//    "indices":[
//    62,
//    85
//    ]
//    }
//    ]
//  },
//  "source":"\u003ca href=\"https:\/\/github.com\/andremann\/neni-the-ambulance\" rel=\"nofollow\"\u003eNeni the ambulance\u003c\/a\u003e",
//  "in_reply_to_status_id":null,
//  "in_reply_to_status_id_str":null,
//  "in_reply_to_user_id":null,
//  "in_reply_to_user_id_str":null,
//  "in_reply_to_screen_name":null,
//  "user":{
//    "id":1011638875746439169,
//    "id_str":"1011638875746439169",
//    "name":"Neni the ambulance",
//    "screen_name":"neniambulance",
//    "location":"World",
//    "description":"I'm an ambulance, neni neni.  I will come and get you all. ALL! #JeSuisNENI #NENI #TEAMNENI #GONENI\nFacebook: https:\/\/t.co\/xQzvksX9BK",
//    "url":null,
//    "entities":{
//      "description":{
//        "urls":[
//        {
//        "url":"https:\/\/t.co\/xQzvksX9BK",
//        "expanded_url":"https:\/\/www.facebook.com\/nenitheambulanceofficial",
//        "display_url":"facebook.com\/nenitheambulan\u2026",
//        "indices":[
//        110,
//        133
//        ]
//        }
//        ]
//      }
//    },
//    "protected":false,
//    "followers_count":12675,
//    "friends_count":106,
//    "listed_count":18,
//    "created_at":"Tue Jun 26 15:54:38 +0000 2018",
//    "favourites_count":364,
//    "utc_offset":null,
//    "time_zone":null,
//    "geo_enabled":true,
//    "verified":false,
//    "statuses_count":52331,
//    "lang":"en",
//    "contributors_enabled":false,
//    "is_translator":false,
//    "is_translation_enabled":false,
//    "profile_background_color":"000000",
//    "profile_background_image_url":"http:\/\/abs.twimg.com\/images\/themes\/theme1\/bg.png",
//    "profile_background_image_url_https":"https:\/\/abs.twimg.com\/images\/themes\/theme1\/bg.png",
//    "profile_background_tile":false,
//    "profile_image_url":"http:\/\/pbs.twimg.com\/profile_images\/1011639519832150017\/7pIJxVjl_normal.jpg",
//    "profile_image_url_https":"https:\/\/pbs.twimg.com\/profile_images\/1011639519832150017\/7pIJxVjl_normal.jpg",
//    "profile_link_color":"1B95E0",
//    "profile_sidebar_border_color":"000000",
//    "profile_sidebar_fill_color":"000000",
//    "profile_text_color":"000000",
//    "profile_use_background_image":false,
//    "has_extended_profile":false,
//    "default_profile":false,
//    "default_profile_image":false,
//    "following":false,
//    "follow_request_sent":false,
//    "notifications":false,
//    "translator_type":"none"
//  },
//  "geo":{
//    "type":"Point",
//    "coordinates":[
//    21.91633,
//    -159.58995
//    ]
//  },
//  "coordinates":{
//    "type":"Point",
//    "coordinates":[
//    -159.58995,
//    21.91633
//    ]
//  },
//  "place":{
//    "id":"65af5dc039106ae9",
//    "url":"https:\/\/api.twitter.com\/1.1\/geo\/id\/65af5dc039106ae9.json",
//    "place_type":"city",
//    "name":"Hanapepe",
//    "full_name":"Hanapepe, HI",
//    "country_code":"US",
//    "country":"Estados Unidos",
//    "contained_within":[
//
//    ],
//    "bounding_box":{
//      "type":"Polygon",
//      "coordinates":[
//      [
//      [
//      -159.603987,
//      21.90065
//      ],
//      [
//      -159.570863,
//      21.90065
//      ],
//      [
//      -159.570863,
//      21.930376
//      ],
//      [
//      -159.603987,
//      21.930376
//      ]
//      ]
//      ]
//    },
//    "attributes":{
//
//    }
//  },
//  "contributors":null,
//  "is_quote_status":true,
//  "quoted_status_id":1022478993717641216,
//  "quoted_status_id_str":"1022478993717641216",
//  "quoted_status_permalink":{
//    "url":"https:\/\/t.co\/qSjcMssszy",
//    "expanded":"https:\/\/twitter.com\/neniambulance\/status\/1022478993717641216",
//    "display":"twitter.com\/neniambulance\/\u2026"
//  },
//  "quoted_status":{
//    "created_at":"Thu Jul 26 13:49:23 +0000 2018",
//    "id":1022478993717641216,
//    "id_str":"1022478993717641216",
//    "full_text":"***TWITTER AMBULANCE SERVICE***\nMake me NENI NENI by mentioning me in your tweets. Remember to use medical\/emergency hotwords, such as doctor, sos, nurse, die, asap, urgent, etc! \nEnglish, Italian and Spanish are supported.\ne.g. \"Mamma mia! @neniambulance an ambulance pls\" https:\/\/t.co\/xGqdIT4nfG",
//    "truncated":false,
//    "display_text_range":[
//    0,
//    273
//    ],
//    "entities":{
//      "hashtags":[
//
//      ],
//      "symbols":[
//
//      ],
//      "user_mentions":[
//      {
//      "screen_name":"neniambulance",
//      "name":"Neni the ambulance",
//      "id":1011638875746439169,
//      "id_str":"1011638875746439169",
//      "indices":[
//      241,
//      255
//      ]
//      }
//      ],
//      "urls":[
//
//      ],
//      "media":[
//      {
//      "id":1022478483581280257,
//      "id_str":"1022478483581280257",
//      "indices":[
//      274,
//      297
//      ],
//      "media_url":"http:\/\/pbs.twimg.com\/media\/DjCSw3RXoAE1YLW.jpg",
//      "media_url_https":"https:\/\/pbs.twimg.com\/media\/DjCSw3RXoAE1YLW.jpg",
//      "url":"https:\/\/t.co\/xGqdIT4nfG",
//      "display_url":"pic.twitter.com\/xGqdIT4nfG",
//      "expanded_url":"https:\/\/twitter.com\/neniambulance\/status\/1022478993717641216\/photo\/1",
//      "type":"photo",
//      "sizes":{
//      "thumb":{
//      "w":150,
//      "h":150,
//      "resize":"crop"
//      },
//      "small":{
//      "w":583,
//      "h":680,
//      "resize":"fit"
//      },
//      "medium":{
//      "w":600,
//      "h":700,
//      "resize":"fit"
//      },
//      "large":{
//      "w":600,
//      "h":700,
//      "resize":"fit"
//      }
//      }
//      }
//      ]
//    },
//    "extended_entities":{
//      "media":[
//      {
//      "id":1022478483581280257,
//      "id_str":"1022478483581280257",
//      "indices":[
//      274,
//      297
//      ],
//      "media_url":"http:\/\/pbs.twimg.com\/media\/DjCSw3RXoAE1YLW.jpg",
//      "media_url_https":"https:\/\/pbs.twimg.com\/media\/DjCSw3RXoAE1YLW.jpg",
//      "url":"https:\/\/t.co\/xGqdIT4nfG",
//      "display_url":"pic.twitter.com\/xGqdIT4nfG",
//      "expanded_url":"https:\/\/twitter.com\/neniambulance\/status\/1022478993717641216\/photo\/1",
//      "type":"photo",
//      "sizes":{
//      "thumb":{
//      "w":150,
//      "h":150,
//      "resize":"crop"
//      },
//      "small":{
//      "w":583,
//      "h":680,
//      "resize":"fit"
//      },
//      "medium":{
//      "w":600,
//      "h":700,
//      "resize":"fit"
//      },
//      "large":{
//      "w":600,
//      "h":700,
//      "resize":"fit"
//      }
//      }
//      }
//      ]
//    },
//    "source":"\u003ca href=\"http:\/\/twitter.com\" rel=\"nofollow\"\u003eTwitter Web Client\u003c\/a\u003e",
//    "in_reply_to_status_id":null,
//    "in_reply_to_status_id_str":null,
//    "in_reply_to_user_id":null,
//    "in_reply_to_user_id_str":null,
//    "in_reply_to_screen_name":null,
//    "user":{
//      "id":1011638875746439169,
//      "id_str":"1011638875746439169",
//      "name":"Neni the ambulance",
//      "screen_name":"neniambulance",
//      "location":"World",
//      "description":"I'm an ambulance, neni neni.  I will come and get you all. ALL! #JeSuisNENI #NENI #TEAMNENI #GONENI\nFacebook: https:\/\/t.co\/xQzvksX9BK",
//      "url":null,
//      "entities":{
//        "description":{
//          "urls":[
//          {
//          "url":"https:\/\/t.co\/xQzvksX9BK",
//          "expanded_url":"https:\/\/www.facebook.com\/nenitheambulanceofficial",
//          "display_url":"facebook.com\/nenitheambulan\u2026",
//          "indices":[
//          110,
//          133
//          ]
//          }
//          ]
//        }
//      },
//      "protected":false,
//      "followers_count":12675,
//      "friends_count":106,
//      "listed_count":18,
//      "created_at":"Tue Jun 26 15:54:38 +0000 2018",
//      "favourites_count":364,
//      "utc_offset":null,
//      "time_zone":null,
//      "geo_enabled":true,
//      "verified":false,
//      "statuses_count":52331,
//      "lang":"en",
//      "contributors_enabled":false,
//      "is_translator":false,
//      "is_translation_enabled":false,
//      "profile_background_color":"000000",
//      "profile_background_image_url":"http:\/\/abs.twimg.com\/images\/themes\/theme1\/bg.png",
//      "profile_background_image_url_https":"https:\/\/abs.twimg.com\/images\/themes\/theme1\/bg.png",
//      "profile_background_tile":false,
//      "profile_image_url":"http:\/\/pbs.twimg.com\/profile_images\/1011639519832150017\/7pIJxVjl_normal.jpg",
//      "profile_image_url_https":"https:\/\/pbs.twimg.com\/profile_images\/1011639519832150017\/7pIJxVjl_normal.jpg",
//      "profile_link_color":"1B95E0",
//      "profile_sidebar_border_color":"000000",
//      "profile_sidebar_fill_color":"000000",
//      "profile_text_color":"000000",
//      "profile_use_background_image":false,
//      "has_extended_profile":false,
//      "default_profile":false,
//      "default_profile_image":false,
//      "following":false,
//      "follow_request_sent":false,
//      "notifications":false,
//      "translator_type":"none"
//    },
//    "geo":null,
//    "coordinates":null,
//    "place":null,
//    "contributors":null,
//    "is_quote_status":false,
//    "retweet_count":253,
//    "favorite_count":921,
//    "favorited":false,
//    "retweeted":false,
//    "possibly_sensitive":false,
//    "possibly_sensitive_appealable":false,
//    "lang":"en"
//  },
//  "retweet_count":0,
//  "favorite_count":2,
//  "favorited":false,
//  "retweeted":false,
//  "possibly_sensitive":false,
//  "possibly_sensitive_appealable":false,
//  "lang":"tr"
