import UIKit
import PlaygroundSupport

guard let twitterURL = Bundle.main.url(forResource: "twitter", withExtension: "json")  else {
  PlaygroundPage.current.finishExecution()
}

guard let twitterData = try? Data(contentsOf: twitterURL) else {
  PlaygroundPage.current.finishExecution()
}

let decoder = JSONDecoder()

let tweet = try decoder.decode(Tweet.self, from: twitterData)

func printTweet (_ tweet: Tweet) {
  print(tweet.full_text)
  if let quoted_status = tweet.quoted_status {
    printTweet(quoted_status)
  }
}

func printTweet (_ tweet: QuotedTweet) {
  print(">",tweet.full_text)
}


printTweet(tweet)
