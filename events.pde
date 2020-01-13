// class SetFFT extends Event {
	
// }

class Final extends Event {
	float amp;
	Final(float time, float timeEnd, float amp) {
		super(time, timeEnd);
		this.amp = amp;
	}

	void update() {
		cellBox.p.P.x += sin((float)frameCount/fpb/4)*amp;
		cubeBox.p.P.y += sin((float)frameCount/fpb/4)*amp;
	}
}

class SetFill extends Event {
	float amp;

	SetFill(float time, float amp) {
		super(time, time+1);
		this.amp = amp;
	}

	void spawn() {
		cellBox.fillStyleSetM(5*amp,3*amp,3*amp);
		cubeBox.fillStyleSetM(2*amp,2*amp,5*amp);
		hollowBox.fillStyleSetM(2*amp,2*amp,5*amp);
		ball.fillStyleSetM(1*amp,3*amp,1*amp);
		cellTunnel.fillStyleSetM(5*amp,2*amp,2*amp);
		cubeTunnel.fillStyleSetM(2*amp,5*amp,2*amp);
		hollowTunnel.fillStyleSetM(2*amp,2*amp,5*amp);
		ballTunnel.fillStyleSetM(3*amp,3*amp,3*amp);
		quietTunnel.fillStyleSetM(3*amp,3*amp,3*amp);
		loudTunnel.fillStyleSetM(6*amp,6*amp,1*amp);
		loud2Tunnel.fillStyleSetM(1*amp,6*amp,6*amp);
		cellBox.w.pm.set(amp*cellBox.w.p.x*0.002,amp*cellBox.w.p.x*0.002,amp*cellBox.w.p.x*0.002);
		cellBox.w.index = 0;
		cubeBox.w.pm.set(amp*cubeBox.w.p.x*0.002,amp*cubeBox.w.p.x*0.002,amp*cubeBox.w.p.x*0.002);
		cubeBox.w.index = 0;
	}
}

class SetQuiet extends Event {
	boolean quiet;
	SetQuiet(float time, boolean quiet) {
		super(time, time+1);
		this.quiet = quiet;
	}

	void spawn() {
		quietTunnel.draw = quiet;
	}
}

class SetLoud extends Event {
	boolean loud;
	boolean loud2;
	SetLoud(float time, boolean loud, boolean loud2) {
		super(time, time+1);
		this.loud = loud;
		this.loud2 = loud2;
	}

	void spawn() {
		loudTunnel.draw = loud;
		loud2Tunnel.draw = loud2;
	}
}

class SetDraws extends Event {
	boolean cell; boolean cube; boolean hollow; boolean ring;
	int mode = 4;

	SetDraws(float time, boolean cell, boolean cube, boolean hollow, boolean ring) {
		super(time, time+1);
		this.cell = cell;
		this.cube = cube;
		this.hollow = hollow;
		this.ring = ring;
		if (cell) mode = 0;
		if (cube) mode = 0;
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