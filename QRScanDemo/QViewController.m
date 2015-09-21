//
//  QViewController.m
//  QR code
//
//  Created by __无邪_ on 15/1/26.
//  Copyright (c) 2015年 斌. All rights reserved.
//

#import "QViewController.h"
#import <ZBarSDK.h>
#import "QRScanView.h"

@interface QViewController ()<QRScanDelegate>{
    UILabel *resultLabel;
}
@property (nonatomic, strong)ZBarReaderView *readerView;

@property (nonatomic, strong)QRScanView *qrview;
@end

@implementation QViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];    
    
    self.qrview = [[QRScanView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 150)];
    self.qrview.delegate = self;
    [self.view addSubview:self.qrview];
    
    
    
    //result view
    
    resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 250, self.view.frame.size.width, 100)];
    [resultLabel setTextColor:[UIColor blueColor]];
    [resultLabel setNumberOfLines:0];
    [resultLabel setLineBreakMode:NSLineBreakByCharWrapping];
    [self.view addSubview:resultLabel];
    
    
}



- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
//    [self.readerView start];
    [self.qrview start];
}

- (void)scanView:(QRScanView *)scanView didScanString:(NSString *)result{
    NSLog(@"Result : %@",result);
    [resultLabel setText:result];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
