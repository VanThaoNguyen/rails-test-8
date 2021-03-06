require 'will_paginate/view_helpers/link_renderer'
require 'will_paginate/view_helpers/action_view'

WillPaginate.per_page = 4

if defined?(WillPaginate)
  module WillPaginate
    module ActiveRecord
      module RelationMethods
        def per(value = nil) per_page(value) end
        def total_count() count end
      end
    end

    module CollectionMethods
      alias_method :num_pages, :total_pages
    end

    module ActionView
      def will_paginate(collection = nil, options = {})
        options[:renderer] ||= BootstrapLinkRenderer
        super.try :html_safe
      end

      class BootstrapLinkRenderer < LinkRenderer
        protected

        def html_container(html)
          ul = tag :ul, html, container_attributes
          tag :div, ul, :class => 'pagination-container'
        end

        def page_number(page)
          tag :li, link(page, page, :rel => rel_value(page)), :class => ('active' if page == current_page)
        end

        def previous_or_next_page(page, text, classname)
          tag :li, link(text, page || '#'), :class => [classname[0..3], classname, ('disabled' unless page)].join(' ')
        end

        def gap
          tag :li, link(super, '#'), :class => 'disabled'
        end
      end
    end
  end
end
