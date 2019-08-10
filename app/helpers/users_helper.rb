module UsersHelper

  # Devuelve el Gravatar (http://gravatar.com/) para el usuario que corresponda.
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://www.gravatar.com/avatar/#{gravatar_id}.png"
    image_tag(gravatar_url, alt: 'gravatar image')
  end
end
