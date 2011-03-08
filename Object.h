#import <Foundation/NSObject.h>
#import <Foundation/NSArray.h>
#import <Property.h>

@interface BioObject: NSObject {
    NSMutableArray* properties;
}
-(BOOL) conforms:(Protocol*)proto;
-(void) addProp:(BioProperty*)property;
-(id) init;
-(void) print;
@end

