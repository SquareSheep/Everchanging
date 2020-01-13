class ShapeTunnel extends ObjectPool<Shape> {

	PVector w;
	PVector p;
	PVector ws; // Average of shape w
	PVector wd; // Variation of shape w
	float v; float vd;
	float r; float g; float b;
	float rd; float gd; float bd;
	float rm; float gm; float bm;
	float rmd; float gmd; float bmd;
	boolean spawn = true;
	float wLimit = 0.75;

	ShapeTunnel(int num, PVector p, PVector w, PVector ws, PVector wd, float v, float vd, float r, float g, float b, 
		float rd, float gd, float bd, float rm, float gm, float bm, float rmd, float gmd, float bmd) {
		this.p = p; this.w = w; this.ws = ws; this.wd = wd; this.v = v; this.vd = vd;
		this.r = r; this.g = g; this.b = b;
		this.rd = rd; this.gd = gd; this.bd = bd;
		this.rm = rm; this.gm = gm; this.bm = bm;
		this.rmd = rmd; this.gmd = gmd; this.bmd = bmd;
		for (int i = 0 ; i < num ; i ++) {
			add(random(-1,1));
		}
	}

	void set(Shape mob, float x, float y, float z, float w, float h, float d, float v, int mode, float r, float g, float b, float rm, float gm, float bm) {
		mob.finished = false;
		mob.draw = true;
		mob.p.reset(x,y,z);
		mob.w.reset(w,h,d);
		mob.w.pm.set(w*0.002,h*0.002,d*0.002);
		mob.w.index = (int)random(binCount);
		mob.ang.reset(random(-PI,PI),random(-PI,PI),random(-PI,PI));
		mob.strokeStyle.reset(r,g,b,255,rm,gm,bm,0);
		mob.strokeStyle.index = (int)random(binCount);
		mob.mode = mode;
		mob.pv.P.z = v;
	}

	void add(float x, float y, float z, float w, float h, float d, float v, int mode, float r, float g, float b, float rm, float gm, float bm) {
		Shape mob;
		if (arm == ar.size()) {
			ar.add(0,new Shape());
			mob = ar.get(0);
		} else {
			mob = ar.get(arm);
		}
		set(mob, x,y,z, w,h,d, v, mode, r,g,b, rm,gm,bm);
		arm ++;
	}

	void add(float z) {
		float x = 0; float y = 0;
		switch ((int)random(4)) {
			case 0:
			x = random(-w.x,w.x);
			y = random(-w.y,-w.y*wLimit);
			break;
			case 1:
			x = random(-w.x, w.x);
			y = random(w.y*wLimit, w.y);
			break;
			case 2:
			x = random(-w.x,-w.x*wLimit);
			y = random(-w.y,w.y);
			break;
			case 3:
			x = random(w.x*wLimit,w.x);
			y = random(-w.y,w.y);
			break;
		}
		add(x,y,w.z*z, random(-wd.x,wd.x)+ws.x,random(-wd.y,wd.y)+ws.y,random(-wd.z,wd.z)+ws.z, random(-vd,vd)+v, 0,
					random(-rd,rd)+r, random(-gd,gd)+g, random(-bd,bd)+b, random(-rmd,rmd)+rm, random(-gmd,gmd)+gm, random(-bmd,bmd)+bm);
	}

	void add() {
		add(-1);
	}

	void update() {
		super.update();
		for (int i = 0 ; i < arm ; i ++) {
			if (ar.get(i).p.p.z > w.z || ar.get(i).p.p.z < -w.z) {
				remove(i);
				add();
			}
		}
	}

	void render() {
		push();
		strokeWeight(w.x/800);
		translate(p.x,p.y,p.z);
		//box(w.x*2,w.y*2,w.z*2);
		fill(0);
		super.render();
		pop();
	}

	void fillStyleSetM(float r, float g, float b) {
		for (int i = 0 ; i < ar.size() ; i ++) {
			ar.get(i).fillStyle.setM(r,g,b,0, (float)i/arm*binCount);
		}
	}
}

class Shape extends MobF {
	Point w;
	int mode;

	Shape() {
		this.p = new Point();
		this.ang = new Point();
		this.w = new Point();
	}

	void update() {
		super.update();
		w.update();
		fillStyle.update();
	}

	void render() {
		setDraw();
		switch(mode) {
			case 0:
			box(w.p.x,w.p.y,w.p.z);
			break;
			case 1:
			beginShape();
			vertex(w.p.x,0,0);
			vertex(-w.p.x,0,0);
			vertex(0,w.p.y,0);
			vertex(w.p.x,0,0);
			endShape();
			break;
		}
		pop();
	}
}