class CubeShiftBox extends Entity {
	Point p;
	Point w;
	boolean[][][] ar;
	ArrayList<Cube> cubes = new ArrayList<Cube>();
	int x; int y; int z;
	int i; int k; int j;

	float cubeVMult = 0.2;
	float cubeMass = 3;

	CubeShiftBox(PVector p, float w, int x, int y, int z, int num) {
		this.p = new Point(p);
		this.w = new Point(w/x,w/y,w/z);
		this.x = x; this.y = y; this.z = z;
		ar = new boolean[x][][];
		for (i = 0 ; i < x ; i ++) {
			ar[i] = new boolean[y][];
			for (k = 0 ; k < y ; k ++) {
				ar[i][k] = new boolean[z];
			}
		}
		float amp = 0.2;
		float amp2 = 0.6;
		int X; int Y; int Z;
		for (int i = 0 ; i < num ; i ++) {
			do {
				X = (int)random(x);
				Y = (int)random(y);
				Z = (int)random(z);
			} while (ar[X][Y][Z]);
			Cube cube = new Cube((float)X/x*255,255-(float)Y/y*125,125+(float)Z/z*125, X,Y,Z);
			cube.p.reset((cube.x-(float)x*0.5+0.5)*w/x, (cube.y-(float)y*0.5+0.5)*w/y, (cube.z-(float)z*0.5+0.5)*w/z);
			cube.fillStyle.setM(amp2,amp2,amp2,255,(float)i/num*binCount);
			cube.sca.setM(-0.001, (float)i/num*binCount);
			ar[X][Y][Z] = true;
			cubes.add(cube);
		}
	}

	void fillStyleSetM(float rm, float gm, float bm) {
		for (i = 0 ; i < cubes.size() ; i ++) {
				cubes.get(i).fillStyle.setM(rm,gm,bm,0, (float)i/cubes.size()*binCount);
		}
	}

	class Cube extends Entity {
		Point p = new Point();
		SpringValue sca = new SpringValue(1);
		IColor fillStyle;
		IColor strokeStyle;
		int x; int y; int z;

		Cube(float r, float g, float b, int x, int y, int z) {
			this.x = x; this.y = y; this.z = z;
			fillStyle = defaultFill.copy();
			strokeStyle = new IColor(r,g,b,255);
			p.mass = cubeMass;
			p.vMult = cubeVMult;
		}

		void update() {
			p.update();
			sca.update();
			fillStyle.update();
			strokeStyle.update();
		}

		void render() {
			push();
			fillStyle.fillStyle();
			strokeStyle.strokeStyle();
			translate(this.p.p.x,this.p.p.y,this.p.p.z);
			scale(sca.x);
			box(w.p.x,w.p.y,w.p.z);
			pop();
		}
	}

	void update() {
		p.update();
		w.update();
		for (Cube mob : cubes) {
			mob.update();
			mob.p.P.set((mob.x-(float)x*0.5+0.5)*w.p.x, (mob.y-(float)y*0.5+0.5)*w.p.y, (mob.z-(float)z*0.5+0.5)*w.p.z);
		}
	}

	void render() {
		push();
		translate(p.p.x, p.p.y, p.p.z);
		for (Cube mob : cubes) {
			mob.render();
		}
		pop();
	}

	void shiftCubes() {
		for (int i = 0 ; i < cubes.size() ; i ++) {
			shiftCube(i);
		}
	}

	void shiftCube(int i) {
		int dir;
		Cube mob = cubes.get(i);
		dir = (int)random(0,2);
		switch (dir) {
			case 0:
			if (random(1)>0.5) {
				if (mob.x>0 && !ar[mob.x-1][mob.y][mob.z]) {
					ar[mob.x][mob.y][mob.z] = false;
					mob.x --;
					ar[mob.x][mob.y][mob.z] = true;
				}
			} else {
				if (mob.x<x-1 && !ar[mob.x+1][mob.y][mob.z]) {
					ar[mob.x][mob.y][mob.z] = false;
					mob.x ++;
					ar[mob.x][mob.y][mob.z] = true;
				}
			}
			break;
			case 1:
			if (random(1)>0.5) {
				if (mob.y>0 && !ar[mob.x][mob.y-1][mob.z]) {
					ar[mob.x][mob.y][mob.z] = false;
					mob.y --;
					ar[mob.x][mob.y][mob.z] = true;
				}
			} else {
				if (mob.y<y-1 && !ar[mob.x][mob.y+1][mob.z]) {
					ar[mob.x][mob.y][mob.z] = false;
					mob.y ++;
					ar[mob.x][mob.y][mob.z] = true;
				}
			}
			break;
			case 2:
			if (random(1)>0.5) {
				if (mob.z>0 && !ar[mob.x][mob.y][mob.z-1]) {
					ar[mob.x][mob.y][mob.z] = false;
					mob.z --;
					ar[mob.x][mob.y][mob.z] = true;
				}
			} else {
				if (mob.z<z-1 && !ar[mob.x][mob.y][mob.z+1]) {
					ar[mob.x][mob.y][mob.z] = false;
					mob.z ++;
					ar[mob.x][mob.y][mob.z] = true;
				}
			}
			break;
		}
	}
}