
// examples of how to use the JavaWavReadWrite.pde functions
// to read, save, and process wave files as arrays

void setup() {
  size(500, 500);// just big enough so I can grab the bar on Windows 10
  
  // generate random stereo noise and save it to a wave file
  float[][] samples = new float[2][88200];// [channels][samples]
  for (int c=0; c<samples.length; c++) for (int s=0; s<samples[c].length; s++) samples[c][s] = random(-1, 1);
  saveWaveToFile(sketchPath("output.wav"), samples);
  
  // load a sample (that happens to be the one we generated right above)
  WavFile wave = readWaveFromFilePath(sketchPath("output.wav"));
  
  // extract array of doubles and modify it
  double[][] waveArray = wave.samplesAsDouble();
  for (int c=0;c<waveArray.length;c++) for (int s=0;s<waveArray[c].length;s++) waveArray[c][s]/=5;
  
  // save it back as a file
  wave.setSamplesFromDouble(waveArray);
  wave.writeToFilePath();
  
  exit();
  
}

void draw() {
}
