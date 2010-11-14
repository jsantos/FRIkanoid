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
		
		[scene addItem:playerPad];
		[scene addItem:ball];
		
		for (int i=0; i<32; i++) {
			Brick *lol = [[Brick alloc] init];
			[bricks addObject:lol];
			//[lol release];
		}
		
		for (id<NSObject> brick in bricks){
			[scene addItem:brick];
		}
		
	}
	return self;
}

@synthesize scene, ball, playerPad, bricks;

- (void) initialize {
	[self reset];
	[super initialize];
}

- (void) reset {}

- (void) dealloc {
	[scene release];
	[super dealloc];
}


//- (id) init {
//	self = [super init];
//	if (self != nil) {
//		ball = [[Ball alloc] init];
//		playerPad = [[Pad alloc] init];
//		bricks = [[NSMutableArray alloc] init];
//		
//		for (int i=0; i<40; i++) {
//			Brick *lol = [[Brick alloc] init];
//			[bricks addObject:lol];
//			[lol release];
//		}
//		
//		scene = [[Scene alloc] init];
//		
//		for (id<NSObject> brick in bricks){
//			[scene addItem:brick];
//		}
//		
//		[scene addItem:playerPad];
//		[scene addItem:ball];
//
//	}
//	return self;
//}
//
//@synthesize scene, ball, playerPad, bricks;
//
//- (void) dealloc {
//	[bricks release];
//	[ball release];
//	[playerPad release];
//	[scene release];
//		
//	[super dealloc];
//}

@end
