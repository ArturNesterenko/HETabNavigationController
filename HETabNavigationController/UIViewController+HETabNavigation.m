//
//  UIViewController+HETabNavigation.m
//  proshot
//
//  Created by How Else on 6/14/13.
//  Copyright (c) 2013 itomych studio. All rights reserved.
//

#import "UIViewController+HETabNavigation.h"

@implementation UIViewController (HETabNavigation)

- (HETabNavigationController *)tabNavigationController {
    UIViewController *currentController = self.parentViewController;
    while (currentController && ![currentController isKindOfClass:[HETabNavigationController class]]) {
        if ([currentController.parentViewController isEqual:currentController]) {
            currentController = nil;
        } else {
            currentController = currentController.parentViewController;
        }
    }
    return (HETabNavigationController *)currentController;
}

@end
