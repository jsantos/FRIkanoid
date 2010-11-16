//
//  Brick.h
//  FRIkanoid
//
//  Created by jsantos on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Chomponthis.FRIkanoid.classes.h"
#import "GameDefaults.Scene.Objects.h"

@interface Brick : NSObject <IParticle>{
	Vector2 *position;
	Vector2 *velocity;
	float radius;
	float mass;
	float width;
	float height;
}

@property (nonatomic) float width;
@property (nonatomic) float height;

@end
