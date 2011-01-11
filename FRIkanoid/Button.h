//
//  Button.h
//  FRIkanoid
//
//  Created by jsantos on 1/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameDefaults.Mirage.h"
#import "GameDefaults.Scene.Objects.h"
#import "GameDefaults.Scene.h"
#import "GameDefaults.Graphics.h"

@interface Button : NSObject <ISceneUser> {
	id<IScene> scene;
	Image *backgroundImage;
	Label *label;
	
	Rectangle *inputArea;
	BOOL enabled;
	
	BOOL isDown;
	BOOL wasPressed;
	BOOL wasReleased;
	int pressedID;
	
	Color *labelColor, *labelHoverColor, *backgroundColor, *backgroundHoverColor;
}

- (id) initWithInputArea: (Rectangle*)theInputArea background:(Texture2D*)background font:(SpriteFont *)font text:(NSString *) text;

@property (nonatomic, readonly) Rectangle *inputArea;
@property (nonatomic) BOOL enabled;

@property (nonatomic, readonly) BOOL isDown;
@property (nonatomic, readonly) BOOL wasPressed;
@property (nonatomic, readonly) BOOL wasReleased;

@property (nonatomic, readonly) Image *backgroundImage;
@property (nonatomic, readonly) Label *label;

@property (nonatomic, retain) Color *labelColor, *labelHoverColor, *backgroundColor, *backgroundHoverColor;

- (void) update;

@end
