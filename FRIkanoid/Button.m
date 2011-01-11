//
//  Button.m
//  FRIkanoid
//
//  Created by jsantos on 1/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Button.h"
#import "Chomponthis.FRIkanoid.h"
#import "Retronator.Xni.Framework.Input.Touch.h"
#import "GameDefaults.Control.h"

@implementation Button

- (id) initWithInputArea:(Rectangle*)theInputArea background:(Texture2D*)background font:(SpriteFont*)font text:(NSString*)text {
	self = [super init];
	if (self != nil) {
		inputArea = [theInputArea retain];
		enabled = YES;
		
		backgroundImage = [[Image alloc] initWithTexture:background position:[Vector2 vectorWithX:inputArea.x y:inputArea.y]];
		label = [[Label alloc] initWithFont:font text:text position:[Vector2 vectorWithX:inputArea.x + 10 y:inputArea.y + inputArea.height/2]];
		label.verticalAlign = VerticalAlignMiddle;
		
		self.backgroundColor = [Color white];
		self.backgroundHoverColor = [Color dimGray];
		
		self.labelColor = [Color white];
		self.labelHoverColor = [Color black];
	}
	return self;
}

@synthesize inputArea, enabled, isDown, wasPressed, wasReleased, scene, backgroundImage, label;
@synthesize labelColor, labelHoverColor, backgroundColor, backgroundHoverColor;

- (void) setLabelColor:(Color *)value {
	[value retain];
	[labelColor release];
	labelColor = value;
	label.color = labelColor;
}

- (void) setBackgroundColor:(Color *) value {
	[value retain];
	[backgroundColor release];
	backgroundColor = value;
	backgroundImage.color = backgroundColor;
}

- (void) addedToTheScene:(id <IScene>)theScene {
	//Add child items to scene.
	[theScene addItem:backgroundImage];
	[theScene addItem:label];
}

- (void) removedFromScene:(id <IScene>)theScene {
	//RemoveChildItems
	[theScene removeItem:backgroundImage];
	[theScene removeItem:label];
}

- (void) update {
	if (!enabled) {
		return;
	}
	
	TouchCollection *touches = [TouchPanelHelper getState];
	if (!touches) {
		return;
	}
	
	BOOL wasDown = isDown;
	
	isDown = NO;
	wasPressed = NO;
	wasReleased = NO;
	
	for (TouchLocation *touch in touches){
		if ([inputArea containsVector:touch.position] && touch.state != TouchLocationStateInvalid) {
			if (touch.state == TouchLocationStatePressed) {
				pressedID = touch.identifier;
				wasPressed = YES;
			}
			
			//Only act to the touch that started the push
			if (touch.identifier == pressedID) {
				if (touch.state == TouchLocationStateReleased) {
					wasReleased = YES;
				} else {
					isDown = YES;
				}
			} 
		}
	}
	
	if (isDown && !wasDown) {
		backgroundImage.color = backgroundHoverColor;
		label.color = labelHoverColor;
	} else if (!isDown && wasDown) {
		backgroundImage.color = backgroundColor;
		label.color = labelColor;
	}
}

- (void) dealloc {
	[backgroundImage release];
	[label release];
	[inputArea release];
	[super dealloc];
}

@end
