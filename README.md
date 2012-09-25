# Wysia

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
<%= wysia_text_area("id-name", 'id-element').html_safe %>

small size
<%= wysia_text_area("id-name", 'id-element', 'small').html_safe %>
