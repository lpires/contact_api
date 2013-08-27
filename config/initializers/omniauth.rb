Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
           GOOGLE_CLIENT_ID,
           GOOGLE_CLIENT_SECRET,
           {
               access_type: 'offline',
               scope: 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile https://www.google.com/m8/feeds',
               redirect_uri: 'http://localhost:3000/auth/google_oauth2/callback'
           }
end