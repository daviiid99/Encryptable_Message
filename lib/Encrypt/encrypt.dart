import 'package:flutter/material.dart';

class Encrypt{
  // This class is used to encrypt a given message using a hashMap that changes a word with his own encription
  // The Map modifies a letter with his two-consecutive position in the alphabet

  Map<dynamic, dynamic> encryptMap = {
    "a" : "c",
    "á" : "0",
    "b" : "d",
    "c" : "e",
    "d" : "f",
    "e" : "g",
    "é" : "1",
    "f" : "h",
    "g" : "i",
    "h" : "j",
    "i" : "k",
    "í" : "2",
    "j" : "l",
    "k" : "m",
    "l" : "n",
    "m" : "ñ",
    "n" : "o",
    "ñ" : "p",
    "o" : "q",
    "ó" : "3",
    "p" : "r",
    "q" : "?",
    "r" : "t",
    "s" : "u",
    "t" : "v",
    "u" : "w",
    "ú" : "4",
    "v" : "x",
    "w" : "y",
    "x" : "z",
    "y" : "a",
    "z" : "b",
  };

  String encryptMessage(String message){
    // This method receives a message in string format and will return a message encrypted
    String result = "";

    for (String letter in message.characters){
      String char = "";
      if (letter != "\n" && letter != "")
        char  = letter.toLowerCase();

      if (char!="\n" && encryptMap.keys.contains(char)){
        result += encryptMap[char];
      } else if (char == "\n") {
        result += "\n";
      } else {
        result += " ";
      }
    }
    print("Encrypted message : $result");
    return result;
  }
}