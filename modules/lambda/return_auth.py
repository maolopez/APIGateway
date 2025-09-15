import json


#This function assumes that it receives a token via the Authorization header, verifies the token and then returns a 
# JSON policy document.

def lambda_handler(event, context):
    token = event['authorizationToken']
    principal_id = 'user|a1b2c3d4'
    
    try:
        # Insert your custom authorization logic to validate the token
        if validate_token(token):
            effect = 'Allow'
        else:
            effect = 'Deny'

    except Exception as e:
        print(f'Unauthorized: {e}')
        raise Exception('Unauthorized')

    policy_document = generate_policy(principal_id, effect, event['methodArn'])
    return policy_document


def validate_token(token):
    # TODO: Add your token validation logic here
    # E.g., decode JWT token and verify claims

    # Simulate a token check for demonstration (replace with actual logic)
    if token == "valid-token":
        return True
    else:
        return False


def generate_policy(principal_id, effect, resource):
    auth_response = {'principalId': principal_id}

    if effect and resource:
        policy_document = {
            'Version': '2012-10-17',
            'Statement': [
                {
                    'Action': 'execute-api:Invoke',
                    'Effect': effect,
                    'Resource': resource
                }
            ]
        }
        auth_response['policyDocument'] = policy_document

    return auth_response