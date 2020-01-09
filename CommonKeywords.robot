*** Settings ***
Library          MQTTLibrary

*** Keywords ***
Connect to client
    Connect     broker.mqttdashboard.com    8000    clientId-SZCx3aGp5r    
    
Publish An MQTT Request
    [Arguments]    ${topicName}    ${message}={}
    Publish    topic=${topicName}    message=${message}
    
Subscribe to a topic
    [Arguments]    ${topicName}    ${qos}=2    ${timeout}=1    ${limit}=0
    ${message}=    Subscribe    topic=${topicName}    qos=${qos}    timeout=${timeout}    limit=${limit}
    [Return]    ${message}