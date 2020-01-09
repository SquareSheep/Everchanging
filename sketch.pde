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
static float volumeGain = -25;
static String songName = "../Music/everchanging.mp3";

IColor defaultFill = new IColor(222,125,222,255);
IColor defaultStroke = new IColor(0,0,0,0);

CellBox cellBox;
CubeShiftBox cubeBox;
HollowCellBox hollowBox;
PitchBall ball;

static float size;

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
	} else if (key == '5') {
		setTime(113313, 160);
	}
}

void addEvents() {
	events.add(new CameraAngV(63,96, 0.001,0.002,-0.00081));
	events.add(new SetDraws(61,true,false,false,false));
	for (int i = 0 ; i < 6 ; i ++) {
		events.add(new SetDraws(69 + i*4,false,true,false,false));
		events.add(new CameraPAdd(69 + i*4, 0.3,0.3,0.3));
		events.add(new CubeShiftNotes(69 + i*4));
		events.add(new CameraPAdd(70.5 + i*4, -0.3,-0.3,-0.3));
		events.add(new SetDraws(70.5 + i*4,true,false,false,false));
	}

	events.add(new CameraPSet(96.5, 0,0,0));
	events.add(new SetDraws(96.5,false,false,false,true));

	events.add(new SetDraws(101,false,false,true,false));
	events.add(new SetDraws(103,false,false,false,true));
	events.add(new SetDraws(109,true,false,false,false));
	events.add(new SetDraws(113,false,false,false,true));
	events.add(new SetDraws(117,false,false,true,false));
	events.add(new SetDraws(119,false,false,false,true));

	events.add(new SetDraws(124,false,true,false,false));
	events.add(new CubeShiftNotes(124));
	events.add(new CubeShiftNotes(125.5));
	events.add(new CubeShiftNotes(127));
	events.add(new SetDraws(128.5,true,false,false,false));

	for (int i = 0 ; i < 8 ; i ++) {
		events.add(new SetDraws(129+i*4,false,true,false,false));
		events.add(new CubeShiftNotes(129+i*4));
		events.add(new SetDraws(130.5+i*4,false,false,false,true));
	}
	
	events.add(new SetDraws(161,true,false,false,false));

	// Long melody 177-191
}

void setSketch() {
	front = new PVector(de*2,de,de*0.2);
  	back = new PVector(-de*2,-de,-de*2);
  	size = width*0.5+height*0.5;
  	textSize(90);
  	noiseSeed(0);
  	stroke(0);

  	cellBox = new CellBox(new PVector(0,0,0),size/8,8,8,8, 3,7,5,5);
  	mobs.add(cellBox);

  	cubeBox = new CubeShiftBox(new PVector(0,0,0), size,8,8,8, 175);
  	mobs.add(cubeBox);

  	hollowBox = new HollowCellBox(new PVector(0,0,0), size, 8, 2,3,3,3);
  	mobs.add(hollowBox);

  	ball = new PitchBall(new PVector(0,0,0), 5);
  	mobs.add(ball);

  	setTime(44141,62);
}