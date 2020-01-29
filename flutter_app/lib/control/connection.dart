class Connection {
  static String hostname() {
  // Sette a condição como True para utilizar o endereço de
  // True para o servidor de deploy, false para tese local
  if (true)
    return 'https://milkyandbeyond.herokuapp.com/';
  return 'http://192.168.1.12:3000';

  // Endereços:
  // Casa de Nelson: 'http://192.168.1.5:3000';
  // Casa de Allan: 'http://192.168.1.12:3000';
  // Shopping Jardins: 'http://172.16.5.67:3000';
  // Celular de Allan: 'http://192.168.43.163:3000';
}
}