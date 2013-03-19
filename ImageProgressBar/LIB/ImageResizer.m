//
//
//  Created by martin magakian on 15/02/2013.
//
//

#import "ImageResizer.h"




@implementation ImageResizer

@synthesize originalImage;

- (id)initWithImage:(UIImage *)img progressType:(ProgressType)_progressType
{
    self = [super initWithImage:img];
    if (self) {
        self.originalImage = img;
        progressType = _progressType;
    }
    return self;
}

- (void)setCrop:(CGRect)cropRect {
    float imgScale = self.originalImage.scale;
    if (imgScale > 1.0f) {
        cropRect = CGRectMake(cropRect.origin.x * imgScale,
                          cropRect.origin.y * imgScale,
                          cropRect.size.width * imgScale,
                          cropRect.size.height * imgScale);
    }
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([self.originalImage CGImage], cropRect);
    UIImage *newImg = [UIImage imageWithCGImage:imageRef];
    self.image = newImg;
    self.frame = CGRectMake(0, 0, newImg.size.width/imgScale, newImg.size.height/imgScale);
    CGImageRelease(imageRef);
}

-(void) setProgressHeight:(int)progressPercent{
    float currentImgHeight = originalImage.size.height;
    float newImgHeight = (float)(currentImgHeight * progressPercent / 100);
    
    CGRect crop = CGRectMake(0, 0, originalImage.size.width, newImgHeight);
    
    if(progressType == progressTypeTopToBottum){
        [self setCrop:crop];
    }else{
        int paddingTop = currentImgHeight - newImgHeight;
        crop = CGRectMake(0,originalImage.size.height-newImgHeight,originalImage.size.width, newImgHeight);
        [self setCrop:crop];
        self.frame = CGRectMake(0, paddingTop, self.frame.size.width, self.frame.size.height);
    }
}

-(void) setProgressWidth:(int)progressPercent{
    float currentImgWidth = originalImage.size.width;
    float newImgWidth = (float)(currentImgWidth * progressPercent / 100);
    
    CGRect crop = CGRectMake(0, 0, newImgWidth, originalImage.size.height);
    
    if(progressType == progressTypeLeftToRight){
        [self setCrop:crop];
    }else{
        int paddingLeft = currentImgWidth - newImgWidth;
        crop = CGRectMake(paddingLeft,0,newImgWidth, originalImage.size.height);
        [self setCrop:crop];
        self.frame = CGRectMake(paddingLeft, 0, self.frame.size.width, self.frame.size.height);
    }
}

-(void) setProgress: (int) progressPercent{
    
    if(progressType == progressTypeTopToBottum || progressType == progressTypeBottumToTop){
        [self setProgressHeight:progressPercent];
    }else{
        [self setProgressWidth:progressPercent];
    }
}

-(void) dealloc{
    [originalImage release];
    [super dealloc];
}

@end
