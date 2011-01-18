//
//  GameProgress.h
//  FRIkanoid
//
//  Created by jsantos on 1/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Chomponthis.FRIkanoid.classes.h"

@interface GameProgress : NSObject <NSCoding> {
	BOOL levelUnlocked[LevelTypes];
}

+ (NSMutableArray*) loadProgress;
+ (void) deleteProgress;
- (void) saveProgress:(NSMutableArray*)scores;

- (BOOL) isLevelUnlocked:(LevelType)type;

- (void) unlockLevel:(LevelType)type;

@end
