class Validator {

  static String validateEmail(String email) {
    final emailRegExp = RegExp(r'^[a-zA-Z\._0-9]+@[a-zA-Z\_0-9]+\.[a-zA-Z0-9\.]+$');
    if (email.isEmpty) 
      return 'Digite seu email.'; 
    if (!emailRegExp.hasMatch(email))
      return 'Digite um email válido.';
    return null; 
  }

  static String validatePassword(String password) {
    final passwordRegExp = RegExp(r'.'); 
    if (password.isEmpty) 
      return 'Digite sua senha.'; 
    if (!passwordRegExp.hasMatch(password))
      return 'Digite uma senha válida.'; 
    return null; 
  }

  static String validateNickname(String nickname) {
    final nicknameRegExp = RegExp(r'^[a-zA-Z0-9_]{3,50}$');
    if (nickname.isEmpty)
      return 'Digite um nome de usuário.'; 
    if (nickname.length < 3)
      return 'Nome de usuário muito curto.'; 
    if (nickname.length > 50)
      return 'Nome de usuário muito longo.'; 
    if (!nicknameRegExp.hasMatch(nickname)) 
      return 'Apenas alfanumérico e underline.'; 
    return null;    
  }
}