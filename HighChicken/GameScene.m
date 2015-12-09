//
//  GameScene.m
//  HighChicken
//
//  Created by Anton Orzes on /9 12/15.
//  Copyright (c) 2015 Anton Orzes. All rights reserved.
//

#import "GameScene.h"
#import "igraScena.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    
    SKSpriteNode *tipka = [SKSpriteNode spriteNodeWithImageNamed:@"crvenaTipka1"];
    tipka.xScale = 0.5;
    tipka.yScale = 0.3;
    tipka.position = CGPointMake(self.size.width/2, self.size.height - 100);
    tipka.name = @"start";
    [self addChild:tipka];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    CGPoint p = [[touches anyObject]locationInNode:self];
    SKNode *node = [self nodeAtPoint:p];
    if ([node.name isEqualToString:@"start"]) {
        SKScene *igra = [[igraScena alloc]initWithSize:self.size];
        igra.scaleMode = SKSceneScaleModeAspectFill;
        SKTransition *tranzicija = [SKTransition pushWithDirection:SKTransitionDirectionDown duration:0.4];
        [self.view presentScene:igra transition:tranzicija];
    
    
    }


}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
