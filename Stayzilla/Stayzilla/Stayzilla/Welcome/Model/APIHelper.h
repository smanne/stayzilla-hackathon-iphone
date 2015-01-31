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
-(void) didGetOffer:(NSDictionary *) offerDictionary;
-(void) didGetInterestPlaces:(NSArray *) places;


@end

@interface APIHelper : NSObject

@property(nonatomic) id delegate;

-(void) getHotelsForLocation:(NSString *) location
                 checkInDate:(NSString *) checkIn
                checkOutDate:(NSString *) checkOut;

-(void) getSavingOfferForLocation:(NSString *) location
                      checkInDate:(NSString *) checkIn
                     checkOutDate:(NSString *) checkOut
                  userDestination:(NSString *) userDestination;

-(void) getHotelsForLocation:(NSString *) location checkInDate:(NSString *) checkIn checkOutDate:(NSString *) checkOut;
-(void) getInterestPlacesForLocation:(NSString *) location;
- (UIImage*) placePhoto:(NSDictionary*) photoDetails;

@end
