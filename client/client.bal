import ballerina/http;
import ballerina/io;
public function main() {
    http:WebSocketClient wsClientEp = new ("ws://localhost:9090/basic/ws",
                            config = {callbackService: ClientService});

    var err = wsClientEp->pushText("Hello World!");
    if (err is error) {

        io:println(err);
    }
}

service ClientService = @http:WebSocketServiceConfig {} service {

    resource function onText(http:WebSocketClient conn, string text, boolean finalFrame) {
        io:println(text);
    }

    resource function onError(http:WebSocketClient conn, error err) {
        io:println(err);
    }
};