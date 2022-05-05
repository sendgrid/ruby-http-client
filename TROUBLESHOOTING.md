If you have a SendGrid issue, please contact our [support team](https://support.sendgrid.com).


## Table of Contents
* [Viewing the Request Body](#request-body)

<a name="request-body"></a>
## Viewing the Request Body

When debugging or testing, it may be useful to examine the raw request body to compare against the [documented format](https://sendgrid.com/docs/API_Reference/api_v3.html).

You can do this right before you call: `response = client.version('v3').api_keys.post(request_body: request_body)` like so:

```ruby
puts request_body
```
