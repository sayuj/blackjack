# RubyConf India 2017 Contest

## BlackJack

### Play the game

```ruby
require './lib/blackjack'
game = BlackJack::Game.new
game.hit # Player's hit
game.stand # On Player's stand, dealer turns to play
game.winner
```

### Setup and Test

```ruby
bundle install
bundle exec rspec
```
