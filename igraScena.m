//
//  igraScena.m
//  HighChicken
//
//  Created by Anton Orzes on /9 12/15.
//  Copyright © 2015 Anton Orzes. All rights reserved.
//

#import "igraScena.h"

@implementation igraScena{

    SKSpriteNode *kokos;
    int highScore;

}




-(void)didMoveToView:(SKView *)view{
    [self dodajKokos];
    [self dodajPod];




}


-(void)dodajKokos{

    kokos = [SKSpriteNode spriteNodeWithImageNamed:@""];
    kokos.size = CGSizeMake(50, 50);
    kokos.position = CGPointMake(self.size.width/2, self.size.height/2);
    kokos.zPosition = 3;
    kokos.physicsBody = [SKPhysicsBody bodyWithTexture:kokos.texture size:kokos.size];
    
    
    [self addChild:kokos];


}

-(void)dodajPod {


    SKSpriteNode *pod = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(300, 10)];
    pod.position = CGPointMake(self.size.width/2, self.size.height*0.1);
    pod.zPosition = 1;
    pod.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:pod.size];
    pod.physicsBody.dynamic = NO;
    [self addChild:pod];




}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    CGPoint p = [[touches anyObject]locationInNode:self];
    SKNode *node = [self nodeAtPoint:p];
    
    
    if (node.position.y < self.size.height*0.8) {
        
        [kokos.physicsBody applyImpulse:CGVectorMake(0, 20)];
        
        
        
    }
    
   



}

 -(void)dodajMenuNode{
    
    
    
    
    
    
    
    
    
    
    }





@end
