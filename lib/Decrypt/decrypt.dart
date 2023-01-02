import 'package:flutter/material.dart';

class Decrypt{

  Map<dynamic, dynamic> decryptMap = {
    "c" : "a",
    "0" : "á",
    "d" : "b",
    "e" : "c",
    "1" : "é",
    "f" : "d",
    "g" : "e",
    "h" : "f",
    "i" : "g",
    "2" : "í",
    "j" : "h",
    "k" : "i",
    "l" : "j",
    "m" : "k",
    "n" : "l",
    "ñ" : "m",
    "o" : "n",
    "3" : "ó",
    "p" : "ñ",
    "q" : "o",
    "r" : "p",
    "?" : "q",
    "t" : "r",
    "u" : "s",
    "4" : "ú",
    "v" : "t",
    "w" : "u",
    "x" : "v",
    "y" : "w",
    "z" : "x",
    "a" : "y",
    "b" : "z",
  };

  String decryptMessage(String encryptMessage){
    // This method receives an encrypted message and returns a decrypted message :)
    String result = "";

    for (String letter in encryptMessage.characters){
      if (letter != "\n" && decryptMap.keys.contains(letter)){
        result += decryptMap[letter];
      } else if (letter == "\n"){
        result += "\n";
      } else {
        result += " ";
      }
    }
    return result;
  }

}