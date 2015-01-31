//
//  AppDelegate.h
//  Stayzilla
//
//  Created by Kiran Juikar on 31/01/15.
//  Copyright (c) 2015 Blackhat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    UINavigationController *navigationController;

}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) UINavigationController *navigationController;
@end
