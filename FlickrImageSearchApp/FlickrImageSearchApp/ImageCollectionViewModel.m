//
//  ImageCollectionViewModel.m
//  FlickrImageSearchApp
//
//  Created by Raunak Talwar on 19/05/19.
//  Copyright © 2019 Raunak Talwar. All rights reserved.
//

#import "ImageCollectionViewModel.h"
#import "ImageSearchService.h"
#import "ImageCache.h"

@interface ImageCollectionViewModel ()
    @property(nonatomic, strong) ImageSearchService *service;
@end

@implementation ImageCollectionViewModel
    
-(id)init {
    self = [super init];
    if(self) {
        self.service = [[ImageSearchService alloc] init];
    }
    return self;
}
    
-(void)searchImagesWithText:(NSString *)searchText
             withCompletion:(void (^)(void))completion {
    [self.service searchImagesWithText:searchText withCompletion:^(NSArray<ImageModel *>  * __nullable result, NSError  * __nullable error) {
        for (ImageModel *model in result) {
            model.image = [self.service getImageForImageModel:model];
        }
        self.imageCellModels = result;
        completion();
    }];
}

@end
