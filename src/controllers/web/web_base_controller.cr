# common class to all web controllers
module Web
  class WebBaseController < BaseController
    include Macros::RenderHTMLViews
  end
end
