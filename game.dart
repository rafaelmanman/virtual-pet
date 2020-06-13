part of virtual_pet;

class Game{
  Pet pet;
  DateTime startTime;
  DateTime lastFeedTime;
  DateTime lastPlayTime;
  int nextExpectedFeedTime;
  int nextExpectedPlayTime;

  Game(Pet pet){
    this.pet = pet;
    this.nextExpectedFeedTime = 20;
    this.nextExpectedPlayTime = 20;
  }
  
  void checkTime(){
    DateTime currentTime = new DateTime.now();
    Duration nextFeed = new Duration(seconds: nextExpectedFeedTime);
    if(currentTime.difference(this.lastFeedTime) > nextFeed){
      this.decreaseFull();
    }
    Duration nextPlay = new Duration(seconds: nextExpectedPlayTime);
    if(currentTime.difference(this.lastPlayTime) > nextPlay){
      this.decreaseHappy();
    }
  }
  
  void start(){
    this.startTime = new DateTime.now();
    this.lastPlayTime = startTime;
    this.lastFeedTime = startTime;
  }

  void decreaseFull(){
    if(this.pet.full > 0){
      this.pet.full -= 1;
    }else{
     print("${this.pet.name} is really hungry!\n");
    }
    this.nextExpectedFeedTime += 20;
  }

  void decreaseHappy(){
    if(this.pet.happy > 0){
      this.pet.happy -= 1;
    }else{
     print("${this.pet.name} is really bored!\n");
    }
    this.nextExpectedPlayTime += 20;
  }
  
  void feed(){
    this.lastFeedTime = new DateTime.now();
    if(this.pet.full<5){
      this.pet.full += 1;
    }else{
      print("${this.pet.name} is already full!\n");
    }
    // pet.full = pet.full<5 ? pet.full+1 : pet.full;
  }

  void play(){
    this.lastPlayTime = new DateTime.now();
    if(this.pet.happy<5){
      this.pet.happy += 1;
    }else{
      print("${this.pet.name} is too tired to play more!\n");
    }
  }

  void stats(){
    print("Name: ${this.pet.name}");
    print("Hunger: ${this.pet.full}");
    print("Happiness: ${this.pet.happy}");
  }
}
