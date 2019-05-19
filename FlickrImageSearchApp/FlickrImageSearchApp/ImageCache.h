//
//  ImageCache.h
//  FlickrImageSearchApp
//
//  Created by Raunak Talwar on 19/05/19.
//  Copyright © 2019 Raunak Talwar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ImageModel.h"


@interface ImageCache : NSObject
+(id)instance;
-(UIImage *)getImageForModel:(ImageModel *)model;
-(void)setImageForModel:(ImageModel *)model image:(UIImage *)image;
@end


