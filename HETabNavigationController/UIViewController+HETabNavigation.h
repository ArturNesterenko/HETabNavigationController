//
//  UIViewController+HETabNavigation.h
//  proshot
//
//  Created by How Else on 6/14/13.
//  Copyright (c) 2013 itomych studio. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HETabNavigationController.h"

@interface UIViewController (HETabNavigation)

@property (nonatomic, weak, readonly) HETabNavigationController *tabNavigationController;

@end
