//
//  ICustomCollider.h
//  GameDefaults
//
//  Created by jsantos on 11/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "System.h"

@protocol ICustomCollider <NSObject>

@optional
- (BOOL) collidingWithItem:(id)item;
- (void) collidedWithItem:(id)item;

@end
