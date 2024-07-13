import processing.sound.*;

AudioSample sample;
Waveform waveform;

int sampleRate;
float duration;
int totalSamples;

boolean isStereo = true;

void setup() {
  size(640, 360);
  sample = new SoundFile(this, "sample.mp3");

  float[] data = new float[int(sample.duration() * sample.sampleRate()) * (isStereo ? 2 : 1)];
  sample.read(data);

  float[] allowedFreq = new float[8];
  for (int i = 0; i < allowedFreq.length; i++)
    allowedFreq[i] = map(i, 0, allowedFreq.length - 1, -1, 1);

  for (int i = 0; i < data.length; i++) {
    var currFrequency = data[i];
    var closest = FindClosest(allowedFreq, currFrequency);
    data[i] = closest;
    var err = currFrequency - closest;
    if (i < data.length - 1)
      data[i+1] += err * 0.25;
    if (i < data.length - 2)
      data[i+2] += err * 0.125;
  }

  sample.write(data);
  /*sample.loop();
   waveform = new Waveform(this, 10000);
   waveform.input(sample);
   println("done");*/
}

float FindClosest(float[] arr, float f) {
  var record = abs(f - arr[0]);
  for (int i = 1; i < arr.length; i++) {
    var d = abs(f - arr[i]);
    if (d > record) {
      return arr[i-1];
    } else
      d = record;
  }
  return arr[arr.length - 1];
}

void draw() {
  /*background(0);
   stroke(255);
   strokeWeight(0.2);
   noFill();
   
   
   waveform.analyze();
   
   beginShape();
   for (int i = 0; i < 10000; i++)
   {
   vertex(
   map(i, 0, 10000-1, 0, width),
   map(waveform.data[i], -1, 1, 0, height)
   );
   }
   endShape();*/
}
