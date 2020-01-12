// class SetFFT extends Event {
	
// }

class SetDraws extends Event {
	boolean cell; boolean cube; boolean hollow; boolean ring;
	int mode;

	SetDraws(float time, boolean cell, boolean cube, boolean hollow, boolean ring) {
		super(time, time+1);
		this.cell = cell;
		this.cube = cube;
		this.hollow = hollow;
		this.ring = ring;
		if (cell) mode = 0;
		if (cube) mode = 1;
		if (hollow) mode = 2;
		if (ring) mode = 3;
	}

	void spawn() {
		cellBox.draw = cell;
		cubeBox.draw = cube;
		hollowBox.draw = hollow;
		ball.draw = ring;
		cellTunnel.draw = cell;
		cubeTunnel.draw = cube;
		hollowTunnel.draw = hollow;
		ballTunnel.draw = ring;
		wireBox.mode = mode;
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