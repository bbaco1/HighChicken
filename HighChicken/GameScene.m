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
    SKSpriteNode *podloga = [SKSpriteNode spriteNodeWithImageNamed:@"kokosinjac2"];
    podloga.size = self.size;
    podloga.position = CGPointMake(self.size.width/2, self.size.height/2);
    podloga.zPosition=0;
    podloga.name = @"podloga";
    [self addChild:podloga];

    SKSpriteNode *kokos = [SKSpriteNode spriteNodeWithImageNamed:@"kokaSjedi"];
    kokos.size = CGSizeMake(200, 200);
    kokos.position = CGPointMake(self.size.width/1.9, self.size.height/3);
    kokos.zPosition=1;
    kokos.name = @"kokos";
    [self addChild:kokos];
    
    
    SKSpriteNode *glava = [SKSpriteNode spriteNodeWithImageNamed:@"glavaKoke"];
    glava.size = CGSizeMake(120, 120);
    glava.position = CGPointMake(80, 80);
    glava.zPosition=1;
    glava.name = @"glava";
    [kokos addChild:glava];

  
    SKSpriteNode *tipka = [SKSpriteNode spriteNodeWithImageNamed:@"crvenaTipka1"];
    tipka.xScale = 1;
    tipka.yScale = 0.5;
    tipka.position = CGPointMake(self.size.width/2, self.size.height - 100);
    tipka.name = @"start";
    tipka.zPosition=1;
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
