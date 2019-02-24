def dictionary
  dictionary = {
  "hello" => "hi",
  "to" => "2",
  "too" => "2",
  "too" => "2",
  "for" => "4",
  "four" => "4",
  "be" => "b",
  "you" => "u",
  "at" => "@",
  "and" => "&"
}
end

def word_substituter(tweet)
  new_tweet = tweet.split
  new_tweet.collect do |word|
    dictionary.collect do |full_word, tweet_word|
      if full_word == word.downcase
        word.replace(tweet_word)
      end
    end
  end
  new_tweet.join(" ")
end

def bulk_tweet_shortener(tweets)
  tweets.collect do |tweet|
    puts word_substituter(tweet)
  end
end

def selective_tweet_shortener(tweet)
  if tweet.size > 140
    word_substituter(tweet)
  else
    tweet
  end
end

def shortened_tweet_truncator(tweet)
  short_tweet = selective_tweet_shortener(tweet)
  if short_tweet.size > 140
    short_tweet[0...137] + "..."
  else
    short_tweet
  end
end
