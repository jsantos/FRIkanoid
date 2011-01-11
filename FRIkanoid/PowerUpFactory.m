//
//  PowerUpFactory.m
//  FRIkanoid
//
//  Created by jsantos on 1/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PowerUpFactory.h"
#import "Chomponthis.FRIkanoid.h"

@implementation PowerUpFactory

static Class powerUpClasses[PowerUpTypes];
static int frequency[PowerUpTypes];
static int totalFrequency;
static PowerUpType randomTypeLookup[100];

+ (void) initialize {
	powerUpClasses[MultiBall] = [MultiBallPowerUp class];
	powerUpClasses[BiggerPad] = [EnlargePowerUp class];
	powerUpClasses[FasterBall] = [FasterPowerUp class];
	powerUpClasses[SlowerBall] = [SlowerPowerUp class];

	frequency[BiggerPad] = 3;
	frequency[MultiBall] = 2;
	frequency[FasterBall] = 2;
	frequency[SlowerBall] = 1;
	
	totalFrequency = 0;
	for (int i = 0; i < PowerUpTypes; i++) {
		for (int j = 0; j < frequency[i]; j++) {
			randomTypeLookup[totalFrequency] = i;
			totalFrequency++;
		}
	}
}

+ (PowerUp*) createPowerUp:(PowerUpType)type {
	return [[[powerUpClasses[type] alloc] init] autorelease];
}

+ (PowerUp*) createRandomPowerUp {
	int index = [Random intLessThan:PowerUpTypes];
	PowerUpType type = randomTypeLookup[index];
	return [PowerUpFactory createPowerUp:type];
}

@end
