*** Settings ***
Library          MQTTLibrary
Resource    CommonKeywords.robot
*** Variables ***
${topic}=    lb/location/country/get
*** Test Cases ***
MQTT test
    [Tags]  mqtt
    [Setup]     Connect to client
    Subscribe to a topic    topicName=${topic}/response
    Publish An MQTT Request    topicName=${topic}/request
    ${messages}=      Subscribe to a topic   topic=${topic}/response
    Log To Console  Messages=${messages}
    [Teardown]  Disconnect