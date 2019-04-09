import json

def lambda_handler(event, context):
   # print("is Round Trip:", event['isRoundTrip']);
    #print("Start Date:", event['startDate']);
   # print("End Date:", event['endDate']);
    #print("Origin:", event['origin']);
   # print("Destination:", event['destination']);
    validation_message = validate(event)
    if validation_message is None:
        return {
        'statusCode': 200,
        'body': json.dumps(getFlightDetails(event))
        }
    else:
        return {
        'statusCode': 400,
        'body': json.dumps(validation_message)
    }



def validate(event):
    validation_msg = None
    if 'startDate' not in event:
        validation_msg = 'Start Date missing'
        return validation_msg
    if 'origin' not in event:
        validation_msg = 'Origin missing'
        return validation_msg
    if 'isRoundTrip' in event and event['isRoundTrip'] is True and 'endDate' not in event:
        validation_msg = 'End Date missing'
        return validation_msg
    if 'isRoundTrip' in event and event['isRoundTrip'] is True and 'destination' not in event:
        validation_msg = 'Destination missing'
        return validation_msg
    return validation_msg;

def getFlightDetails(event):
    flightDetails = []
    flightDetails.append({'legs': [{'origin': 'DFW', 'destination': 'IAD', 'startDateTime': '03/12/19 15:01 CST', 'endDateTime': '03/12/19 18:01 EST'}]});
    return flightDetails
    