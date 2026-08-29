/// Google Sign-In configuration for Firebase Auth credentials.
///
/// [iosClientId] is the iOS OAuth client from `GoogleService-Info.plist`.
/// [serverClientId] must be the Web client ID from `google-services.json`
/// (oauth_client with client_type 3) so Firebase receives an `idToken`.
class GoogleAuthConfig {
  const GoogleAuthConfig._();

  static const String iosClientId =
      '887200413919-bnkgjmgdi1uh7bj5rmrkvo2jl3rer28j.apps.googleusercontent.com';

  static const String serverClientId =
      '887200413919-kntlo0kr0eun2q6kk9f7eh40u0isjsii.apps.googleusercontent.com';
}
