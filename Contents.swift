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

let decoder = JSONDecoder()

decoder.dateDecodingStrategy = .formatted(twitterDateFormatter)
let tweet = try decoder.decode(Tweet.self, from: twitterData)

//func printTweet (_ tweet: Tweet, withQuoteLevel level: Int) {
//  print(String(repeating: ">", count: level),tweet.full_text)
//}
//
//func printTweet (_ tweet: QuotedTweet, withQuoteLevel level: Int) {
//  print(String(repeating: ">", count: level),tweet.full_text)
//}

func printTweet(_ tweet: TweetProtocol, withQuoteLevel level: Int = 0) {
  print(String(repeating: ">", count: level),tweet.full_text)
  if let quoted_tweet = tweet.quoted_tweet {
    printTweet(quoted_tweet, withQuoteLevel: level+1)
  }
}

printTweet(tweet)
