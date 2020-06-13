library virtual_pet;
import "dart:io";
part "pet.dart";
part "game.dart";

void main(){
  print("Welcome to Virtual Pet!\n");
  stdout.write("Please Enter A Name For Your Pet: ");
  String name = stdin.readLineSync();
  Pet pet = new Pet(name);
  Game game = new Game(pet);
  game.start();
  while (true){
    game.checkTime();
    print("Options:");
    print("1: Check on your pet");
    print("2: Feed your pet");
    print("3: Play with your pet\n");
    stdout.write("Select an option: ");
    String option = stdin.readLineSync();
    if(option == "1"){
      game.stats();
    }else if(option == "2"){
      game.feed();
    }else if(option == "3"){
      game.play();
    }

  }
}
