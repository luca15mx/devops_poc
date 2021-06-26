import json
import boto3
import random

client = boto3.client('dynamodb')

def lambda_handler(event, context):
    rnd_record = random.randint(1,10)

    data = client.get_item(
      TableName='AMWell_dyndb_devops_poc',
      Key={
          'ID': {
            'N': str(rnd_record)
          }
      }
    )
    return {
        'statusCode': 200,
        'body': json.dumps(data)
    }
