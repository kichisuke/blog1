module ApplicationHelper
  def default_meta_tags
    {
      title: 'AnyTopicsJapan',
      reverse: true,
      separator: '|',
      description: 'Need information from Japan? AnyTopicsJapan shares realtime info from Japan.',
      keywords: 'Japan, Japanese, Japanese blog',
      canonical: request.original_url,
      noindex: ! Rails.env.production?,
      icon: image_url("logo.png"),
      og: {
        site_name: :site,
        title: :title,
        description: :description, 
        type: 'website',
        url: request.original_url,
        image: image_url('logo.png'),
        locale: 'en_US',
      },
      twitter: {
        card: 'summary',
        site: '@AnyTopicsJapan',
        image: image_url('logo.png'),
        width: 100,
        height: 100
      }
    }
  end
end
