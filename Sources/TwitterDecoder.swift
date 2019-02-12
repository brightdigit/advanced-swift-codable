import Foundation

public struct TwitterDateFormatter {
  public static let formatString = "eee MMM dd HH:mm:ss ZZZZ yyyy"
  
  public static let shared = {
    dateFormat -> DateFormatter in
    let formatter = DateFormatter ()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.dateFormat = dateFormat
    return formatter
  }(formatString)
  
  private init() {
    
  }
}

public struct TwitterDecoder {
  public static let jsonDecoder = {
    dateFormatter -> JSONDecoder in
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .formatted(dateFormatter)
    return decoder
  }(TwitterDateFormatter.shared)
  
  public static let shared = TwitterDecoder.init()
  
  public func tweet(fromUrl url: URL) throws -> Tweet {
    let twitterData = try Data(contentsOf: url)
    return try TwitterDecoder.jsonDecoder.decode(Tweet.self, from: twitterData)
  }
}
