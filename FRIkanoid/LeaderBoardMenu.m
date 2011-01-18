//
//  LeaderBoardMenu.m
//  FRIkanoid
//
//  Created by jsantos on 1/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LeaderBoardMenu.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"
#import "Chomponthis.FRIkanoid.h"

@implementation LeaderBoardMenu

- (void) initialize{
	[super initialize];

	[scene addItem:back];
	
	Texture2D *logoTexture = [[self.game.content load:@"BigLogo"] autorelease];
	logo = [[Image alloc] initWithTexture:logoTexture position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2)-160 y:30]];
	[scene addItem:logo];
	
	resetScores = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:110 y:210 width:140 height:32] 
										 background:buttonBackground font:retrotype text:@"Reset High Scores"];
	resetScores.labelColor = [Color black];
	resetScores.labelHoverColor = [Color white];
	resetScores.label.position.x = (self.game.window.clientBounds.width/2)-100;
	[resetScores.backgroundImage setScaleUniform:2];
	[scene addItem:resetScores];
	
	NSMutableArray *highScores = [frikanoid.progress loadProgress];
	if ([highScores count] != 0) {
		NSArray *sortedScores = [highScores sortedArrayUsingSelector:@selector(compare:)];
		
		firstPlace = [[Label alloc] initWithFont:oops text:[NSString stringWithFormat:@"#1 %i", [[sortedScores objectAtIndex:[sortedScores count]-1] integerValue]] position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2)-50 y:110]];
		firstPlace.color = [Color white];
		[scene addItem:firstPlace];
		
		if ([highScores count] > 1) {
			secondPlace = [[Label alloc] initWithFont:oops text:[NSString stringWithFormat:@"#2 %i", [[sortedScores objectAtIndex:[sortedScores count]-2] integerValue]] position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2)-50 y:140]];
			secondPlace.color = [Color white];
			[scene addItem:secondPlace];
		}
		
		if ([highScores count] > 2) {
			thirdPlace = [[Label alloc] initWithFont:oops text:[NSString stringWithFormat:@"#3 %i", [[sortedScores objectAtIndex:[sortedScores count]-3] integerValue]] position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2)-50 y:170]];
			thirdPlace.color = [Color white];
			[scene addItem:thirdPlace];	
		}

	} else {
		placeholder = [[Label alloc] initWithFont:retrotype text:@"No scores to display! Be the first!" position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2)-200 y:150]];
		placeholder.color = [Color white];
		[scene addItem:placeholder];
	}

}

- (void) updateWithGameTime:(GameTime *)gameTime {
	[super updateWithGameTime:gameTime];
	
	if (resetScores.wasReleased) {
		[frikanoid.progress deleteProgress];
		[frikanoid popState];
		
	}
}


- (void) dealloc {
	[logo release];
	[back release];
	[super dealloc];
}

@end
