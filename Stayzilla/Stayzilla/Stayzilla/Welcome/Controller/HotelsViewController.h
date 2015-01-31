//
//  HotelsViewController.h
//  Stayzilla
//
//  Created by Swapnil Patil on 31/01/15.
//  Copyright (c) 2015 Blackhat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIHelper.h"

@interface HotelsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, APIHelperProtocol>

@property (nonatomic, retain) NSArray *hotelsArray;

@end
