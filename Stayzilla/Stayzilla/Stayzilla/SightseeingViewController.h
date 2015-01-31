//
//  SightseeingViewController.h
//  Stayzilla
//
//  Created by Kiran Juikar on 01/02/15.
//  Copyright (c) 2015 Blackhat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface SightseeingViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) NSArray *placesOfInterest;
@property (nonatomic, retain) IBOutlet UITableView *placeTableView;
@end
