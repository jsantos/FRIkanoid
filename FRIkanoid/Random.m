//
//  Random.m
//  FRIkanoid
//
//  Created by jsantos on 11/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Random.h"


@implementation Random

+ (void) initialize {
	// Seed with current time.
	srandom(time(NULL));
}

+ (int) int {
	return random();
}

+ (int) intLessThan:(int)maxValue {
	return random() % maxValue;
}

+ (int) intGreaterThanOrEqual:(int)minValue lessThan:(int)maxValue {
	return minValue + random() % (maxValue - minValue);
}

+ (float) float {
	return (float)random() / (float)RAND_MAX;
}

+ (double) double {
	return (double)random() / (double)RAND_MAX;
}

@end
