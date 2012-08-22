module Wysia
  module FormHelper
      def wysia_text_area(element_id, size = nil, is_inline = false)

        size = " btn-mini" if size == "mini"
        size = " btn-small" if size == "small"
        size = "" if size.nil?


        content = <<HTML
    <div id="wysihtml5-toolbar" style="display: none;" class="btn-toolbar">
        <div class="btn-group">
          <a class="btn#{size}" data-wysihtml5-command="bold"><i class="icon-bold"></i></a>
          <a class="btn#{size}" data-wysihtml5-command="italic"><i class="icon-italic"></i></a>
        </div>

        <!-- Some wysihtml5 commands require extra parameters -->
        <div class="btn-group">
          <a class="btn#{size}" data-wysihtml5-command-value="h1" data-wysihtml5-command="formatBlock"><b>h1</b></a>
          <a class="btn#{size}" data-wysihtml5-command-value="h2" data-wysihtml5-command="formatBlock"><b>h2</b></a>
        </div>

        <div class="btn-group">
          <a class="btn#{size}" data-wysihtml5-command="insertOrderedList"><i class="icon-list-ol"></i></a>
          <a class="btn#{size}" data-wysihtml5-command="insertUnorderedList"><i class="icon-list-ul"></i></a>
        </div>

        <div class="btn-group">
          <!-- Some wysihtml5 commands like 'createLink' require extra paramaters specified by the user (eg. href) -->
          <a class="btn#{size}" data-wysihtml5-command="createLink"><i class="icon-link"></i></a>
        </div>

        <div class="btn-group">
          <a class="btn#{size}" data-wysihtml5-action="change_view"><i class="icon-edit"></i></a>
        </div>

        <div data-wysihtml5-dialog="createLink" style="display: none;">
          <label>
            Link:
            <input data-wysihtml5-dialog-field="href" value="http://" class="text">
          </label>
          <a data-wysihtml5-dialog-action="save">OK</a> <a data-wysihtml5-dialog-action="cancel">Cancel</a>
        </div>
      </div>
      <textarea id="#{element_id}" name="#{element_name}" placeholder="Enter your text ..."></textarea>
HTML

        #content_for(:javascript) do
         js =<<javascript
        var editor = new wysihtml5.Editor("#{element_id}", { // id of textarea element
        toolbar:"wysihtml5-toolbar", // id of toolbar element
        stylesheets:"assets/wysiwyg/stylesheet.css", // id of toolbar element
        parserRules:wysihtml5ParserRules // defined in parser rules set
    });
javascript


        if is_inline
          content = content + javascript_tag(js)
        else
          content_for(:javascript) do
            js
          end
        end

        content
      end
    end
end
