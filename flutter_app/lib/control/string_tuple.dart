// Essa classe é utilizada por ListAll.  
class StringTuple {
  // Indica o tipo da entidade que será listado.
  // Ex: 'galaxy', 'star', 'planet', 'satellite'...
  String _controlName; 

  // A string que será mostrada no layout da tela.
  // Ex: 'Galáxia', 'Estrela', 'Planeta', 'Satélite'... 
  String _viewName; 

  // Artigo que indica o gênero da palavra. 
  // Ex: 'a', 'o'
  String _article;


  StringTuple(this._controlName, this._viewName, this._article); 

  String get controlName => this._controlName; 
  String get viewName => this._viewName;
  String get article => this._article; 

  static StringTuple makeStringTupleFor(String entityType) {
    switch (entityType) {
      case 'colored_star':
        return StringTuple('colored_star', 'Estrela', 'a'); 
      case 'galaxy':
        return StringTuple('galaxy', 'Galáxia', 'a'); 
      case 'planet':
        return StringTuple('planet', 'Planeta', 'o'); 
      case 'satellite':
        return StringTuple('satellite', 'Satélite', 'o'); 
      case 'star':
        return StringTuple('star', 'Estrela', 'a'); 
      case 'system':
        return StringTuple('system', 'Sistema', 'o'); 
      default:
        return StringTuple('error', 'Erros', 'o'); 
    }
  }
}