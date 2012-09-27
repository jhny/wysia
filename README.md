# Wysia

A WYSIWYG for textarea to work with Rails 3 FormBuilders

This Gem uses
- [WYSIHTML5][1] <- this actually does all the hard work
- [Font Awesome][2] <- used for scaling icons wich are AWESOME
                                                            - 
[1]:http://xing.github.com/wysihtml5/
[2]:http://fortawesome.github.com/Font-Awesome/

## Installation

In your `Gemfile`, add the following dependencies:

    gem 'wysia', :git => 'https://github.com/jhny/wysia.git'

Run:

    $ bundle install

Include the Javascript (wysihtm5) into your `application.js`:

    //= require wysia.js

Include de css into your `applications.css`

    @import "wysia.scss";

TODO: this should always be inline?

    yield :javascript

## Usage
In your views simply use the `wysia_text_area` helper
default:
<%= f.wysia_text_area :about %>

TEST:small size:
<%= f.wysia_text_area :about, size: "small" %>

You can add options:
<%= f.wysia_text_area :about, size: "small", rows: 5, class: "textarea" %>

## Contribute
Instead of pointing to the git repo, point to the local source `#gem 'wysia', :path =>  "/home/user/src/wysia"`
