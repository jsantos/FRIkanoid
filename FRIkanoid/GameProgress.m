//
//  GameProgress.m
//  FRIkanoid
//
//  Created by jsantos on 1/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameProgress.h"
#import "Chomponthis.FRIkanoid.h"

@implementation GameProgress

- (id) init {
	self = [super init];
	if (self != nil) {
		printf("Created new game progress\n");
		//Unlock first level type
		levelUnlocked[LevelTypeOne] = YES;
	}
	return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
	self = [super init];
	if (self != nil) {
		for (int i = 0; i < LevelTypes; i++) {
			levelUnlocked[i] = [aDecoder decodeBoolForKey:[NSString stringWithFormat:@"levelUnlocked%i", i]];
		}
	}
	return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
	for (int i = 0; i < LevelTypes; i++) {
		[aCoder encodeBool:levelUnlocked[i] forKey:[NSString stringWithFormat:@"levelUnlocked%i", i]];
	}
}

- (NSMutableArray *) loadProgress {
	//Load game progress from file
	NSMutableArray *scores = nil;
	
	NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	NSString *archivePath = [rootPath stringByAppendingPathComponent:@"FrikanoidSave"];
	scores = [NSKeyedUnarchiver unarchiveObjectWithFile:archivePath];
	
	if (!scores) {
		scores = [[[NSMutableArray alloc] init] autorelease];
	}
	//NSLog(@"Progress retain count:", [progress retainCount]);
//	printf("Loaded scores:\n");
//	for (int i = 0; i < [scores count]; i++) {
//		printf("%d\n", [[scores objectAtIndex:i] integerValue]);
//	}
	return scores;
}

- (void) deleteProgress {
	//Delete game progress file
	NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	NSString *archivePath = [rootPath stringByAppendingPathComponent:@"FrikanoidSave"];
	
	NSError *error;
	[[NSFileManager defaultManager] removeItemAtPath:archivePath error:&error];
}

- (void) saveProgress:(NSMutableArray*)scores {
	//Save game progress to file
	//sortedScores =  [scores sortedArrayUsingSelector:@selector(compare:)];
//	[scores addObject:[NSNumber numberWithInt:points]];

	NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	NSString *archivePath = [rootPath stringByAppendingPathComponent:@"FrikanoidSave"];
	[NSKeyedArchiver archiveRootObject:scores toFile:archivePath];
}

- (BOOL) isLevelUnlocked:(LevelType)type {
	return levelUnlocked[type];
}

- (void) unlockLevel:(LevelType)type {
	levelUnlocked[type] = YES;
	[self saveProgress:0];
}


@end
