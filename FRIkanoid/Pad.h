//
//  Pad.h
//  FRIkanoid
//
//  Created by jsantos on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Chomponthis.FRIkanoid.classes.h"
#import "GameDefaults.Scene.Objects.h"

@interface Pad : NSObject <IParticle>{
	Vector2 *position;
	Vector2 *velocity;
	float radius;
	float mass;
}

@end
