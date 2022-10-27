import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

//class that's going to hold canister: actor
//a canister->
actor DBank{
  //stable makes the variable orthogonaly persistent
  stable var currentVal: Float = 300;

  //to replace value :=
  currentVal := 300;
  //debug module to print stuff
  Debug.print(debug_show(currentVal));

  stable var startTime = Time.now();
  startTime := Time.now();
  Debug.print(debug_show(startTime));

  let id = 231243454;

  

  //Private function: func
  //public function: public func
  public func topUp(amount: Float){
    currentVal += amount;
    Debug.print(debug_show(currentVal))
  };

  // topUp();

  public func withdraw(amount: Float){
    let tempVal: Float = currentVal-amount;
    if(tempVal>=0){
    currentVal-=amount;
    Debug.print(debug_show(currentVal));}
    else{Debug.print("Invalid transaction :(")}
  };

  //creating query method
  public query func checkBalance(): async Float{
    return currentVal;
  };

  public func compound(){
    let currentTime = Time.now();
    let timeElapsedS = (currentTime - startTime)/1000000000;
    currentVal := currentVal*(1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  };
}