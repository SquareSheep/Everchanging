class FlashCut extends Event {
	Rect[][] ar = new Rect[6][];
	float w;

	FlashCut(float time, float w) {
		super(time, time+1);
		this.w = w;
		for (int i = 0 ; i < 6 ; i ++) {
			ar[i] = new Rect[(int)random(3,6)];
			for (int k = 0 ; k < ar[i].length ; k ++) {
				ar[i][k] = new Rect();
			}
		}
	}

	FlashCut(float time) {
		this(time, wireBox.w);
	}

	class Rect {
		SpringValue p = new SpringValue(0,0.1,5);
		SpringValue d = new SpringValue(0,0.1,5);
	}

	void spawn() {
		for (int i = 0 ; i < 6 ; i ++) {
			for (int k = 0 ; k < ar[i].length ; k ++) {
				ar[i][k].p.x = 0;
				ar[i][k].p.X = random(-w/2,w/2);
				ar[i][k].d.x = w;
				ar[i][k].d.X = 0;
			}
		}
	}

	void update() {
		for (int i = 0 ; i < 6 ; i ++) {
			for (int k = 0 ; k < ar[i].length ; k ++) {
				ar[i][k].p.update();
				ar[i][k].d.update();
			}
		}
	}

	void render() {
		push();
		noStroke();
		fill(255);
		renderSide(0);
		rotateX(PI/2);
		renderSide(1);
		rotateX(PI/2);
		renderSide(2);
		rotateX(PI/2);
		renderSide(3);
		rotateX(PI/2);
		rotateY(PI/2);
		renderSide(4);
		rotateY(PI);
		renderSide(5);
		pop();
	}

	void renderSide(int i) {
		push();
		translate(0,0,w/2);
		for (int k = 0 ; k < ar[i].length ; k ++) {
			rect(ar[i][k].p.x,0, ar[i][k].d.x, w);
		}
		pop();
	}
}

class SetDraws extends Event {
	boolean cell; boolean cube; boolean hollow; boolean ring;

	SetDraws(float time, boolean cell, boolean cube, boolean hollow, boolean ring) {
		super(time, time+1);
		this.cell = cell;
		this.cube = cube;
		this.hollow = hollow;
		this.ring = ring;
	}

	void spawn() {
		cellBox.draw = cell;
		cubeBox.draw = cube;
		hollowBox.draw = hollow;
		ball.draw = ring;
	}
}

class CubeShiftNotes extends Event {
	float start;
	int d = (int)(fpb/3);
	int num;

	CubeShiftNotes(float time, float duration, float d, int num) {
		super(time, time+duration);
		this.d = (int)(fpb/d);
		this.num = num;
	}

	CubeShiftNotes(float time, float duration, int num) {
		this(time, duration, 3, num);
	}

	CubeShiftNotes(float time) {
		this(time, 1.5, 3, 7);
	}

	void spawn() {
		start = frameCount;
	}

	void update() {
		for (int i = 1 ; i <= num ; i ++) {
			if (frameCount-start == d*i) cubeBox.shiftCubes();
		}
	}
}

class HollowSetRandom extends Event {
	HollowSetRandom(float time) {
		super(time, time+1);
	}

	void spawn() {
		hollowBox.setRandom();
	}
}

class CameraPAdd extends Event {
	float x; float y; float z;

	CameraPAdd(float time, float x, float y, float z) {
		super(time, time+1);
		this.x = x; this.y = y; this.z = z;
	}

	void spawn() {
		cam.ang.p.add(x,y,z);
		cam.ang.P.add(x,y,z);
	}
}

class CameraPSet extends Event {
	float x; float y; float z;

	CameraPSet(float time, float x, float y, float z) {
		super(time, time+1);
		this.x = x; this.y = y; this.z = z;
	}

	void spawn() {
		cam.ang.p.set(x,y,z);
		cam.ang.P.set(x,y,z);
	}
}

class CameraAngV extends Event {
	float x; float y; float z;

	CameraAngV(float time, float timeEnd, float x, float y, float z) {
		super(time, timeEnd);
		this.x = x; this.y = y; this.z = z;
	}

	void update() {
		cam.ang.P.add(x,y,z);
	}
}