/*
oscP5, download library here
http://www.sojamo.de/oscP5
*/
 
import oscP5.*;
import netP5.*;

// change hostname
String rpiHostame = "rpj3.local";

int listeningPort = 8999;

OscP5 oscP5;
NetAddress rpiAddress;

void setup() {
  size(400,400);
  frameRate(25);
  oscP5 = new OscP5(this, listeningPort); // listening on ...  
  rpiAddress = new NetAddress(rpiHostame, 8900); // sending to ...  
}

void draw() {
  background(0);  
}

/*
when mouse clicking on the window,
send an OSC message to rpi with the xy coordinates
*/
void mousePressed() {
  OscMessage msg = new OscMessage("/nodered/r1");
  msg.add(mouseX);
  msg.add(mouseY);
  oscP5.send(msg, rpiAddress); 
}


/* incoming osc messages */
void oscEvent(OscMessage theOscMessage) {
    
    println(theOscMessage);

    // println(theOscMessage.get(0).intValue());
    // println(theOscMessage.get(1).intValue());
  
    // check if the typetag is the right one
    // should be int, float, or string

    //if(theOscMessage.checkTypetag("ifs")) {
    //  /* parse theOscMessage and extract the values from the osc message arguments. */
    //  int firstValue = theOscMessage.get(0).intValue();  
    //  float secondValue = theOscMessage.get(1).floatValue();
    //  String thirdValue = theOscMessage.get(2).stringValue();
    //  // print("### received an osc message /test with typetag ifs.");
    //  println(" values: "+firstValue+", "+secondValue+", "+thirdValue);
    //  return;
    //}  

  //println("incoming: ");
  
  
  stroke(255);
  // line(mouseX-66, mouseY, mouseX+66, mouseY);
  // line(mouseX, mouseY-66, mouseX, mouseY+66);   
  
  // print(" addrpattern: "+theOscMessage.addrPattern());
  // println(" typetag: "+theOscMessage.typetag());
}