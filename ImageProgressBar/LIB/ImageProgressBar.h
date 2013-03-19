//
//
//  Created by martin magakian on 15/02/2013.
//
//

#import <UIKit/UIKit.h>
#import "ImageResizer.h"

@interface ImageProgressBar : UIView{
    ImageResizer *empty;
    ImageResizer *feed;
    ImageResizer *full;
}
@property(assign, nonatomic) int progress;
-(void) createEmptyFeedAndFullImageResource;

@end
