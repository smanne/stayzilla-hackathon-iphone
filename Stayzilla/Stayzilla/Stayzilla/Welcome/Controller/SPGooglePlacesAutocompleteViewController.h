//
//  SPGooglePlacesAutocompleteViewController.h
//  SPGooglePlacesAutocomplete
//
//  Created by Stephen Poletto on 7/17/12.
//  Copyright (c) 2012 Stephen Poletto. All rights reserved.
//

#import <MapKit/MapKit.h>

@class SPGooglePlacesAutocompleteQuery;
@protocol LocatioanSelectionDelegate <NSObject>

@required
-(void) setPlace:(NSString *) location;

@end

@interface SPGooglePlacesAutocompleteViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate, UISearchBarDelegate> {
    NSArray *searchResultPlaces;
    SPGooglePlacesAutocompleteQuery *searchQuery;
    MKPointAnnotation *selectedPlaceAnnotation;
    
    BOOL shouldBeginEditing;
}

@property(nonatomic) id delegate;

@end
