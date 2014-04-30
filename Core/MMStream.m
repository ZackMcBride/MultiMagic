#import "MMStream.h"

@interface MMStream ()

@property (nonatomic, strong) MCPeerID *peerID;
@property (nonatomic, strong) NSString *streamName;
@property (nonatomic, strong) NSInputStream *stream;

@end

@implementation MMStream

- (instancetype)initWithPeerID:(MCPeerID *)peerID streamName:(NSString *)streamName stream:(NSInputStream *)stream {
    self = [super init];
    if (self) {
        _peerID = peerID;
        _streamName = streamName;
        _stream = stream;
    }
    return self;
}

@end
