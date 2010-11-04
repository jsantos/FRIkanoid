//
//  AnimatedSprite.h
//  GameDefaults
//
//  Created by jsantos on 11/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GameDefaults.Graphics.classes.h"

@interface AnimatedSprite : NSObject {
	NSMutableArray *frames;
	NSTimeInterval duration;
	BOOL looping;
}

- (id) initWithDuration:(NSTimeInterval)theDuration;

@property (nonatomic) NSTimeInterval duration;
@property (nonatomic) BOOL looping;

- (void) addFrame:(AnimatedSpriteFrame*)frame;

- (Sprite*) spriteAtTime:(NSTimeInterval)time;

@end
