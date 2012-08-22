require "wysia/version"
require "wysia/wysia_form_helper"

module Wysia

  module Rails
    class Engine < ::Rails::Engine
    end
  end
end


class ActionView::Base
  include Wysia::FormHelper
end