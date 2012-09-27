# Wysia

A WYSIWYG for textarea to work with Rails 3 FormBuilders

#Includes
This Gem uses
- WYSIHTML5 http://xing.github.com/wysihtml5/ <- this actually does all the hard work
- Font Awesome http://fortawesome.github.com/Font-Awesome/ <- used for scaling icons wich are AWESOME

# Build
gem build wysia.gemspec

# Installation
gem install <dir>/wysia-0.0.2.gem

# Example
gem install /Users/johnny/code/wysia/wysia-0.0.2.gem

# Requirements
# For Js
//= require wysia.js

# For css
@import "wysia.scss";

# Yield in application.html.haml
yield :javascript



# Usage
<%= f.wysia_text_area :about %>

small size
<%= f.wysia_text_area :about, size: "small" %>
