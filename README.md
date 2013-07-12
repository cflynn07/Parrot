Parrot
======

Starter kit for AngularJS SPA w/ NodeJS RESTFul API available to an application via WebSockets (with realtime subscriptions) &amp; HTTP + Pagination, Filtering, Ordering, and expansion of nested resources to three levels.

Features
========

<b>Build clean, RESTFul APIs accessible over websockets & HTTP</b>

GET Requests:
- Pagination
- Ordering
- Filtering
- Nested Resources

Also:
- Bulk POST (posting/creating an array of objects) with detailed responses & intelligent error handling
- Auto subscribe to PUT changes when performing a GET request (socket.io only) for real-time web apps
- Multiple authentication / permission levels

<pre>
GET http://example.com/api/v1/employees?limit=3&offset=1&order=[["firstName","asc"]]&expand=[{"resource":"templates"}]

{
  "code": 200,
  "response": {
    "data": [
      {
        "uid": "b984b960-4022-437c-bce5-98b74138f934",
        "identifier": null,
        "firstName": "David",
        "lastName": "Tavare",
        "email": "david@email.com",
        "phone": "9995995955",
        "username": null,
        "type": "clientDelegate",
        "clientUid": "44cc27a5-af8b-412f-855a-57c8205d86f5",
        "businessDivision0Uid": null,
        "createdAt": "2013-07-01T17:04:54.000Z",
        "updatedAt": "2013-07-01T17:04:54.000Z",
        "deletedAt": null,
        "templates": []
      },
      {
        "uid": "04ad5b05-c9a5-430f-8d5c-8483d5d904e4",
        "identifier": "johann",
        "firstName": "Johann",
        "lastName": "Barlach",
        "email": "johann_barlach@cobarsystems.com",
        "phone": "6177948740",
        "username": "johann",
        "type": "clientSuperAdmin",
        "clientUid": "44cc27a5-af8b-412f-855a-57c8205d86f5",
        "businessDivision0Uid": null,
        "createdAt": "2013-04-10T22:18:16.000Z",
        "updatedAt": "2013-05-30T20:57:56.000Z",
        "deletedAt": null,
        "templates": [
          {
            "uid": "0a291f3d-28ed-40a0-bb65-c104e0783d71",
            "name": "iugiuiuiu",
            "type": "full",
            "clientUid": "44cc27a5-af8b-412f-855a-57c8205d86f5",
            "employeeUid": "04ad5b05-c9a5-430f-8d5c-8483d5d904e4",
            "createdAt": "2013-07-07T17:12:33.000Z",
            "updatedAt": "2013-07-07T17:12:33.000Z",
            "deletedAt": null
          },
          {
            "uid": "c2821f55-ab21-4bc8-b743-8cb53fb4d85e",
            "name": "igigiugo",
            "type": "full",
            "clientUid": "44cc27a5-af8b-412f-855a-57c8205d86f5",
            "employeeUid": "04ad5b05-c9a5-430f-8d5c-8483d5d904e4",
            "createdAt": "2013-07-09T00:32:50.000Z",
            "updatedAt": "2013-07-09T00:32:50.000Z",
            "deletedAt": null
          }
        ]
      },
      {
        "uid": "f755b54f-e918-4fcb-9024-2b48370df4a1",
        "identifier": "michelle",
        "firstName": "Michelle",
        "lastName": "Buchman",
        "email": "michelle_buchman@cobarsystems.com",
        "phone": "9783947015",
        "username": "michelle",
        "type": "clientSuperAdmin",
        "clientUid": "44cc27a5-af8b-412f-855a-57c8205d86f5",
        "businessDivision0Uid": null,
        "createdAt": "2013-04-10T22:18:52.000Z",
        "updatedAt": "2013-04-10T22:18:54.000Z",
        "deletedAt": null,
        "templates": []
      }
    ],
    "length": 4,
    "offset": 1,
    "limit": 3
  }
}
</pre>
