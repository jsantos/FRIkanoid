//
//  AxisAlignedHalfPlane.h
//  GameDefaults
//
//  Created by jsantos on 11/14/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HalfPlane.h"

@interface AxisAlignedHalfPlane : HalfPlane {
	AxisDirection direction;
}

- (id) initWithDirection:(AxisDirection)theDirection distance:(float)theDistance;

+ (AxisAlignedHalfPlane*) axisAlignedHalfPlaneWithDirection:(AxisDirection) theDirection distance:(float)theDistance;

@property (nonatomic) AxisDirection direction;

@end
