module ApplicationHelper
  def page_title(page_title = ' ')
    base_title = 'KARALIS'

    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end

  def full_description(page_description = '')
    base_description = "KARALISは、自分の好きな曲でリストを作り仲間と共有できるアプリです。URLを共有するだけで好きな曲を共有できます。"
    page_description.empty? ? base_description : page_description
  end

  def og_description(page_description = '')
    base_description = "KARALISは、自分の好きな曲でリストを作り仲間と共有できるアプリです。"
    page_description.empty? ? base_description : page_description
  end

  def og_image(page_image = '')
    base_image = "http://www.playlist-karalis.com/assets/og_image.png"
    page_image.empty? ? base_image : page_image
  end

  def show_date(time)
    return time unless time
    time.strftime('%Y/%m/%d')
  end

  def show_at(time)
    return time unless time
    time.strftime('%Y/%m/%d /%H:%M')
  end
end

