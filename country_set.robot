*** Settings ***
Library      MQTTLibrary
Library     OperatingSystem
Resource    CommonKeywords.robot

*** Variables ***
${topic}=    lb/location/country/list

*** Test Cases ***
MQTT test
    [Tags]       mqtt
    [Setup]     Connect to client
    Subscribe to a topic    topicName=${topic}    qos=1    
    Publish An MQTT Request    topicName=${topic}    message={"iso3166": "840"}
    ${message}=    Subscribe to a topic    topicName=${topic}    qos=1
    [Teardown]  Disconnect

