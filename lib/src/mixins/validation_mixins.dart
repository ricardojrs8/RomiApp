class ValidationMixins{

  String validateEmail(String value){
    if(!value.contains('@'))
    return "Email invalido";
    return null; // indicamos que nuestro texto es valido

  }



   String validatePassword(String value){
    if(value.length<6)
    return "Contraseña invalido";
    return null;

  }

  String validateEdad(String value){
    if(value.length<2)
    return "Edad invalida";
    return null;

  }
    String validateNombre(String value){
  
    return null;

  }

  String validateNombre_galeri(String value){
     if(value.length<3)
    return "Ingrese el nombre de la foto";
    return null;
  }
    String comentario(String value){
     if(value.length<30)
    return "El comentario solo puede tener mas de  30 caracteres";
    return null;
  }


}