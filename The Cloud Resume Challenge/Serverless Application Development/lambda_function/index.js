import { DynamoDBClient } from "@aws-sdk/client-dynamodb";
import { DynamoDBDocumentClient, GetCommand, PutCommand } from "@aws-sdk/lib-dynamodb";

const client = new DynamoDBClient({});
const dynamo = DynamoDBDocumentClient.from(client);
const tableName = "cloud_resume-test";

export const handler = async (event, context) => {
  let body;
  let statusCode = 200;
  const headers = {
    "Access-Control-Allow-Headers": "*",
    "Access-Control-Allow-Origin": "https://cloud-challenge-resume.cloud", // Allow requests from all origins
    "Access-Control-Allow-Methods": "*", // Allow these HTTP methods
  };

  if (event.httpMethod === 'OPTIONS') {
    return {
      statusCode: 200,
      headers,
      body: JSON.stringify({ message: 'OPTIONS request received' }),
    };
  }

  try {
    const id = 0; // Ensure id is a number
    console.log(`Fetching item with id: ${id}`);

    // Get item from DynamoDB
    const getItemResponse = await dynamo.send(
      new GetCommand({
        TableName: tableName,
        Key: { id },
      })
    );

    if (!getItemResponse.Item) {
      throw new Error('Item not found');
    }

    let views = getItemResponse.Item.views;
    views += 1;

    console.log(`Updating views to: ${views}`);

    // Put item back to DynamoDB with updated views
    await dynamo.send(
      new PutCommand({
        TableName: tableName,
        Item: { id, views },
      })
    );

    body = { views }; // Return the views as a JSON object
  } catch (err) {
    console.error(`Error: ${err.message}`);
    statusCode = 400;
    body = { error: err.message };
  }

  return {
    statusCode,
    body: JSON.stringify(body), // Ensure the response body is a JSON string
    headers,
  };
};
