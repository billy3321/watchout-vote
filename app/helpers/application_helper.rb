module ApplicationHelper
  def default_meta_tags
    {
      separator: "｜",
      site: "立委求職中",
      reverse: true,
      description: "",
      keywords: "",
      og: {
        title: "立委求職中",
        description: "",
        type: "website",
        image: "#{Setting.url.protocol}://#{Setting.url.host}/images/logo.png",
        site_name: "" }
    }
  end

  def admin_meta_tags
    {
      separator: "-",
      site: "立委求職中網站管理後台",
      og: {
        image: "#{Setting.url.protocol}://#{Setting.url.host}/images/logo.png"
      }
    }
  end

  def display_shorter(str, length, additional = "...")
    length = length * 2
    text = Nokogiri::HTML(str).text
    if text.display_width >= length
      additional_text = Nokogiri::HTML(additional).text
      new_length = length - additional_text.display_width
      short_string = text[0..new_length]
      while short_string.display_width > new_length
        short_string = short_string[0..-2]
      end
      short_string + additional
    else
      text
    end
  end
end
