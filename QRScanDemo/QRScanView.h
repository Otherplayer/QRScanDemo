//
//  QRScanView.h
//  QR code
//
//  Created by __无邪_ on 15/1/26.
//  Copyright (c) 2015年 斌. All rights reserved.
//

/*扫描二维码部分：
 导入ZBarSDK文件并引入一下框架
 AVFoundation.framework
 CoreMedia.framework
 CoreVideo.framework
 QuartzCore.framework
 libiconv.dylib
 引入头文件#import “ZBarSDK.h” 即可使用
 */

#import <UIKit/UIKit.h>
@class QRScanView;

@protocol QRScanDelegate <NSObject>

- (void)scanView:(QRScanView *)scanView didScanString:(NSString *)result;

@end

@interface QRScanView : UIView
@property (nonatomic, strong) id<QRScanDelegate>delegate;

- (void)start;
- (void)stop;

@end
