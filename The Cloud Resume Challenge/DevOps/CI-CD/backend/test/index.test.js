const AWS = require('aws-sdk-mock');
const { handler } = require('./index'); // Update with your actual handler file path

describe('Lambda function tests', () => {
  beforeAll(() => {
    AWS.mock('DynamoDB.DocumentClient', 'get', (params, callback) => {
      callback(null, { Item: { count: 1 } });
    });
    AWS.mock('DynamoDB.DocumentClient', 'put', (params, callback) => {
      callback(null, {});
    });
  });

  afterAll(() => {
    AWS.restore('DynamoDB.DocumentClient');
  });

  test('returns visitor count', async () => {
    const event = {}; // Mock event if necessary
    const result = await handler(event);

    expect(result.statusCode).toBe(200);
    expect(JSON.parse(result.body).count).toBe(1);
  });
});

