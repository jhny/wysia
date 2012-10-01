# Wysia

A WYSIWYG for textarea to work with **Rails 3** FormBuilders

This Gem uses
- [WYSIHTML5][1] <- this actually does all the hard work
- [Font Awesome][2] <- used for scaling icons wich are AWESOME
                                                            
[1]:http://xing.github.com/wysihtml5/
[2]:http://fortawesome.github.com/Font-Awesome/

## Installation

In your `Gemfile`, add the following dependencies:
```ruby
gem 'wysia', :git => 'https://github.com/jhny/wysia.git'
```
Run:
```unix
$ bundle install
```
## Usage
Include the Javascript (wysihtm5) into your `application.js`:
```ruby
//= require wysia.js
```
Include de css into your `applications.css`
```sass
@import "wysia.scss";
```
In your forms use the `wysia_text_area` helper

### default usage
```ruby
= form_for @user do |f|
  = f.wysia_text_area :about
```
### Configuration
#### Available options: 
- All the usual options for a `text_area` can be used.
- `size`: `normal`, `small` or `mini`. Affects the button size of the toolbar. `normal` is default.
- `js`: `inline` or `yield`. Yields the javascript to a block called `:javascript` or its placed inline. `inline` is default.

using the options:
```ruby
= f.wysia_text_area :about, {:class => "shaded comment grey remark", :rows => 3, :id => "about_#{@user.id}_remark", :size => "small"}
```

1. If you use `js: "inline"` as option, the javascript is yielded to a block called `:javascript`. In your layout or view use:
```ruby
yield :javascript
```

2. If you have multiple `wysia_text_area` elements in a single page, you need to provide a ID to the options to make sure they are distinguisable for the javascript.

## Contribute
### Edit gem
Instead of pointing to the git repo, point to the local source `#gem 'wysia', :path =>  "/home/user/src/wysia"`
