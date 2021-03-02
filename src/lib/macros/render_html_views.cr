module Macros
  module RenderHTMLViews
    # render view with layout
    macro render_view(filename, layout = "main")
      render "src/views/#{{{filename}}}.html.ecr", "src/views/layouts/#{{{layout}}}.html.ecr"
    end

    # render view without layout
    # macro render_view(filename)
    #   render "src/views/#{{{filename}}}.ecr"
    # end

    # to render component inside any view (like rails partials)
    macro render_component(filename)
      render "src/components/#{{{filename}}}.html.ecr"
    end
  end
end
