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
	
	events.add(new SetDraws(96.5,false,false,false,true));
	events.add(new CameraPSet(96.5, 0,0,0));
	events.add(new CameraAngV(96.5,124, 0,0,0.002));
	events.add(new SetDraws(101,false,false,true,false));
	events.add(new CameraPSet(101, 0,1.2,0.1));
	events.add(new HollowSetRandom(101));
	events.add(new HollowSetRandom(102));
	events.add(new SetDraws(103,false,false,false,true));
	events.add(new CameraPSet(103, 0,0,0));
	events.add(new SetDraws(109,true,false,false,false));
	events.add(new CameraPSet(109, -0.3,-0.5,0));
	events.add(new SetDraws(113,false,false,false,true));
	events.add(new CameraPSet(113, 0,0,0));
	events.add(new SetDraws(117,false,false,true,false));
	events.add(new CameraPSet(117, 0,1.2,0.1));
	events.add(new HollowSetRandom(117));
	events.add(new SetDraws(119,false,false,false,true));
	events.add(new CameraPSet(119, 0,0,0));

	events.add(new CameraAngV(124,129, 0,-0.0005,0.002));
	events.add(new SetDraws(124,false,true,false,false));
	events.add(new CubeShiftNotes(124, 4.5, 27));
	events.add(new SetDraws(128.5,true,false,false,false));

	events.add(new CameraAngV(129,161, 0,0.0003,-0.004));
	for (int i = 0 ; i < 8 ; i ++) {
		events.add(new SetDraws(129+i*4,false,true,false,false));
		events.add(new CameraPAdd(129+i*4, 0.5,0.5,0.5));
		events.add(new CubeShiftNotes(129+i*4));
		events.add(new SetDraws(130.5+i*4,false,false,false,true));
		events.add(new CameraPAdd(130.5+i*4, -0.5,-0.5,-0.5));
	}
	
	events.add(new SetDraws(161,true,false,false,false));
	events.add(new CameraAngV(161,176, 0,0.013,-0.04));
	events.add(new SetFill(161,0.5));
	events.add(new CameraAngV(176,193, 0,0.0001,0.003));
	events.add(new SetFill(176,0));

	events.add(new SetDraws(176,false,false,false,true));
	events.add(new CameraPSet(176, 0,0,0));
	// Long melody 176-192
	events.add(new SetDraws(193,false,false,false,false));
	events.add(new SetQuiet(193,true));
	events.add(new SetQuiet(209,false));
	// Starting back up 209
	events.add(new CameraAngV(209,250, 0,0.0006,-0.004));
	events.add(new CameraPAdd(209, -0.5,-0.5,-0.5));
	events.add(new SetDraws(209,true,false,false,false));
	for (int i = 0 ; i < 2 ; i ++) {
		events.add(new SetDraws(213 + i*4,false,true,false,false));
		events.add(new CameraPAdd(213 + i*4, 0.3,0.3,0.3));
		events.add(new CubeShiftNotes(213 + i*4));
		events.add(new CameraPAdd(214.5 + i*4, -0.3,-0.3,-0.3));
		events.add(new SetDraws(214.5 + i*4,true,false,false,false));
	}

	events.add(new SetFill(224.5,2));

	events.add(new SetDraws(224.5,false,false,false,true));
	events.add(new CameraPSet(224.5, 0,0,0));
	events.add(new CameraAngV(224.5,124, 0,0,0.002));
	events.add(new SetDraws(229,false,false,true,false));
	events.add(new CameraPSet(229, 0,1.2,0.1));
	events.add(new HollowSetRandom(229));
	events.add(new HollowSetRandom(230));
	events.add(new SetDraws(231,false,false,false,true));
	events.add(new CameraPSet(231, 0,0,0));

	events.add(new SetDraws(237,false,false,false,false));
	events.add(new SetLoud(237,true,false));
	events.add(new SetLoud(238.5,false,true));

	events.add(new SetLoud(240.5,false,false));
	events.add(new SetDraws(240.5,false,false,false,true));
	events.add(new CameraPSet(240.5, 0,0,0));
	events.add(new CameraAngV(240.5,124, 0,0,0.002));
	events.add(new SetDraws(245,false,false,true,false));
	events.add(new CameraPSet(245, 0,1.2,0.1));
	events.add(new HollowSetRandom(245));
	events.add(new HollowSetRandom(246));
	events.add(new SetDraws(247,false,false,false,true));
	events.add(new CameraPSet(247, 0,0,0));

	events.add(new Final(252,285,2.2));
	events.add(new CameraAngV(252,129, 0,-0.0003,0.004));
	events.add(new SetDraws(252,false,true,false,false));
	events.add(new CubeShiftNotes(252, 4.5, 27));
	events.add(new SetDraws(256.5,true,false,false,false));
	events.add(new CameraAngV(257,285, 0,-0.0006,0.008));
	for (int i = 0 ; i < 7 ; i ++) {
		events.add(new SetDraws(257 + i*4,false,true,false,false));
		events.add(new CameraPAdd(257 + i*4, 0.3,0.3,0.3));
		events.add(new CubeShiftNotes(257 + i*4));
		events.add(new CameraPAdd(258.5 + i*4, -0.3,-0.3,-0.3));
		events.add(new SetDraws(258.5 + i*4,true,false,false,false));
	}
	events.add(new SetFill(285, 0.25));
	events.add(new SetDraws(285, false, false, false, false));
	events.add(new SetQuiet(285,true));

}