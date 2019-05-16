#include <Ethernet.h>

int mq3_analogPin = A0;

byte mac[] = { 0x00, 0xAA, 0xBB, 0xCC, 0xDE, 0x02 };
byte ip[] = { 192, 168, 137, 171 };
byte sdns[] = { 8, 8, 8, 8 };
byte gw[] = { 192, 168, 137, 170 };
byte subnet[] = { 255, 255, 255, 0 };


char server[] = "ntd18.azurewebsites.net";
EthernetClient client;

int failedcounter = 0;
boolean lastconnected = false;
 
void setup()
{
  Serial.begin(9600);
  StartEthernet();
  delay(1000);
}
 
void loop()
{ 
  int mq3_value = analogRead(mq3_analogPin);
  //Serial.println(mq3_value);
 
  delay(5000); //Slow down the output.

  SendData(String(mq3_value));
  
  String c = client.readStringUntil('>');
  Serial.print(c);

  if (!client.connected() && lastconnected)
  {
    Serial.println("...Disconnected");
    Serial.println();
    client.stop();
  }
  if (failedcounter > 3) 
  {
    StartEthernet();
    failedcounter = 0;
  }
  lastconnected = client.connected();
}

void StartEthernet()
{
  client.stop();

  Serial.println("Connecting Arduino to network...");
  Serial.println();
  delay(1000);  //Keeps the connection from freezing

  Ethernet.begin(mac, ip, sdns, gw, subnet);
  Serial.println(Ethernet.localIP());

  delay(1000);
}

void SendData(String data)
{
  if (client.connect(server, 80))
  { 
    client.print("GET /api/Directions?value=");
    client.print(data);
    client.println(" HTTP/1.1");
    client.println("Host: ntd18.azurewebsites.net");
    client.println();
 
    if (client.connected())
    {
      Serial.println("Connected");
      Serial.println();
      failedcounter = 0;
    }
    else
    {
      failedcounter++;
      Serial.println("Connection unsuccesful");
      Serial.println();
    }
  }  
  else
  {
    failedcounter++;
    Serial.println("Connection unsuccesful");
    Serial.println();
  }
}
