//
//  main.m
//  New-project_20-BlockArraySorter
//
//  Created by Geraint on 2018/5/2.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#import <stdlib.h> // 应用arc4random()函数

#define ArrayElements 10

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        // 创建一个含有随机数值（0~99）的数组
        NSMutableArray *numbers = [NSMutableArray arrayWithCapacity:ArrayElements];
        for (int elem=0; elem<ArrayElements; elem++) {
            unsigned int value = arc4random() % 100; // 数组数值 位于0~99之间
            [numbers addObject:[NSNumber numberWithUnsignedInt:value]];
        }
        
        // 记录未排序的数值
        NSLog(@"Values: %@",numbers);
        
        // ***      以升序方式为数组数值排序
        [numbers sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            if ([obj1 integerValue] > [obj2 integerValue]) {
                return (NSComparisonResult)NSOrderedDescending; // 左侧 大于 右侧
            }
            if ([obj1 integerValue] < [obj2 integerValue]) {
                return (NSComparisonResult)NSOrderedAscending; // 左侧 小于 右侧
            }
            return (NSComparisonResult)NSOrderedSame; // 相等
        }];
        NSLog(@"Value: %@",numbers); // 记录未排序的数值
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
