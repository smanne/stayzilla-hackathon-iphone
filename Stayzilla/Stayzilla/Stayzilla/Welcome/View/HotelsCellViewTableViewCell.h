//
//  HotelsCellViewTableViewCell.h
//  Stayzilla
//
//  Created by Swapnil Patil on 31/01/15.
//  Copyright (c) 2015 Blackhat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotelsCellViewTableViewCell : UITableViewCell

@property(nonatomic, retain) IBOutlet UILabel *name;
@property(nonatomic, retain) IBOutlet UILabel *address;
@property(nonatomic, retain) IBOutlet UILabel *price;
@property(nonatomic, retain) IBOutlet UIImageView *image;
@property(nonatomic, retain) IBOutlet UILabel *ratings;
@property(nonatomic, retain) IBOutlet UIButton *placesNearby;
@property(nonatomic, retain) IBOutlet UIButton *book;
@end
