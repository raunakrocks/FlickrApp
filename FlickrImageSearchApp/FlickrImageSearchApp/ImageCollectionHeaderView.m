//
//  ImageCollectionHeaderView.m
//  FlickrImageSearchApp
//
//  Created by Raunak Talwar on 19/05/19.
//  Copyright © 2019 Raunak Talwar. All rights reserved.
//

#import "ImageCollectionHeaderView.h"
@interface ImageCollectionHeaderView ()
@property(nonatomic, strong) NSString *searchedText;
@end

@implementation ImageCollectionHeaderView
-(id)init {
    self = [super init];
    if(self) {
        self.searchBar.delegate = self;
    }
    return self;
}
    
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    if(![searchBar.text isEqualToString:self.searchedText]) {
        self.searchedText=searchBar.text;
        [self.delegate searchImagesWithText:self.searchedText];
    }
}

@end
