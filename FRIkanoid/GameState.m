//
//  GameState.m
//  FRIkanoid
//
//  Created by jsantos on 1/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameState.h"

@implementation GameState

- (id) initWithGame:(Game *)theGame {
	self = [super initWithGame:theGame];
	if (self != nil) {
		frikanoid = (FRIkanoid*)self.game;
	}
	return self;
}

- (void) activate {}
- (void) deactivate {}

@end
