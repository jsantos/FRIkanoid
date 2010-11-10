//
//  MovementPhysics.h
//  GameDefaults
//
//  Created by jsantos on 11/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameDefaults.Scene.classes.h"


@interface MovementPhysics : NSObject {

}

+ (void) simulateMovementOn:(id<NSObject>)item withElapsed: (NSTimeInterval)elapsed;


@end
