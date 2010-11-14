//
//  IHalfPlaneColider.h
//  GameDefaults
//
//  Created by jsantos on 11/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameDefaults.Math.classes.h"

@protocol IHalfPlaneColider<NSObject>

@property (nonatomic, readonly) HalfPlane *halfPlane;

@end
