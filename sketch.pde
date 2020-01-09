static float bpm = 170;
static float beatInc = 0.5;
static int threshold = 100;
static int offset = -350;
static int binCount = 144;
static float defaultMass = 10;
static float defaultVMult = 0.5;
static float fillMass = 10;
static float fillVMult = 0.5;
static float fftThreshold = 1.2;
static float fftPow = 1.1;
static float fftAmp = 3.5;
static float volumeGain = -10;
static String songName = "../Music/everchanging.mp3";

IColor defaultFill = new IColor(222,125,222,255);
IColor defaultStroke = new IColor(0,0,0,0);

CellBox cellBox;
CubeShiftBox cubeBox;
HollowCellBox hollowBox;
PitchBall ball;

static float size = 1000;

void render() {
}

void keyboardInput() {
	if (key == '1') {
		setTime(0,0);
	} else if (key == '2') {
		setTime(22940,32);
	} else if (key == '3') {
		setTime(44141,62);
	} else if (key == '4') {
		setTime(65294, 92);
	}
}

void addEvents() {
	events.add(new setDraws(0,false,true,false,false));
	for (int i = 0 ; i < 25 ; i ++) {
		events.add(new FlashCut(i*2, de));
	}
}

void setSketch() {
	front = new PVector(de*2,de,de*0.2);
  	back = new PVector(-de*2,-de,-de*2);
  	textSize(90);
  	noiseSeed(0);
  	stroke(0);

  	cellBox = new CellBox(new PVector(0,0,0),size/10,10,10,10, 3,7,5,5);
  	mobs.add(cellBox);

  	cubeBox = new CubeShiftBox(new PVector(0,0,0), size,8,8,8, 175);
  	mobs.add(cubeBox);

  	hollowBox = new HollowCellBox(new PVector(0,0,0), size*3.5, 25, 2,3,3,3);
  	mobs.add(hollowBox);

  	ball = new PitchBall(new PVector(0,0,0), 10);
  	mobs.add(ball);
}