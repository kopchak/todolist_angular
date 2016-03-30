Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "1666440416952485", "3ad2811de736908fc229bfc9f3836479",
  scope: 'email', info_fields: 'email, name'
end
