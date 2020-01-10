class PitchBall extends Entity {
	Point p;
	Point ang = new Point();
	Bar[] ar = new Bar[binCount];

	PitchBall(PVector p, float w) {
		this.p = new Point(p);
		float t;
		for (float i = 0 ; i < ar.length ; i ++) {
			t = i/ar.length;
			ar[(int)i] = new Bar(new PVector(noise(i/10)*PI*2-PI,noise(3000+i/10)*PI*2-PI,noise(1000+i/10)*PI*2-PI), w, t*255,t*125+125,255-t*255, 2,2,2, i);
		}
	}

	class Bar {
		Point ang;
		PVector dang;
		Point w;
		IColor fillStyle;

		Bar(PVector ang, float w, float r, float g, float b, float rm, float gm, float bm, float index) {
			this.ang = new Point(ang);
			this.dang = ang.copy();
			float ampW = 6;
			this.w = new Point(w*ampW,w*ampW,w*ampW*10);
			this.w.pm.set(w/10,w/10,w);
			this.w.index = (int)index;
			fillStyle = new IColor(r,g,b,255, rm,gm,bm,0, index);
		}
	}

	void update() {
		p.update();
		ang.update();
		for (int i = 0 ; i < ar.length ; i ++) {
			ar[i].ang.update();
			ar[i].w.update();
			ar[i].fillStyle.update();
		}
	}

	void render() {
		push();
		translate(p.p.x,p.p.y,p.p.z);
		for (int i = 0 ; i < ar.length ; i ++) {
			push();
			ar[i].fillStyle.fillStyle();
			rotateX(ar[i].ang.p.x);
			rotateY(ar[i].ang.p.y);
			rotateZ(ar[i].ang.p.z);
			translate(0,0,ar[i].w.p.z/2);
			box(ar[i].w.p.x,ar[i].w.p.y,ar[i].w.p.z);
			pop();
		}
		pop();
	}

	void angSetX() {
		for (int i = 0 ; i < ar.length ; i ++) {
			ar[i].ang.P.set(ar[i].dang);
		}
	}
}