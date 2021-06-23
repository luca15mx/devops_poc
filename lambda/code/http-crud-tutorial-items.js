const AWS = require("aws-sdk");

const dynamo = new AWS.DynamoDB.DocumentClient();

exports.handler = async (event, context) => {
  let body;
  let statusCode = 200;
  const headers = {
    "Content-Type": "application/json"
  };

  try {
    switch (event.routeKey) {
      case "DELETE /items/{id}":
        await dynamo
          .delete({
            TableName: "AMWell_dyndb_devops_poc",
            Key: {
              ID: parseInt(event.pathParameters.id, 10)
            }
          })
          .promise();
        body = `Deleted item ${event.pathParameters.id}`;
        break;
      case "GET /items/{id}":
        body = await dynamo
          .get({
            TableName: "AMWell_dyndb_devops_poc",
            Key: {
              ID: parseInt(event.pathParameters.id, 10)
            }
          })
          .promise();
        break;

      case "GET /items":
        //body = await dynamo.scan({ TableName: "AMWell_dyndb_devops_poc" }).promise();

         body = await dynamo
        .get({
          TableName: "AMWell_dyndb_devops_poc",
          Key: {
            ID: between(1,10)
          }
        })
        .promise();

        break;

      case "PUT /items":
        let requestJSON = JSON.parse(event.body);
        await dynamo
          .put({
            TableName: "AMWell_dyndb_devops_poc",
            Item: {
              ID: requestJSON.id,
              Word: requestJSON.word
            }
          })
          .promise();
        body = `Put item ${requestJSON.id}`;
        break;

      default:
        throw new Error(`Unsupported route: "${event.routeKey}"`);
    }
  } catch (err) {
    statusCode = 400;
    body = err.message + " ** Event Key ** " + event.routeKey;
  } finally {
    body = JSON.stringify(body);
  }

function between(min, max) {
  return Math.floor(
    Math.random() * (max - min) + min
  )
}

  return {
    statusCode,
    body,
    headers
  };
};
