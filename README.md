
![vanitas](SK-A-1686.jpg)

Vanitas stillife by N.L. Peschier, 1660.

# Rijksbot

[Rijksbot](https://twitter.com/Rijks_bot/with_replies) is a twitter bot that responds to mentions with an image from the [Rijksmuseum](https://www.rijksmuseum.nl/), using the tweet as a serch term.

This project was started at a Rails Girls Berlin Code & Cake event in 2017.

# Contributing
We gladly accept contributions to this project. Get in touch with thoughts and ideas.

#### Add your Rijksmuseum API key:
Add an account and ask for a  [Rijksmuseum API](https://www.rijksmuseum.nl/en/api) Key. You will recieve the key via email. It will only take you few minutes.

Add a .env file in the root file with your API key:

\# .env
```console
RIJKSMUSEUM_API_KEY=ZuSiGYl9 # without quotes, this is an example & fake key
```

#### Make all your tests green/passing:


1. install gems
```
bundle
```

2. Change :record => :none to :once to record new episodes.
\# test/support/vcr.rb

```ruby
config.default_cassette_options = { allow_unused_http_interactions: false, :record => :once }
```

3. run:
```console
rake test
```

4.  change 'test/support/vcr.rb' again to
```ruby
:record => :none
```
or rather:
```console
git checkout test/support/vcr.rb
```

5. check the failing test, and change the timestamp to the actual one.
Example:

\# failing test output:
```console
--- expected
+++ actual
@@ -1 +1 @@
-"Wed, 02 May 2018 22:14:01 GMT"
+"Tue, 22 May 2018 10:27:02 GMT"
```

\# rijksmus-api/client_test.rb:18

```ruby
subject.images.headers["date"].must_equal "Tue, 22 May 2018 00:00:29 GMT"
```

6. Git add and commit your changes. Example:
```ruby
git add . # check your changes before with git diff and do the propper cleaning/commits.
git commit -m 'update timestamp client_test'
```

7. Congratulations! All tests should be green/passing and you are start doing your first contribution!

# License
MIT
