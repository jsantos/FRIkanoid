//
//  ICustomCollider.h
//  GameDefaults
//
//  Created by jsantos on 11/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ICustomCollider <NSObject>

- (BOOL) collidingWithItem:(id)item;
- (void) collidedWithItem:(id)item;

@end
