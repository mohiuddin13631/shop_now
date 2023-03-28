import 'dart:io';

void main(){
  // var h = Human();
  // h.display("Akash");

  var name = Map();
  name["frist name"] = "Akash";
  name['last name'] = "khan";
  print(name);
}

class Human{
  Human(){
    stdout.write("I am human");
  }
  void display(String name){
    print("\nI am $name");
  }




}