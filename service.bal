import ballerina/http;

type EmailAlertConfig record {|
    string baseUrl;
    string tokenUrl;
    string clientId;
    string clientSecret;
    string uuid;
    string[] to;
    string[] cc;
    string emailFrom;
    string templateId;
|};

configurable EmailAlertConfig tokenV = ?;

@http:ServiceConfig {
    cors: {
        allowOrigins: ["*"]
    }
}



service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns string|error {
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + name + tokenV.toString();
    }
}
