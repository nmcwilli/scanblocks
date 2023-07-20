<br>

<h3>Your profile information</h3>

<p>This is your personal account information that we have an file. You may update/adjust it as required.</p>

<div class="alert alert-warning" role="alert">
  *Note that we will NEVER share or sell your personal information with anyone. The only information that is publicly accessible are the addresses that you post on ScanBlocks. 
</div>

<form action="/products/profile" role="form" method="post" id="profileForm">
    <div class="form-group">
        <label for="name">Your Full Name:</label>
        {{ text_field("name", "size": "30", "class": "form-control") }}
    </div>

    <div class="form-group">
        <label for="email">Email Address:</label>
        {{ text_field("email", "size": "30", "class": "form-control") }}
    </div>

    <input type="button" value="Update" class="btn btn-primary btn-large" onclick="Profile.validate()">
    {{ link_to('products/index', 'Cancel') }}
</form>
