static float bpm = 170;
static float beatInc = 0.5;
static int threshold = 100;
static int offset = -350;
static int binCount = 144;
static float defaultMass = 10;
static float defaultVMult = 0.5;
static float fillMass = 10;
static float fillVMult = 0.5;
static float fftThreshold = 1;
static float fftPow = 1.8;
static float fftAmp = 5;
static float volumeGain = -10;
static String songName = "../Music/everchanging.mp3";

IColor defaultFill = new IColor(222,125,222,255);
IColor defaultStroke = new IColor(0,0,0,0);

ACellBox cellBox;
CubeShiftBox cubeBox;

void render() {
	cam.ang.P.y += 0.003;
	cam.dang.y += 0.003;
	if ((int)currBeat % 2 == 0) {
		fill(255);
		rect(0,0,25,25);
	}
}

void keyboardInput() {
	if (key == '1') {
		cellBox.draw = !cellBox.draw;
		cubeBox.draw = !cubeBox.draw;
	} else {
		cubeBox.shiftCubes();
	}
}

void addEvents() {
	
}

void setSketch() {
	front = new PVector(de*2,de,de*0.2);
  	back = new PVector(-de*2,-de,-de*2);
  	textSize(30);
  	cellBox = new ACellBox(new PVector(0,0,0),de,15,15,15);
  	cellBox.draw = false;
  	mobs.add(cellBox);
  	cubeBox = new CubeShiftBox(new PVector(0,0,0), de,5,5,5, 75);
  	mobs.add(cubeBox);
}