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
    kokos.size = CGSizeMake(180, 180);
    kokos.position = CGPointMake(self.size.width/1.9, self.size.height/3);
    kokos.zPosition=1;
    kokos.name = @"kokos";
    [self addChild:kokos];
    
    
    SKSpriteNode *glava = [SKSpriteNode spriteNodeWithImageNamed:@"glavaKoke"];
    glava.size = CGSizeMake(90, 90);
    glava.position = CGPointMake(65, 22);
    glava.zPosition=1;
    glava.name = @"glava";
    [kokos addChild:glava];
    glava.anchorPoint = CGPointMake(0.5, 0.3);
    
    SKSpriteNode *zjenice = [SKSpriteNode spriteNodeWithImageNamed:@"zjenice"];
    zjenice.size = CGSizeMake(20, 10);
    zjenice.position = CGPointMake(15, 30);
    zjenice.zPosition=2;
    zjenice.name = @"zjenice";
    [glava addChild:zjenice];
    
    SKAction *mov1 =[SKAction moveBy:CGVectorMake(-3, 0) duration:0.3];
    SKAction *mov2 =[SKAction moveBy:CGVectorMake(3, 0) duration:0.6];
    SKAction *mov =[SKAction sequence:@[mov1,mov2]];
    SKAction *repeatMov = [SKAction repeatActionForever:mov];
    [zjenice runAction:repeatMov];

    SKAction *rot1 =[SKAction rotateByAngle:-0.03 duration:0.3];
    SKAction *rot2 =[SKAction rotateByAngle:0.03 duration:0.6];
    SKAction *rot = [SKAction sequence:@[rot1,rot2]];
    SKAction *repeatLop = [SKAction repeatActionForever:rot];
    [glava runAction:repeatLop];
    
    NSString *burstPath =[[NSBundle mainBundle] pathForResource:@"dim" ofType:@"sks"];
    SKEmitterNode *dim2 = [NSKeyedUnarchiver unarchiveObjectWithFile:burstPath];
    dim2.position=CGPointMake(glava.size.width/2-20, -glava.size.height/2+25);
    dim2.zPosition=3;
    dim2.alpha = 0.5;
    dim2.zRotation = -0.30;
    [glava addChild:dim2];
  
    SKSpriteNode *tipka = [SKSpriteNode spriteNodeWithImageNamed:@"start"];
    tipka.xScale = 1;
    tipka.yScale = 1;
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
