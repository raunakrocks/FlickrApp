//
//  ImageSearchService.h
//  FlickrImageSearchApp
//
//  Created by Raunak Talwar on 19/05/19.
//  Copyright © 2019 Raunak Talwar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageModel.h"
#import <UIKit/UIKit.h>


typedef void(^onComplete) (NSArray<ImageModel *>  * __nullable result, NSError  * __nullable error);

@interface ImageSearchService : NSObject
-(void)searchImagesWithText:(NSString *)searchText
             withCompletion:(nullable onComplete)completion;
-(UIImage *)getImageForImageModel:(ImageModel *)model;
@end

