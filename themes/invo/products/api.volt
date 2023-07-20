<br>

<h3>API Key</h3>

<p>On this page you can view the API key associated to your account.</p> 
<p>An API Key allows you to programmatically interface with the ScanBlocks RESTful API.</p>

<br>

<div class="alert alert-warning" role="alert">
  * To get access to our API, please email our support team at <a href="mailto:support@scanblocks.io">support@scanblocks.io</a>. We will ask you some questions, such as how many requests/volumes per day, and learn about your use case a bit more. We are approving initial requests for the most impactful projects that could scale. 
</div>

<br>

<form action="/products/api" role="form" method="post" id="apiForm">

    <div class="form-group">
        <label for="name">Your API Key:</label>

        {{ text_field("apikey", "size": "500", "class": "form-control") }}
        
    </div>

</form>
