// Essa classe é utilizada por ListAll.  
class StringTuple {
  // Indica o tipo da entidade que será listado.
  // Ex: 'galaxy', 'star', 'planet', 'satellite'...
  String _controlName; 

  // A string que será mostrada no layout da tela.
  // Ex: 'Galáxias', 'Estrelas', 'Planetas', 'Satélites'... 
  String _viewName; 

  StringTuple(this._controlName, this._viewName); 

  String get controlName => this._controlName; 
  String get viewName => this._viewName; 

  static StringTuple makeStringTupleFor(String entityType) {
    switch (entityType) {
      case 'colored_star':
        return StringTuple('colored_star', 'Estrelas'); 
      case 'galaxy':
        return StringTuple('galaxy', 'Galáxias'); 
      case 'planet':
        return StringTuple('planet', 'Planetas'); 
      case 'satellite':
        return StringTuple('satellite', 'Satélites'); 
      case 'star':
        return StringTuple('star', 'Estrelas'); 
      case 'system':
        return StringTuple('system', 'Sistemas'); 
      default:
        return StringTuple('error', 'Erros'); 
    }
  }
}