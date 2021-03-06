module Wysia
  module FormHelper
      def wysia_text_area(object_name, method, options = {})

        #size = " btn-mini" if options[:size] == "mini"
        size = " btn-small" if options[:size] == "small"
        size = " btn-normal" if options[:size] == "normal"
        size = "" if options[:size].nil?
        options.delete(:size) if options[:size].present?
        text_area_id = options[:id] || "#{object_name}_#{method}"

        content = <<HTML
    <div id="#{text_area_id}_wysihtml5-toolbar" class="btn-toolbar">
        <div class="btn-group">
          <a class="btn#{size}" data-wysihtml5-command="bold"><i class="icon-bold"></i></a>
          <a class="btn#{size}" data-wysihtml5-command="italic"><i class="icon-italic"></i></a>
        </div>

        <div class="btn-group">
          <a class="btn#{size}" data-wysihtml5-command-value="h1" data-wysihtml5-command="formatBlock"><b>h1</b></a>
          <a class="btn#{size}" data-wysihtml5-command-value="h2" data-wysihtml5-command="formatBlock"><b>h2</b></a>
        </div>

        <div class="btn-group">
          <a class="btn#{size}" data-wysihtml5-command="insertOrderedList"><i class="icon-list-ol"></i></a>
          <a class="btn#{size}" data-wysihtml5-command="insertUnorderedList"><i class="icon-list-ul"></i></a>
        </div>

        <div class="btn-group">
          <a class="btn#{size}" data-wysihtml5-command="createLink"><i class="icon-link"></i></a>
        </div>

        <div class="btn-group">
          <a class="btn#{size}" data-wysihtml5-action="change_view"><i class="icon-edit"></i></a>
        </div>
        <div data-wysihtml5-dialog="createLink" class="wysihtml5-dialog" style='display: none;'>
          <label>
            Link:
            <input data-wysihtml5-dialog-field="href" value="http://" class="text">
          </label>
          <a data-wysihtml5-dialog-action="save" class="ok">OK</a>
          <a data-wysihtml5-dialog-action="cancel" class="cancel">Cancel</a>
        </div>
        <div class="clearfix"></div>
      </div>
      #{text_area object_name, method, options}
HTML

         js =<<javascript
        var editor = new wysihtml5.Editor("#{text_area_id}", { // id of textarea element
        toolbar:"#{text_area_id}_wysihtml5-toolbar", // id of toolbar element
        stylesheets:"/assets/wysiwyg/stylesheet.css", // stylesheet to be used
        parserRules: wysihtml5ParserRules // defined in parser rules set
    });
javascript


        if options[:js].present? && options[:js] == "yield"
          content_for(:javascript) do
            javascript_tag(js).html_safe
          end
        else
          content = content + javascript_tag(js)
        end

        content.html_safe
      end
    def self.included(arg)
      ActionView::Helpers::FormBuilder.send(:include, Wysia::FormBuilder)
    end

  end
end
module Wysia::FormBuilder
  # ActionPack's metaprogramming would have done this for us, if FormHelper#labeled_input
  # had been defined  at load.   Instead we define it ourselves here.
  def wysia_text_area(method, options = {})
    @template.wysia_text_area(@object_name, method, objectify_options(options))
  end
end
