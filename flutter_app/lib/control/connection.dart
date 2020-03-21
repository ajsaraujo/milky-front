class Connection {
  static String hostname() {
    var location = 'cloud'; 
    
    switch (location) {
      case 'cloud':
        return 'https://milkyandbeyond.herokuapp.com'; 
      case 'nelson':
        return 'http://192.168.1.5:3000'; 
      case 'allan':
        return 'http://192.168.1.12:3000';
      case 'allanPhone':
        return 'http://172.16.5.67:3000'; 
      case 'shoppingJardins':
        return 'http://172.16.5.67:3000';
    }
  }
}