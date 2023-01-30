module ApplicationHelper
  def active_class(link_path)
    current_page?(link_path) ? "active" : ""
  end

  def flash_class(level)
    case level
      when 'notice' then "alert alert-info"
      when 'success' then "alert alert-success"
      when 'error' then "alert alert-danger"
      when 'alert' then "alert alert-warning"
    end
  end

  def logo_boolean(boolean)
    if boolean
      tag.span class: 'badge rounded-pill bg-success' do
        fa_icon('check')
      end
    else
      tag.span class: 'badge rounded-pill bg-danger' do
        fa_icon('times')
      end
    end
  end

  def handle_none(value)
    if value.present?
      yield
    else
      content_tag :span, "Aucune donnée", class: "text-muted"
    end
  end

  def fa_icon(names = "flag", original_options = {})
    options = original_options.deep_dup
    classes = ["fa"]
    classes.concat Private.icon_names(names)
    classes.concat Array(options.delete(:class))
    text = options.delete(:text)
    right_icon = options.delete(:right)
    icon = content_tag(:i, nil, options.merge(class: classes))
    Private.icon_join(icon, text, right_icon)
  end

  def fa_stacked_icon(names = "flag", original_options = {})
    options = original_options.deep_dup
    classes = Private.icon_names("stack").concat(Array(options.delete(:class)))
    base_names = Private.array_value(options.delete(:base) || "square-o").push("stack-2x")
    names = Private.array_value(names).push("stack-1x")
    base = fa_icon(base_names, options.delete(:base_options) || {})
    icon = fa_icon(names, options.delete(:icon_options) || {})
    icons = [base, icon]
    icons.reverse! if options.delete(:reverse)
    text = options.delete(:text)
    right_icon = options.delete(:right)
    stacked_icon = content_tag(:span, safe_join(icons), options.merge(class: classes))
    Private.icon_join(stacked_icon, text, right_icon)
  end

  module Private
    extend ActionView::Helpers::OutputSafetyHelper

    def self.icon_join(icon, text, reverse_order = false)
      return icon if text.blank?

      elements = [icon, ERB::Util.html_escape(text)]
      elements.reverse! if reverse_order
      safe_join(elements, " ")
    end

    def self.icon_names(names = [])
      array_value(names).map { |n| "fa-#{n}" }
    end

    def self.array_value(value = [])
      value.is_a?(Array) ? value : value.to_s.split(/\s+/)
    end
  end
end
