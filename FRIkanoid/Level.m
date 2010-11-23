//
//  Level.m
//  FRIkanoid
//
//  Created by jsantos on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Level.h"
#import "Chomponthis.FRIkanoid.h"

@implementation Level

- (id) initWithGame:(Game *)theGame{
	self = [super initWithGame:theGame];
	if (self != nil) {
		scene = [[SimpleScene alloc] init];
		
		ball = [[Ball alloc] init];
		playerPad = [[Pad alloc] init];
		bricks = [[NSMutableArray alloc] init];
		
		leftWall = [[Boundary alloc] initWithLimit:[AxisAlignedHalfPlane axisAlignedHalfPlaneWithDirection:AxisDirectionPositiveX distance:0]];
		
		rightWall = [[Boundary alloc] initWithLimit:[AxisAlignedHalfPlane axisAlignedHalfPlaneWithDirection:AxisDirectionNegativeX distance:-500]];
		 
		ceiling = [[Boundary alloc] initWithLimit:[AxisAlignedHalfPlane axisAlignedHalfPlaneWithDirection:AxisDirectionPositiveY distance:0]];

		
	}
	return self;
}

@synthesize scene, ball, playerPad, bricks, powerUp, leftWall, rightWall, ceiling, numBricks;

- (void) initialize {
	[self reset];
	[super initialize];
}

- (void) reset {
	[scene clear];
	[scene addItem:playerPad];
	[scene addItem:ball];
	[scene addItem: leftWall];
	[scene addItem: rightWall];
	[scene addItem: ceiling];
	
	[bricks removeAllObjects];
}

- (void) resetAfterMiss {}

- (void) dealloc {
	[scene release];
	[super dealloc];
}

@end
