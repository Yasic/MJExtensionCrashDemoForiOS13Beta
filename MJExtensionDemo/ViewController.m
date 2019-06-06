//
//  ViewController.m
//  MJExtensionDemo
//
//  Created by yasic on 2019/6/6.
//  Copyright © 2019 yasic. All rights reserved.
//

#import "ViewController.h"
#import <MJExtension/MJExtension.h>
#import <MessageUI/MessageUI.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Class c = [[NSNull null] class];
    while (c) {
        [self testWithClass:c];
        c = class_getSuperclass(c);
    }
    // 下述代码将在 iOS13beta 版上引发 crash
    NSNull *aa = [NSNull null];
    [NSObject mj_objectWithKeyValues:aa];
}

-(void)testWithClass:(Class)c
{
    unsigned int outCount;
    objc_property_t *properties = class_copyPropertyList(c, &outCount);
    for (unsigned int i = 0; i<outCount; i++) {
        NSString *ivarName = [NSString stringWithUTF8String:property_getName(properties[i])];
        if ([ivarName hasPrefix:@"ef_"]) {
            NSLog(@"异常的ivar===%@",ivarName);
        }
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    MFMailComposeViewController *mailPicker = [[MFMailComposeViewController alloc] init];
}


@end
