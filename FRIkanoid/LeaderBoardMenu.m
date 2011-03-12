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
	
	[scene addItem:background];
	
	if (self.game.window.clientBounds.width == 1024) {
		resetScores = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:self.game.window.clientBounds.width/2-260/2 y:600 width:260 height:32] 
											 background:nil font:retrotype text:@"Reset High Scores"];
		resetScores.labelColor = [Color white];
		resetScores.labelHoverColor = [Color blue];
		//resetScores.label.position.x = (self.game.window.clientBounds.width/2)-100;
		[resetScores.backgroundImage setScaleUniform:2];
		[scene addItem:resetScores];
		
		NSMutableArray *highScores = [frikanoid.progress loadProgress];
		if ([highScores count] != 0) {
			NSArray *sortedScores = [highScores sortedArrayUsingSelector:@selector(compare:)];
			
			firstPlace = [[Label alloc] initWithFont:retrotype text:[NSString stringWithFormat:@"#1 %i", [[sortedScores objectAtIndex:[sortedScores count]-1] integerValue]] position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2)-50 y:400]];
			firstPlace.color = [Color white];
			[scene addItem:firstPlace];
			
			if ([highScores count] > 1) {
				secondPlace = [[Label alloc] initWithFont:retrotype text:[NSString stringWithFormat:@"#2 %i", [[sortedScores objectAtIndex:[sortedScores count]-2] integerValue]] position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2)-50 y:450]];
				secondPlace.color = [Color white];
				[scene addItem:secondPlace];
			}
			
			if ([highScores count] > 2) {
				thirdPlace = [[Label alloc] initWithFont:retrotype text:[NSString stringWithFormat:@"#3 %i", [[sortedScores objectAtIndex:[sortedScores count]-3] integerValue]] position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2)-50 y:500]];
				thirdPlace.color = [Color white];
				[scene addItem:thirdPlace];	
			}
			
		} else {
			placeholder = [[Label alloc] initWithFont:retrotype text:@"No scores to display! Be the first!" position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2)-200 y:400]];
			placeholder.color = [Color white];
			[scene addItem:placeholder];
		}
	} else {
		resetScores = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:self.game.window.clientBounds.width/2-260/3 y:210 width:260 height:32] 
											 background:nil font:retrotype text:@"Reset High Scores"];
		resetScores.labelColor = [Color white];
		resetScores.labelHoverColor = [Color blue];
		//resetScores.label.position.x = (self.game.window.clientBounds.width/2)-100;
		[resetScores.backgroundImage setScaleUniform:2];
		[scene addItem:resetScores];
		
		NSMutableArray *highScores = [frikanoid.progress loadProgress];
		if ([highScores count] != 0) {
			NSArray *sortedScores = [highScores sortedArrayUsingSelector:@selector(compare:)];
			
			firstPlace = [[Label alloc] initWithFont:retrotype text:[NSString stringWithFormat:@"#1 %i", [[sortedScores objectAtIndex:[sortedScores count]-1] integerValue]] position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2)-50 y:110]];
			firstPlace.color = [Color white];
			[scene addItem:firstPlace];
			
			if ([highScores count] > 1) {
				secondPlace = [[Label alloc] initWithFont:retrotype text:[NSString stringWithFormat:@"#2 %i", [[sortedScores objectAtIndex:[sortedScores count]-2] integerValue]] position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2)-50 y:140]];
				secondPlace.color = [Color white];
				[scene addItem:secondPlace];
			}
			
			if ([highScores count] > 2) {
				thirdPlace = [[Label alloc] initWithFont:retrotype text:[NSString stringWithFormat:@"#3 %i", [[sortedScores objectAtIndex:[sortedScores count]-3] integerValue]] position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2)-50 y:170]];
				thirdPlace.color = [Color white];
				[scene addItem:thirdPlace];	
			}
			
		} else {
			placeholder = [[Label alloc] initWithFont:retrotype text:@"No scores to display! Be the first!" position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2)-200 y:150]];
			placeholder.color = [Color white];
			[scene addItem:placeholder];
		}
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
	[back release];
	[super dealloc];
}

@end
