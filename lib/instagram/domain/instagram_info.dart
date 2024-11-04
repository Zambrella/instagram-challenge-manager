class InstagramInfo {
  static Uri redirectUri = Uri.parse('https://challenge.stashhubapp.com/');
  static String appId = '1085478196918836';
  // TODO: Pass in the above as parameters
  static Uri initialUrl = Uri.parse(
    'https://www.instagram.com/oauth/authorize?enable_fb_login=0&force_authentication=1&client_id=1085478196918836&redirect_uri=https://challenge.stashhubapp.com/&response_type=code&scope=instagram_business_basic%2Cinstagram_business_manage_messages%2Cinstagram_business_manage_comments%2Cinstagram_business_content_publish',
  );
}
