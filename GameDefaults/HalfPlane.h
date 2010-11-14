//
//  HalfPlane.h
//  GameDefaults
//
//  Created by jsantos on 11/14/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameDefaults.Math.classes.h"


@interface HalfPlane : NSObject {
	float distance;
	Vector2 *normal;
}

- (id) initWithNormal:(Vector2*)theNormal distance:(float)theDistance;

+ (HalfPlane*) halfPlaneWithNormal:(Vector2*)theNormal distance:(float)theDistance;

@property (nonatomic) float distance;
@property (nonatomic, retain) Vector2* normal;

@end
