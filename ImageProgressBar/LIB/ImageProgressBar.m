//
//
//  Created by martin magakian on 15/02/2013.
//
//

#import "ImageProgressBar.h"



@implementation ImageProgressBar

@synthesize progress;

-(void) createEmptyFeedAndFullImageResource{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override the function %@ in your subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.progress = 0;
        [self createEmptyFeedAndFullImageResource];
        [self initDisplay];
    }
    return self;
}


- (id)init
{
    self = [super init];
    if (self) {
        self.progress = 0;
        [self createEmptyFeedAndFullImageResource];
        [self initDisplay];
    }
    return self;
}

- (void)initDisplay
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, full.frame.size.width, full.frame.size.height);
    
    [self addSubview:empty];
    [self addSubview:feed];
    [self addSubview:full];
}


-(void)setProgress:(int) _progress{
    progress = _progress;
    if(_progress >= 100){
        [empty setProgress:0];
        [feed setProgress:0];
        [full setProgress:100];
        return;
    }
    
    [empty setProgress:100-progress];
    [feed setProgress:progress];
    [full setProgress:0];
}

-(void) dealloc{
    [empty release];
    [feed release];
    [full release];
    [super dealloc];
}


@end
