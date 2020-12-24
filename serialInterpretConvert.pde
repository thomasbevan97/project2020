import processing.serial.*;
import java.text.*;
import java.util.*;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;

Serial mySerial;

String myString = null;

int nl = 10;
int spaceCounter = 0; // Counter for Record and Exit trigger

String myVal;
Table table;
PrintWriter output;

void setup()
{
  //size(200,400);
  String myPort = Serial.list()[3]; 

  mySerial = new Serial(this, myPort, 9600);
 output = createWriter("positions.txt");
   background(0);


}
 void draw()
 {
  while(mySerial.available() > 0){
    myString = mySerial.readStringUntil(nl);
    if((myString != null) && (spaceCounter != 0)){
      myVal = myString;
    output.println(myVal);
    }
   println(myString);
  }
}
void keyPressed() {
  if ( key == 32  ){

  // First click starts recording to txt file
  if(spaceCounter == 0){
    background(205,0,0);
    spaceCounter += 1;
    } else { //Second click finishes file and closes program
    background(0,0,205);
      output.flush();  // Writes the remaining file
      output.close();  // Finishes the file
      exit();  // Stops the program
    }
  }
}
