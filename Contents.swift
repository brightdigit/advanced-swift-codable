import UIKit
import PlaygroundSupport

guard let twitterURL = Bundle.main.url(forResource: "twitter", withExtension: "json")  else {
  PlaygroundPage.current.finishExecution()
}

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

let tweet = try! TwitterDecoder.shared.tweet(fromUrl: twitterURL)

printTweet(tweet)
