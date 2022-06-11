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

  def default_meta_tags
    {
        site: 'KARALIS',
        title: 'KARALIS',
        reverse: true,
        charset: 'utf-8',
        description: 'KARALISは、自分の好きな曲でリストを作り仲間と共有できるアプリです。URLを共有するだけで好きな曲を共有できます。',
        keywords: 'カラオケ',
        canonical: request.original_url,
        separator: '|',
        icon: [
        { href: image_url('favicon.ico') },
      ],
      og: {
        site_name: 'KARALIS',
        title: 'KARALIS',
        description: 'KARALISは、自分の好きな曲でリストを作り仲間と共有できるアプリです。URLを共有するだけで好きな曲を共有できます。', 
        type: 'website',
        url: request.original_url,
        image: image_url('og_image.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
      }
    }
  end
end

