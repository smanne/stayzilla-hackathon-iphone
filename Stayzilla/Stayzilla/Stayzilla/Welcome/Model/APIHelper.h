//
//  APIHelper.h
//  Stayzilla
//
//  Created by Swapnil Patil on 31/01/15.
//  Copyright (c) 2015 Blackhat. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol APIHelperProtocol <NSObject>

@optional
-(void) didGetHotels:(NSArray *) hotels;

@end

@interface APIHelper : NSObject

@property(nonatomic) id delegate;

-(void) getHotelsForLocation:(NSString *) location checkInDate:(NSString *) checkIn checkOutDate:(NSString *) checkOut;

@end
