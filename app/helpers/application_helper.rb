module ApplicationHelper
   def page_title(page_title = ' ')
      base_title = 'KARALIS'
      
      page_title.empty? ? base_title : page_title + ' | ' + base_title
   end
end
