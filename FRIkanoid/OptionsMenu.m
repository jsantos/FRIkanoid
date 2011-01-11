//
//  OptionsMenu.m
//  FRIkanoid
//
//  Created by jsantos on 1/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OptionsMenu.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.COntent.Pipeline.Processors.h"
#import "Chomponthis.FRIkanoid.h"

@implementation OptionsMenu

- (id) initWithGame:(Game *)theGame {
	self = [super initWithGame:theGame];
	if (self != nil) {
		scene = [[SimpleScene alloc] initWithGame:self.game];
		renderer = [[GuiRenderer alloc] initWithGame:self.game scene:scene];
	}
	return self;
}

- (void) initialize{
	FontTextureProcessor *fontProcessor = [[[FontTextureProcessor alloc] init] autorelease];
	retrotype = [self.game.content load:@"ArkaType12" processor:fontProcessor];
	fivexfive = [self.game.content load:@"5x5" processor:fontProcessor];
	fivexfive.lineSpacing = 14;
	
	buttonBackground = [self.game.content load:@"Button"];
	
	switchSound = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:110 y:165 width:140 height:32] 
									 background:buttonBackground font:retrotype text:@"Sound is On"];

	switchSound.labelColor = [Color black];
	switchSound.labelHoverColor = [Color white];
	switchSound.label.position.x = (self.game.window.clientBounds.width/2)-60;
	[switchSound.backgroundImage setScaleUniform:2];
	[scene addItem:switchSound];
	
	back = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:110 y:215 width:140 height:32] 
									   background:buttonBackground font:retrotype text:@"Back"];
	back.label.position.x = (self.game.window.clientBounds.width/2)-20;
	back.labelColor = [Color black];
	back.labelHoverColor = [Color white];
	[back.backgroundImage setScaleUniform:2];
	[scene addItem:back];
	
	
	Texture2D *logoTexture = [[self.game.content load:@"BigLogo"] autorelease];
	logo = [[Image alloc] initWithTexture:logoTexture position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2)-160 y:30]];
	[scene addItem:logo];
	
	
	[super initialize];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
	for(id item in scene){
		Button *button = [item isKindOfClass:[Button class]] ? item : nil;
		if (button) {
			[button update];
		}
	}
	
	if (back.wasReleased) {
		[frikanoid popState];
	}
	
	if (switchSound.wasReleased) {
		if ([switchSound.label.text isEqualToString:@"Sound is On"]) {
			switchSound.label.text = @"Sound is Off";
			//[SoundEngine stop:Music];
			
			
		} else {
			switchSound.label.text = @"Sound is On";
			[SoundEngine play:MuteSounds];
			//[SoundEngine play:Music];
		}

		
	}
}

- (void) activate {
	[self.game.components addComponent:scene];
	[self.game.components addComponent:renderer];
}

- (void) deactivate {
	[self.game.components removeComponent:scene];
	[self.game.components removeComponent:renderer];
}

- (void) dealloc {
	[logo release];
	
	[switchSound release];
	[back release];
	
	[buttonBackground release];
	
	[retrotype release];
	[fivexfive release];
	
	[scene release];
	[renderer release];
	[super dealloc];
}

@end
