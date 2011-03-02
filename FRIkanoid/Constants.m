//
//  Constants.m
//  FRIkanoid
//
//  Created by jsantos on 2/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Constants.h"
#import "Chomponthis.FRIkanoid.h"

@implementation Constants

static Constants *instance;

+ (void) initialize {
	instance = [[Constants alloc] init];
}

+ (Constants *) getInstance {
	return instance;
}

- (float) minimumBallVerticalVelocity {
	return 100;
}

- (float) maximumBallAngle {
	return M_PI/2;
}

- (float) levelUpBallSpeedIncrease {
	return 100;
}

- (int) startLives {
	return 3;
}

- (float) initialBallSpeed {
	return 500; //iPhone 200 / Ipad 500
}

- (float) ballSpeedUp {
	return 1.01f;
}

- (float) powerUpChance {
	return 0.2f;
}

- (float) powerUpSpeed {
	return 100;
}

- (float) initialPadWidth {
	return 110;
}

- (float) minimumPadWidth {
	return 50;
}

- (float) maximumPadWidth {
	return 400;
}

- (float) padWidthChange {
	return 50;
}


@end
