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
    if (password.length < 8)
      return 'A senha deve ter pelo menos 8 caracteres.';  
    if (!passwordRegExp.hasMatch(password))
      return 'Digite uma senha válida.'; 
    return null; 
  }

  static String validateNickname(String nickname) {
    final nicknameRegExp = RegExp(r'^[a-zA-Z0-9_ ]{3,50}$');
    if (nickname.isEmpty)
      return 'Digite um nome de usuário.'; 
    if (nickname.length < 3)
      return 'Nome de usuário muito curto.'; 
    if (nickname.length > 50)
      return 'Nome de usuário muito longo.'; 
    if (!nicknameRegExp.hasMatch(nickname)) 
      return 'Use apenas alfanumérico, underline e espaços.'; 
    return null;    
  }

  static String validateEntityName(String name) {
    final nameRegExp = RegExp(r'^[a-zA-Z0-9_ ]{3,50}$');
    if (name.isEmpty)
      return 'Digite um nome.'; 
    if (name.length < 3)
      return 'Nome muito curto.'; 
    if (name.length > 50)
      return 'Nome muito longo.'; 
    if (!nameRegExp.hasMatch(name))
      return 'Use apenas alfanumérico, underline e espaços.';
    return null; 
  }

  static String validateLongString(String name) {
    final regEx = RegExp(r'^[a-zA-Z0-9_ \%\:]*$'); 
    if (name.length > 512)
      return 'Composição muito longa.'; 
    if (!regEx.hasMatch(name))
      return 'Entrada inválida.'; 
    return null; 
  }

  static String validateNumber(String number) {
    final idRegExp = RegExp(r'^[1-9][0-9]*$'); 
    if (number[0] == 0)
      return 'O número não pode começar com 0.'; 
    if (!idRegExp.hasMatch(number))
      return 'Entrada inválida.';
    return null; 
  }
}