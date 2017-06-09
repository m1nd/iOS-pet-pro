//
//  VNLoginViewController.m
//  APITest
//
//  Created by m1nd on 21.03.15.
//  Copyright (c) 2015 m1nd. All rights reserved.
//

#import "VNLoginViewController.h"
#import "VNAccessToken.h"

@interface VNLoginViewController () <UIWebViewDelegate>

@property (copy, nonatomic) VNLoginCompletionBlock completionBlock;
@property (weak, nonatomic) UIWebView *webView;
@end

@implementation VNLoginViewController

- (id)initWithCompletionBlock:(VNLoginCompletionBlock) completionBlock;
{
    self = [super init];
    if (self) {
        self.completionBlock = completionBlock;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect r = self.view.bounds;
    r.origin = CGPointZero;
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:r];

    webView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
   
    [self.view addSubview:webView];
    
    self.webView = webView;
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                         target:self
                                                                         action:@selector(actionCancel:)];
    [self.navigationItem setRightBarButtonItem:item animated:NO];
    
    self.navigationItem.title = @"Login";
 
/*
    NSString *urlString =
                           @"https://oauth.vk.com/authorize?"
                           "client_id=79541794&"
                           "scope=139286&" //+2 +4 (+8) +16 +131072 +8192 (139294)/139286
                           "redirect_uri=hello.there&"
                           "display=mobile&"
                           "v=5.29&"
                           "response_type=token&"
                            "revoke=1";
   
    NSString *urlString = @"http://www.google.ru";
 */
   
    NSString *urlString =
    @"https://oauth.vk.com/authorize?"
    "client_id=4849300&"
    "scope=139294&" //+2 +4 (+8) +16 +131072 +8192 (139294)/139286
    "redirect_uri=https://oauth.vk.com/blank.html&"
    "display=mobile&"
    "v=5.29&"
    "response_type=token&"
    "revoke=1";
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    webView.delegate = self;
    
    [webView loadRequest:request];
    
    NSLog(@"%@", [request URL]);
    
}

- (void)dealloc {
    
    self.webView.delegate = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Actions

- (void)actionCancel:(UIBarButtonItem *) item{
    
    if (self.completionBlock) {
        self.completionBlock(nil);
    }
    
    [self dismissViewControllerAnimated:YES
                             completion:nil];

}

#pragma mark - UIWebDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {

    NSLog(@"%@", [request URL]);
    
    if ([[[request URL]description]rangeOfString:@"#access_token="].location != NSNotFound) {
        
        VNAccessToken *token = [[VNAccessToken alloc]init];
        
        NSString *query = [[request URL] description];
        
        NSArray *array = [query componentsSeparatedByString:@"#"];
        
        if ([array count] > 1) {
            query = [array lastObject];
        }
        
        NSArray *pairs = [query componentsSeparatedByString:@"&"];
        
        for (NSString *pair in pairs) {
            
            NSArray *values = [pair componentsSeparatedByString:@"="];
            
            if ([values count] == 2) {
                
                NSString *key = [values firstObject];
                
                if ([key isEqualToString:@"access_token"]) {
                    token.token = [values lastObject];
                } else if([key isEqualToString:@"expires_in"]) {
                    
                    NSTimeInterval interval = [[values lastObject] doubleValue];
                    token.expirationDate = [NSDate dateWithTimeIntervalSinceNow:interval];
                    
                } else if([key isEqualToString:@"user_id"]) {
                    
                    token.userID = [values lastObject];
                }

            }
        }
        
        self.webView.delegate = nil;
        
        if (self.completionBlock) {
            self.completionBlock(token);
        }
        [self dismissViewControllerAnimated:YES
                                 completion:nil];
        
        return NO;
    }
    
    return YES;

}

@end
