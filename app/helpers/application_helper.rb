module ApplicationHelper
  def page_title(page_title = ' ')
    base_title = 'KARALIS'

    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end

  def full_description(page_description = '')
    base_description = "KARALISは、自分の好きな曲でリストを作り仲間と共有できるアプリです。URLを共有するだけで好きな曲を共有できます。"
    page_description.empty? ? base_description : page_description
  end
  
end
