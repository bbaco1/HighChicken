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
    SKSpriteNode *pobjedonosnaKokos;
    long maxScore;
    long highScore;
    SKSpriteNode *menuNode;

}




-(void)didMoveToView:(SKView *)view{
    [self dodajKokos];
    [self dodajPod];
    [self dodajMenuNode];



}


-(void)dodajKokos{
    
    
    [self loadMaxScore];

    highScore = 0;
    
    kokos = [SKSpriteNode spriteNodeWithImageNamed:@""];
    kokos.size = CGSizeMake(50, 50);
    kokos.position = CGPointMake(self.size.width/2, self.size.height/2);
    kokos.zPosition = 3;
    kokos.physicsBody = [SKPhysicsBody bodyWithTexture:kokos.texture size:kokos.size];
    kokos.physicsBody.allowsRotation = NO;
    
    pobjedonosnaKokos = [SKSpriteNode spriteNodeWithImageNamed:@""];
    pobjedonosnaKokos.size = CGSizeMake(50, 50);
    pobjedonosnaKokos.position = CGPointMake(self.size.width - 200, self.size.height/2);
    pobjedonosnaKokos.zPosition = 3;
   // pobjedonosnaKokos.physicsBody = [SKPhysicsBody bodyWithTexture:kokos.texture size:kokos.size];
    
    
    
    
    [self addChild:kokos];
    [self addChild:pobjedonosnaKokos];


}

-(void)dodajPod {


    SKSpriteNode *pod = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(300, 10)];
    pod.position = CGPointMake(self.size.width/2, self.size.height*0.1);
    pod.zPosition = 1;
    pod.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:pod.size];
    pod.physicsBody.dynamic = NO;
    [self addChild:pod];




}

-(void)dodajAnimacije{
    
    cupka=false;
    leti=false;
    SKTexture *cup0 = [SKTexture textureWithImageNamed:@"kokaCupka0"];
    SKTexture *cup1 = [SKTexture textureWithImageNamed:@"kokaCupka1"];
    SKTexture *cup2 = [SKTexture textureWithImageNamed:@"kokaCupka2"];
    SKTexture *cup3 = [SKTexture textureWithImageNamed:@"kokaCupka3"];
    SKTexture *cup4 = [SKTexture textureWithImageNamed:@"kokaCupka4"];
   
    NSArray *cupArray = @[cup0, cup1, cup2, cup3, cup4, cup3, cup2, cup1];
    SKAction *cupAction =[SKAction animateWithTextures:cupArray timePerFrame:0.1];
    repeatCup = [SKAction repeatActionForever:cupAction];
    //[kokos runAction:repeatCup];
    
    SKTexture *let0 = [SKTexture textureWithImageNamed:@"kokaLeti0"];
    SKTexture *let1 = [SKTexture textureWithImageNamed:@"kokaLeti1"];
    SKTexture *let2 = [SKTexture textureWithImageNamed:@"kokaLeti2"];
    SKTexture *let3 = [SKTexture textureWithImageNamed:@"kokaLeti3"];
    SKTexture *let4 = [SKTexture textureWithImageNamed:@"kokaLeti4"];
    SKTexture *let5 = [SKTexture textureWithImageNamed:@"kokaLeti5"];
    
    NSArray *letArray = @[let0, let1, let2, let3, let4, let5, let4, let3, let2, let1];
    SKAction *letAction =[SKAction animateWithTextures:letArray timePerFrame:0.05];
    repeatLet = [SKAction repeatActionForever:letAction];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    CGPoint p = [[touches anyObject]locationInNode:self];
    SKNode *node = [self nodeAtPoint:p];
    
    
    if (p.y < self.size.height*0.8) {
        
        [kokos.physicsBody applyImpulse:CGVectorMake(0, 25)];
        
        
        
    }
    
   



}

 -(void)dodajMenuNode{
    
     menuNode = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(200, 200)];
     menuNode.position = CGPointMake(self.size.width/2, -200);
     menuNode.zPosition = 1;
     [self addChild:menuNode];
    
    }

-(void)update:(NSTimeInterval)currentTime{


    if (kokos.position.y > self.size.height*0.7) {
        
        menuNode.position = CGPointMake(self.size.width*0.5, self.size.height*0.5);
        highScore ++;
        kokos.physicsBody.dynamic = NO;
        pobjedonosnaKokos.position = kokos.position;
        kokos.position = CGPointMake(-200, 0);
        NSLog(@"%ld", maxScore);
        if (highScore>maxScore) {
            
            [self saveMaxScore];
            
        }
        
        
    }

    if (kokos.position.y > (self.size.height*0.1+kokos.size.height/2 + 20)){
    
        if(!leti){[kokos runAction:repeatLet];leti=true;cupka=false;}
    
    }
    else{
        
        if(!cupka){[kokos runAction:repeatCup];cupka=true;leti=false;}
    
    }



}


-(void)winGame{









}




-(void)loseGame {

    highScore = 0;
    kokos.position = CGPointMake(self.size.width/2, self.size.height/2);
    pobjedonosnaKokos.position = CGPointMake(self.size.width - 200, self.size.height/2);







}


-(void)saveMaxScore{


    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setInteger:maxScore forKey:@"highScore" ];

}

-(void)loadMaxScore{

    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    
    maxScore = [def integerForKey:@"maxScore"];



}



@end
