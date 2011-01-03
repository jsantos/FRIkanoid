//
//  Boundary.h
//  FRIkanoid
//
//  Created by jsantos on 11/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameDefaults.Math.h"
#import "GameDefaults.Scene.Objects.h"

@interface Boundary : NSObject <IAxisAlignedHalfPlaneCollider, ICustomCollider>{
	AxisAlignedHalfPlane *boundary;
}


- (id) initWithLimit:(AxisAlignedHalfPlane *)theBoundary;

- (AxisAlignedHalfPlane *) axisAlignedHalfPlane;

- (HalfPlane *) halfPlane;
@end


