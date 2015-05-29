//
//  LibraryViewController.m
//  ClassBoxForCityDLUT
//
//  Created by 胡啸晨 on 15/5/28.
//  Copyright (c) 2015年 com.DavidHu. All rights reserved.
//

#import "LibraryViewController.h"
#import "API.h"

@interface LibraryViewController () <UISearchBarDelegate, UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *librarySearchBar;
@property (weak, nonatomic) IBOutlet UIWebView *libraryWebView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation LibraryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;
    
    self.librarySearchBar.keyboardType = UIKeyboardTypeDefault; // 设置弹出键盘的类型
//    self.librarySearchBar.tintColor = [UIColor blueColor]; // 设置UISearchBar的颜色 使用clearColor就是去掉背景
    self.librarySearchBar.placeholder = @"请输入书名"; // 设置提示文字
    self.librarySearchBar.delegate = self; // 设置代理
    self.librarySearchBar.showsCancelButton = YES;
    
    self.libraryWebView.delegate = self;
    
    [self.spinner stopAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 实现取消按钮的方法
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"您点击了取消按钮");
    [searchBar resignFirstResponder]; // 丢弃第一使用者
}

#pragma mark - 实现键盘上Search按钮的方法
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"您点击了键盘上的Search按钮");
    [self.spinner startAnimating];
    [searchBar resignFirstResponder];
    
    [self fetchResult];
}

- (void)fetchResult{
    NSString *bookName = self.librarySearchBar.text;
    NSLog(@"get book : %@", bookName);
    NSString *bookapi = [NSString stringWithFormat:LibraryAPI, bookName];
    
    NSURL *url = [NSURL URLWithString:bookapi];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [_libraryWebView loadRequest:request];

}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    //Check here if still webview is loding the content
    if (webView.isLoading){
        return;
    }
    else{
        [self.spinner stopAnimating];
    }
}

- (void) setLibraryWebView:(UIWebView *)libraryWebView{
    _libraryWebView = libraryWebView;
}

//#pragma mark - 实现监听开始输入的方法
//- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
//    NSLog(@"开始输入搜索内容");
//    
//    return YES;
//}

//#pragma mark - 实现监听输入完毕的方法
//- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
//    NSLog(@"输入完毕");
//    return YES;
//}


@end