import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> loginWithEmailPassword(String email, String password) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = userCredential.user;
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        // 이메일 또는 비밀번호가 올바르지 않을 경우에 대한 처리
        print('이메일 또는 비밀번호가 올바르지 않습니다.');
      } else {
        // 기타 에러 처리
        print('로그인 중 오류가 발생했습니다: ${e.code}');
      }
      return null;
    }
  }
}
