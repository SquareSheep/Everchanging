/*

0-32 "Don't you, don't you"
Even: snare/clap thing


33-63
8 beat phrases

64-65 "beat, beat, beat"

65-92
8 beat phrases
1st: 4 beat lyrics
2nd: 4 beat shift cubes

96-124
124-128

*/
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
		this(time, size);
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

class setDraws extends Event {
	boolean cell; boolean cube; boolean hollow; boolean ring;

	setDraws(float time, boolean cell, boolean cube, boolean hollow, boolean ring) {
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

class cubeBoxShiftCubes extends Event {

	cubeBoxShiftCubes(float time) {
		super(time, time+1);
	}

	void spawn() {
		cubeBox.shiftCubes();
	}
}