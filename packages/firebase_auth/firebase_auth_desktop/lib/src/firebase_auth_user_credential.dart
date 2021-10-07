part of firebase_auth_desktop;

/// Dart delegate implementation of [UserCredentialPlatform].
class UserCredential extends UserCredentialPlatform {
  // ignore: public_member_api_docs
  UserCredential(
    FirebaseAuthPlatform auth,
    auth_dart.UserCredential ipUserCredential,
  ) : super(
          auth: auth,
          additionalUserInfo: AdditionalUserInfo(
            isNewUser: ipUserCredential.additionalUserInfo!.isNewUser,
            profile: ipUserCredential.additionalUserInfo!.profile,
            providerId: ipUserCredential.additionalUserInfo!.providerId,
            username: ipUserCredential.additionalUserInfo!.username,
          ),
          credential: AuthCredential(
            providerId: ipUserCredential.credential!.providerId,
            signInMethod: ipUserCredential.credential!.signInMethod,
          ),
          user: User(auth, ipUserCredential.user!),
        );
}