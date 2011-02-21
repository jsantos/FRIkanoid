//
//  Constants.h
//  FRIkanoid
//
//  Created by jsantos on 2/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Constants : NSObject {
	
}

@property (nonatomic, readonly) float minimumBallVerticalVelocity, maximumBallAngle;

@property (nonatomic, readonly) int startLives;

@property (nonatomic, readonly) float initialBallSpeed, levelUpBallSpeedIncrease, ballSpeedUp;

@property (nonatomic, readonly) float powerUpChance, powerUpSpeed;

@property (nonatomic, readonly) float initialPadWidth, minimumPadWidth, maximumPadWidth;

@property (nonatomic, readonly) float distanceBetweenBricks;

+ (Constants*) getInstance;

@end
