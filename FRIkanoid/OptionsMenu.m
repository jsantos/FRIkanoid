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

- (void) initialize{
	[super initialize];

	if (frikanoid.mutedMusic) {
		switchSound = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:110 y:165 width:140 height:32] 
											 background:buttonBackground font:retrotype text:@"Music - Off"];
	} else {
		switchSound = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:110 y:165 width:140 height:32] 
											 background:buttonBackground font:retrotype text:@"Music - On"];
	}

	switchSound.labelColor = [Color black];
	switchSound.labelHoverColor = [Color white];
	switchSound.label.position.x = (self.game.window.clientBounds.width/2)-60;
	[switchSound.backgroundImage setScaleUniform:2];
	[scene addItem:switchSound];
	[scene addItem:back];
	Texture2D *logoTexture = [[self.game.content load:@"BigLogo"] autorelease];
	logo = [[Image alloc] initWithTexture:logoTexture position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2)-160 y:30]];
	[scene addItem:logo];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
	[super updateWithGameTime:gameTime];
	
	if (switchSound.wasReleased) {
		if ([switchSound.label.text isEqualToString:@"Music - On"]) {
			switchSound.label.text = @"Music - Off";
			frikanoid.mutedMusic = YES;
			
			[super stopMusic];
			
			[SoundEngine play:MuteSounds];
		} else {
			switchSound.label.text = @"Music - On";
			frikanoid.mutedMusic = NO;
			
			[super playMusic];
			
			[SoundEngine play:MuteSounds];
		}

		
	}
}

- (void) dealloc {
	[logo release];
	
	[switchSound release];

	[super dealloc];
}

@end
