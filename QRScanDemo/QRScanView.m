//
//  QRView.m
//  QR code
//
//  Created by __无邪_ on 15/1/26.
//  Copyright (c) 2015年 斌. All rights reserved.
//

#import "QRScanView.h"
#import "ZBarSDK.h"

#define kScanLineWidth 1

@interface QRScanView ()<ZBarReaderViewDelegate>{
}
@property (nonatomic, strong) ZBarReaderView *readerView;
@property (nonatomic, strong) UIImageView *indicatorImageView;

@end

@implementation QRScanView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.readerView = [ZBarReaderView new];
        [self.readerView setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self.readerView setReaderDelegate:self];
        [self addSubview:self.readerView];

        self.indicatorImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, kScanLineWidth, frame.size.height - 10 * 2)];
        self.indicatorImageView.backgroundColor = [UIColor greenColor];
        [self addSubview:self.indicatorImageView];
    }
    return self;
}


#////////////////////////////////////////////////////////////////////////////////
#pragma mark - Public
////////////////////////////////////////////////////////////////////////////////

- (void)start{
    [self addAnimated];
    [self.readerView start];
}
- (void)stop{
    [self stopAnimation];
    [self.readerView stop];
}


#pragma mark -- ZBarReaderViewDelegate
- (void)readerView:(ZBarReaderView *)readerView didReadSymbols:(ZBarSymbolSet *)symbols fromImage:(UIImage *)image{
    for(ZBarSymbol *sym in symbols) {
        NSLog(@"扫描成功");
        [self stop];
        
        if ([self.delegate respondsToSelector:@selector(scanView:didScanString:)]) {
            [_delegate scanView:self didScanString:sym.data];
        }
        
        break;
    }
}


#pragma mark -- Animation

- (void)addAnimated{
    
    CGRect frame = CGRectMake(0, 10, kScanLineWidth, self.frame.size.height - 10 * 2);
    [self.indicatorImageView setFrame:frame];
    
    CGFloat aimX = self.bounds.size.width;
    frame.origin.x = aimX;
    NSTimeInterval duration = self.bounds.size.width / 120;
    [UIView animateWithDuration:duration delay:0.1 options:UIViewAnimationOptionRepeat animations:^{
        [self.indicatorImageView setFrame:frame];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)stopAnimation{
    [self.indicatorImageView.layer removeAllAnimations];
    [self.indicatorImageView setFrame:CGRectZero];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
