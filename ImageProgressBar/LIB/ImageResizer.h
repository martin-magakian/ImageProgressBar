//
//
//  Created by martin magakian on 15/02/2013.
//
//

#import <UIKit/UIKit.h>

typedef enum {
    progressTypeLeftToRight,
    progressTypeRightToLeft,
    progressTypeTopToBottum,
    progressTypeBottumToTop
} ProgressType;

@interface ImageResizer : UIImageView{
    ProgressType progressType;
}

@property(nonatomic, retain) UIImage *originalImage;

- (id)initWithImage:(UIImage *)img progressType:(ProgressType) _progressType;
-(void) setProgress: (int) progressPercent;

@end