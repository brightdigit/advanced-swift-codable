import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()

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

//func printTweet (_ tweet: Tweet, withQuoteLevel level: Int) {
//  print(String(repeating: ">", count: level),tweet.full_text)
//}
//
//func printTweet (_ tweet: QuotedTweet, withQuoteLevel level: Int) {
//  print(String(repeating: ">", count: level),tweet.full_text)
//}

func printTweet(_ tweet: TweetProtocol, withQuoteLevel level: Int = 0) {
  print(String(repeating: ">", count: level),tweet.fullText)
  if let quotedTweet = tweet.quotedTweet {
    printTweet(quotedTweet, withQuoteLevel: level+1)
  }
}

let tweet = try! TwitterDecoder.shared.tweet(fromUrl: twitterURL)

printTweet(tweet)
