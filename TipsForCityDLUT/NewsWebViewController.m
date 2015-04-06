//
//  NewsWebViewController.m
//  TipsForCityDLUT
//
//  Created by 胡啸晨 on 15/4/5.
//  Copyright (c) 2015年 com.DavidHu. All rights reserved.
//

#import "NewsWebViewController.h"

@interface NewsWebViewController ()

@property (strong, nonatomic) IBOutlet UIWebView *newsWebView;

@end

@implementation NewsWebViewController

- (void) setNewsWebURL:(NSURL *)newsWebURL
{
    _newsWebURL = newsWebURL;
}

- (void) setNewsWebView:(UIWebView *)newsWebView
{
    _newsWebView = newsWebView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSURLRequest *request=[NSURLRequest requestWithURL:_newsWebURL];
    
    [_newsWebView loadRequest:request];
}

@end