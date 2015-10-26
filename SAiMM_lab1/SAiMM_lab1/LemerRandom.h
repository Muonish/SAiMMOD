//
//  LemerRandom.h
//  SAiMM_lab1
//
//  Created by Valeryia Breshko on 9/3/15.
//  Copyright (c) 2015 Valeria Breshko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LemerRandom : NSObject

- (id)initWithA: (int)a andM: (int)m andRp: (double)Rp;
- (double)next;

@end
