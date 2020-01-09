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
	PVector cam6 = new PVector(0.3,0.3,0.3);
	events.add(new SetDraws(0,true,false,false,false));

	events.add(new CameraAngV(63,96, 0.001,0.002,-0.00081));
	events.add(new SetDraws(69,false,true,false,false));
	events.add(new CameraPAdd(69, cam6.x, cam6.y, cam6.z));
	events.add(new CubeShiftNotes(69));
	events.add(new CameraPAdd(70.5, -cam6.x,-cam6.y,-cam6.z));
	events.add(new SetDraws(70.5,true,false,false,false));
	events.add(new SetDraws(73,false,true,false,false));
	events.add(new CameraPAdd(73, cam6.x, cam6.y, cam6.z));
	events.add(new CubeShiftNotes(73));
	events.add(new CameraPAdd(74.5, -cam6.x,-cam6.y,-cam6.z));
	events.add(new SetDraws(74.5,true,false,false,false));
	events.add(new SetDraws(77,false,true,false,false));
	events.add(new CameraPAdd(77, cam6.x, cam6.y, cam6.z));
	events.add(new CubeShiftNotes(77));
	events.add(new CameraPAdd(78.5, -cam6.x,-cam6.y,-cam6.z));
	events.add(new SetDraws(78.5,true,false,false,false));
	events.add(new SetDraws(81,false,true,false,false));
	events.add(new CameraPAdd(81, cam6.x, cam6.y, cam6.z));
	events.add(new CubeShiftNotes(81));
	events.add(new CameraPAdd(82.5, -cam6.x,-cam6.y,-cam6.z));
	events.add(new SetDraws(82.5,true,false,false,false));
	events.add(new SetDraws(85,false,true,false,false));
	events.add(new CameraPAdd(85, cam6.x, cam6.y, cam6.z));
	events.add(new CubeShiftNotes(85));
	events.add(new CameraPAdd(86.5, -cam6.x,-cam6.y,-cam6.z));
	events.add(new SetDraws(86.5,true,false,false,false));
	events.add(new SetDraws(89,false,true,false,false));
	events.add(new CameraPAdd(89, cam6.x, cam6.y, cam6.z));
	events.add(new CubeShiftNotes(89));
	events.add(new CameraPAdd(90.5, -cam6.x,-cam6.y,-cam6.z));
	events.add(new SetDraws(90.5,true,false,false,false));

	events.add(new CameraPSet(96.5, 0,0,0));
	events.add(new SetDraws(96.5,false,false,false,true));

	events.add(new SetDraws(101,false,false,true,false));

	events.add(new SetDraws(103,false,false,false,true));

	events.add(new SetDraws(109,false,false,true,false));

	events.add(new SetDraws(113,false,false,false,true));

	events.add(new SetDraws(117,false,false,true,false));

	events.add(new SetDraws(119,false,false,false,true));

	events.add(new SetDraws(124,false,true,false,false));
	events.add(new CubeShiftNotes(124));
	events.add(new CubeShiftNotes(125));
	events.add(new CubeShiftNotes(126));
	events.add(new CubeShiftNotes(127));

	events.add(new CubeShiftNotes(129));

	events.add(new SetDraws(131,false,false,false,true));

	events.add(new CubeShiftNotes(133));
	events.add(new SetDraws(133,true,false,false,false));
}

void setSketch() {
	front = new PVector(de*2,de,de*0.2);
  	back = new PVector(-de*2,-de,-de*2);
  	textSize(90);
  	noiseSeed(0);
  	stroke(0);

  	cellBox = new CellBox(new PVector(0,0,0),size/12,12,12,12, 3,7,5,5);
  	mobs.add(cellBox);

  	cubeBox = new CubeShiftBox(new PVector(0,0,0), size,8,8,8, 175);
  	mobs.add(cubeBox);

  	hollowBox = new HollowCellBox(new PVector(0,0,0), size*4, 15, 2,3,3,3);
  	mobs.add(hollowBox);

  	ball = new PitchBall(new PVector(0,0,0), 10);
  	mobs.add(ball);
}