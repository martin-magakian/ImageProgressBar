//
//  ViewController.h
//  ImageProgressBar
//
//  Created by martin on 19/03/2013.
//  Copyright (c) 2013 martin magakian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageProgressBar.h"

@interface ViewController : UIViewController{
    UIButton *loadingButton;
    NSTimer * timer;
}

@property (retain, nonatomic) ImageProgressBar* androidProgress;
@property (retain, nonatomic) ImageProgressBar* linearProgress;
@property (retain, nonatomic) ImageProgressBar* smallToHighProgress;
@property (retain, nonatomic) ImageProgressBar* androidLTRProgress;

@end
