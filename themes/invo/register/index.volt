<br>

<div class="page-header">
    <h2>Sign Up</h2>
</div>

<form action="/register" role="form" method="post">
    <fieldset>

        <div class="control-group">
            {{ form.label('name', ['class': 'control-label']) }} <span class="help-block">*</span>
            <div class="controls">
                {{ form.render('name', ['class': 'form-control']) }}
            </div>
        </div>


        <div class="control-group">
            {{ form.label('username', ['class': 'control-label']) }} <span class="help-block">*</span>
            <div class="controls">
                {{ form.render('username', ['class': 'form-control']) }}
                
            </div>
        </div>

        <div class="control-group">
            {{ form.label('email', ['class': 'control-label']) }} <span class="help-block">*</span>
            <div class="controls">
                {{ form.render('email', ['class': 'form-control']) }}
            </div>
        </div>

        <div class="control-group">
            {{ form.label('password', ['class': 'control-label']) }} <span class="help-block">* (Minimum of 8 chars)</span>
            <div class="controls">
                {{ form.render('password', ['class': 'form-control']) }}
            </div>
        </div>

        <div class="control-group">
            <label class="control-label" for="repeatPassword">Repeat Password</label> <span class="help-block">*</span>
            <div class="controls">
                {{ password_field('repeatPassword', 'class': 'form-control') }}
            </div>
        </div>

        <br>

        <div class="form-actions">
            {{ submit_button('Register', 'class': 'btn btn-primary', 'onclick': 'return SignUp.validate();') }}
            <p class="help-block">By registering an account, you understand and consent to our <a href="/terms/index" target="_blank">Terms of Use</a>.</p>
        </div>
    </fieldset>
</form>
