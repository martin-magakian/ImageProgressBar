//
//  ViewController.m
//  ImageProgressBar
//
//  Created by martin on 19/03/2013.
//  Copyright (c) 2013 martin magakian. All rights reserved.
//

#import "ViewController.h"

#import "AndroidProgressBar.h"
#import "SmallToHighProgressBar.h"
#import "LinearProgressBar.h"
#import "AndroidLTRProgress.h"

#define PADDING_BOTTOM_PROGRESS 20


@implementation ViewController

@synthesize androidProgress, linearProgress, smallToHighProgress, androidLTRProgress;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    AndroidProgressBar *android = [[[AndroidProgressBar alloc] init] autorelease];
    [android setProgress:35];
    android.frame = CGRectMake(20, android.frame.origin.y, android.frame.size.width, android.frame.size.height);
    [self.view addSubview:android];
    
    LinearProgressBar *linear = [[[LinearProgressBar alloc] init] autorelease];
    [linear setProgress:60];
    linear.frame = CGRectMake(20, android.frame.origin.y+android.frame.size.height+PADDING_BOTTOM_PROGRESS, linear.frame.size.width, linear.frame.size.height);
    [self.view addSubview:linear];
    
    SmallToHighProgressBar *smallToHigh = [[[SmallToHighProgressBar alloc] init] autorelease];
    [smallToHigh setProgress:80];
    smallToHigh.frame = CGRectMake(20, linear.frame.origin.y+linear.frame.size.height+PADDING_BOTTOM_PROGRESS, smallToHigh.frame.size.width, smallToHigh.frame.size.height);
    [self.view addSubview:smallToHigh];
    
    AndroidLTRProgress *androidLTR = [[[AndroidLTRProgress alloc] init] autorelease];
    [androidLTR setProgress:100];
    androidLTR.frame = CGRectMake(20, smallToHigh.frame.origin.y+smallToHigh.frame.size.height+PADDING_BOTTOM_PROGRESS, androidLTR.frame.size.width, androidLTR.frame.size.height);
    [self.view addSubview:androidLTR];
    
    
    self.androidProgress = android;
    self.linearProgress = linear;
    self.smallToHighProgress = smallToHigh;
    self.androidLTRProgress = androidLTR;
    
    loadingButton = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
    [loadingButton setTitle:@"Start Loading..." forState:UIControlStateNormal];
    [loadingButton addTarget:self action:@selector(loadingButtonTouch) forControlEvents:UIControlEventTouchUpInside];
    loadingButton.frame = CGRectMake(100, 340, 150, 40);
    [self.view addSubview:loadingButton];
}

-(void)avanceLoadingFor:(ImageProgressBar *)bar{
    if(bar.progress == 100){
        [bar setProgress:0];
    }else{
        [bar setProgress:bar.progress+1];
    }
}

-(void) avanceAllLoadingBar: (NSTimer *) theTimer {
    [self avanceLoadingFor:self.androidProgress];
    [self avanceLoadingFor:self.linearProgress];
    [self avanceLoadingFor:self.smallToHighProgress];
    [self avanceLoadingFor:self.androidLTRProgress];
}

-(void)loadingButtonTouch{
    [loadingButton setHidden:YES];
    
    timer = [NSTimer scheduledTimerWithTimeInterval: 0.2 target:self selector:@selector(avanceAllLoadingBar:) userInfo:nil repeats: YES];
}

-(void) dealloc{
    [androidProgress release];
    [linearProgress release];
    [smallToHighProgress release];
    [androidLTRProgress release];
    [loadingButton release];
    [timer release];
    [super dealloc];
}



@end
