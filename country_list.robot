*** Settings ***
Library      MQTTLibrary
Library     OperatingSystem
Resource    CommonKeywords.robot

*** Variables ***
${topic}=    lb/location/country/list

*** Test Cases ***
MQTT test
    [Tags]  mqtt
    [Setup]     Connect to client
    ${expectedValue}=   get file  countryList.txt
    Subscribe to a topic    topicName=${topic}/response
    Publish An MQTT Request    topicName=${topic}/request
    ${messages}=      Subscribe to a topic   topic=${topic}/response
    Log To Console  Messages=${messages}
    Should Be Equal    ${messages[0]}    ${expectedValue}
    [Teardown]  Disconnect
