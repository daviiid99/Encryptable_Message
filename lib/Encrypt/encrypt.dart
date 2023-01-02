import 'package:flutter/material.dart';

class Encrypt{
  // This class is used to encrypt a given message using a hashMap that changes a word with his own encription
  // The Map modifies a letter with his two-consecutive position in the alphabet

  Map<dynamic, dynamic> encryptMap = {
    "a" : "c",
    "b" : "d",
    "c" : "e",
    "d" : "f",
    "e" : "g",
    "f" : "h",
    "g" : "i",
    "h" : "j",
    "i" : "k",
    "j" : "l",
    "k" : "m",
    "l" : "n",
    "m" : "ñ",
    "n" : "o",
    "ñ" : "p",
    "o" : "q",
    "p" : "r",
    "r" : "t",
    "s" : "u",
    "t" : "v",
    "u" : "w",
    "v" : "x",
    "w" : "y",
    "x" : "z",
    "y" : "a",
    "z" : "b",
  };

  String encryptMessage(String message){
    // This method receives a message in string format and will return a message encrypted
    String result = "";
    message.toLowerCase(); // Switch to lowerCase

    for (String letter in message.characters){
      if (letter!="\n" && encryptMap.keys.contains(letter)){
        result += encryptMap[letter];
      } else if (letter == "\n") {
        result += "\n";
      } else {
        result += " ";
      }
    }
    print("Encrypted message : $result");
    return result;
  }
}