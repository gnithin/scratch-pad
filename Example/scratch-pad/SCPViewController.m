//
//  SCPViewController.m
//  scratch-pad
//
//  Created by gnithin on 07/05/2018.
//  Copyright (c) 2018 gnithin. All rights reserved.
//

#import "SCPViewController.h"
#import <scratch_pad/SCPBase.h>


@interface SCPViewController ()
@property (nonnull) NSURLSessionDataTask *sessionTask;
@end

@implementation SCPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"Loading view in SCPViewController");
    
    
    NSString *url = @"https://jsonplaceholder.typicode.com/posts/1";
    NSURLSessionDataTask *task = [SCPBase makeReqFor:url withResponseCallback:^(id responseObj, NSError *respErr) {
        NSLog(@"Got response!");
        NSLog(@"Data - %@", responseObj);
    }];
    
    if(task == nil){
        NSLog(@"Request error");
    }else{
        self.sessionTask = task;
        NSLog(@"Made the request - %@", url);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
