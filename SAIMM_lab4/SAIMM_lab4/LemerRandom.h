//
//  LemerRandom.h
//  SAIMM_lab4
//
//  Created by Valeryia Breshko on 11/11/15.
//  Copyright © 2015 Valeria Breshko. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MAX_NUMBER 60000
//#define CONST_A 1003
//#define CONST_M 9983
//#define CONST_Rp 1

#define CONST_A 48271
#define CONST_M 65537
#define CONST_Rp 47629

@interface LemerRandom : NSObject

- (id)init;
- (double)next;
- (NSMutableArray*)nextN: (int)number;

@end
