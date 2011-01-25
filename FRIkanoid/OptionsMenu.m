//
//  OptionsMenu.m
//  FRIkanoid
//
//  Created by jsantos on 1/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OptionsMenu.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Media.h"
#import "Retronator.Xni.Framework.COntent.Pipeline.Processors.h"
#import "Chomponthis.FRIkanoid.h"

@implementation OptionsMenu

- (void) initialize{
	[super initialize];

	if (frikanoid.mutedSFX) {
		switchSound = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:110 y:130 width:140 height:32] 
											 background:buttonBackground font:retrotype text:@"SFX - Off"];
	} else {
		switchSound = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:110 y:130 width:140 height:32] 
											 background:buttonBackground font:retrotype text:@"SFX - On"];
	}
	
	if (frikanoid.mutedMusic) {
		switchMusic = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:110 y:180 width:140 height:32] 
											 background:buttonBackground font:retrotype text:@"Music - Off"];
	} else {
		switchMusic = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:110 y:180 width:140 height:32] 
											 background:buttonBackground font:retrotype text:@"Music - On"];
	}



	switchSound.labelColor = [Color black];
	switchSound.labelHoverColor = [Color white];
	switchSound.label.position.x = (self.game.window.clientBounds.width/2)-50;
	[switchSound.backgroundImage setScaleUniform:2];
	[scene addItem:switchSound];
	
	switchMusic.labelColor = [Color black];
	switchMusic.labelHoverColor = [Color white];
	switchMusic.label.position.x = (self.game.window.clientBounds.width/2)-55;
	[switchMusic.backgroundImage setScaleUniform:2];
	[scene addItem:switchMusic];
	
	[scene addItem:back];
	Texture2D *logoTexture = [[self.game.content load:@"BigLogo"] autorelease];
	logo = [[Image alloc] initWithTexture:logoTexture position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2)-160 y:30]];
	[scene addItem:logo];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
	[super updateWithGameTime:gameTime];
	
	if (switchSound.wasReleased) {
		if ([switchSound.label.text isEqualToString:@"SFX - On"]) {
			switchSound.label.text = @"SFX - Off";
			frikanoid.mutedSFX = YES;
			[SoundEngine play:MuteSounds];
		} else {
			switchSound.label.text = @"SFX - On";
			frikanoid.mutedSFX = NO;
			[SoundEngine play:MuteSounds];
		}
	}
	
	if (switchMusic.wasReleased) {
		if (frikanoid.mutedMusic) {
			frikanoid.mutedMusic = NO;
			switchMusic.label.text = @"Music - On";
			[MediaPlayer resume];
		} else {
			frikanoid.mutedMusic = YES;
			switchMusic.label.text = @"Music - Off";
			[MediaPlayer pause];
		}

	}
}

- (void) dealloc {
	[logo release];
	
	[switchSound release];

	[super dealloc];
}

@end
