//
//  GameViewController.m
//  HighChicken
//
//  Created by Anton Orzes on /9 12/15.
//  Copyright (c) 2015 Anton Orzes. All rights reserved.
//

#import "GameViewController.h"
#import "igraScena.h"
#import <sys/sysctl.h>

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    
    NSLog(@"iPhone Device%@",platform);
    
    free(machine);
    
    platforma=6;
    
    //iPhone 4S
    if ([platform isEqualToString:@"iPhone4,1"] || [platform isEqualToString:@"iPad1,1"] || [platform isEqualToString:@"iPad2,1"] || [platform isEqualToString:@"iPad2,2"]|| [platform isEqualToString:@"iPad2,3"] || [platform isEqualToString:@"iPad2,4"] || [platform isEqualToString:@"iPad2,5"] || [platform isEqualToString:@"iPad2,6"] || [platform isEqualToString:@"iPad2,7"] || [platform isEqualToString:@"iPad3,1"] || [platform isEqualToString:@"iPad3,2"] || [platform isEqualToString:@"iPad3,3"] || [platform isEqualToString:@"iPad3,4"] || [platform isEqualToString:@"iPad3,5"] || [platform isEqualToString:@"iPad3,6"] || [platform isEqualToString:@"iPad4,1"] || [platform isEqualToString:@"iPad4,2"] || [platform isEqualToString:@"iPad4,3"] || [platform isEqualToString:@"iPad4,4"] || [platform isEqualToString:@"iPad4,5"] || [platform isEqualToString:@"iPad4,6"] || [platform isEqualToString:@"iPad4,7"] || [platform isEqualToString:@"iPad4,8"] || [platform isEqualToString:@"iPad4,9"] || [platform isEqualToString:@"iPad5,3"] || [platform isEqualToString:@"iPad5,4"]) {platforma=4;}
    
    //iPhone 5s
    if ([platform isEqualToString:@"iPhone5,1"] || [platform isEqualToString:@"iPhone5,2"] || [platform isEqualToString:@"iPhone5,3"] || [platform isEqualToString:@"iPhone5,4"] || [platform isEqualToString:@"iPhone6,1"] || [platform isEqualToString:@"iPhone6,2"]) {platforma=5;}
    
    //iPhone 6
    if ([platform isEqualToString:@"iPhone7,2"] || [platform isEqualToString:@"iPhone8,1"]) {platforma=6;}
    
    //iPhone 6 Plus
    if ([platform isEqualToString:@"iPhone7,1"] || [platform isEqualToString:@"iPhone8,2"]) {platforma=7;}
    
    NSLog(@"Izabrani broj%ld",(long)platforma);

    
    
    
    
    
    

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    /* Sprite Kit applies additional optimizations to improve rendering performance */
    skView.ignoresSiblingOrder = YES;
    
    // Create and configure the scene.
    igraScena *scene = [igraScena nodeWithFileNamed:@"igraScena"];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    //ovo treba za velicinu
    scene = [igraScena sceneWithSize:skView.bounds.size];
    // Present the scene.
    [skView presentScene:scene];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark iAd Delegate Methods


-(void)bannerViewDidLoadAd:(ADBannerView *)banner{
    
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:1];
        [banner setAlpha:1];
        [UIView commitAnimations];
        
}




-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [banner setAlpha:0];
    [UIView commitAnimations];
    
}
 



@end
