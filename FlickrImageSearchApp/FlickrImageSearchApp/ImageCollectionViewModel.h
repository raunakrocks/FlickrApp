//
//  ImageCollectionViewModel.h
//  FlickrImageSearchApp
//
//  Created by Raunak Talwar on 19/05/19.
//  Copyright © 2019 Raunak Talwar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ImageCollectionViewModel : NSObject
@property(nonatomic, strong) NSArray<ImageModel *> *imageCellModels;
    
-(void)searchImagesWithText:(NSString *)searchText
             withCompletion:(void (^)(void))completion;
@end

NS_ASSUME_NONNULL_END
