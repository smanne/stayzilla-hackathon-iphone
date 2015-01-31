//
//  ComaparisonTableViewCell.h
//  Stayzilla
//
//  Created by Swapnil Patil on 31/01/15.
//  Copyright (c) 2015 Blackhat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComaparisonTableViewCell : UITableViewCell

@property(nonatomic, retain) IBOutlet UILabel * leftMessage;
@property(nonatomic, retain) IBOutlet UILabel * rightMessage;
@property(nonatomic, retain) IBOutlet UIImageView * featureImage;

@end
