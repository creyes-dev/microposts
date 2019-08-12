module UsersHelper

  # Devuelve el Gravatar (http://gravatar.com/) para el usuario que corresponda.
  def gravatar_for(user, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://www.gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
    image_tag(gravatar_url, alt: 'gravatar image')
  end
end
