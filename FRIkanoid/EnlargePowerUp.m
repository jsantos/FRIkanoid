//
//  EnlargePowerUp.m
//  FRIkanoid
//
//  Created by jsantos on 1/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EnlargePowerUp.h"
#import "GameDefaults.Scene.h"
#import "Chomponthis.FRIkanoid.h"

@implementation EnlargePowerUp

- (id) init {
	self = [super initWithType:BiggerPad duration:30];
	if (self != nil) {
		
	}
	return self;
}

- (void) activateWithParent:(Pad *)theParent {
	[super activateWithParent:theParent];

	theParent.width += theParent.width*0.3;
}

@end
