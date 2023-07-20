{% set topMenu = [
    'index': [
        'title': 'Search',
        'uri': '/index',
        'with_auth': false
    ],
    'submit': [
        'title': 'Report an Address',
        'uri': '/submit/index',
        'with_auth': false
    ],
    'recent': [
        'title': 'Recently Submitted',
        'uri': '/recent/index',
        'with_auth': false
    ],
    'admin': [
        'title': 'Your Account',
        'uri': '/products/index',
        'with_auth': true
    ],
    'pricing': [
        'title': 'API Plans',
        'uri': '/pricing/index',
        'with_auth': false
    ],
    'donations': [
        'title': 'Donations',
        'uri': '/donations/index',
        'with_auth': false
    ]
] %}

<nav class="navbar navbar-expand-lg navbar-light bg-light mb-3">
    <!--<a class="navbar-brand" href="/">ScanBlocks.io</a>-->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            {% for controller, menu in topMenu %}
                {% if (session.has('auth') and menu['with_auth'] === true) or menu['with_auth'] === false %}
                <li class="nav-item {% if controller == dispatcher.getControllerName()|lower %}active{% endif %}">
                    <a class="nav-link" href="{{ menu['uri'] }}">{{ menu['title'] }}</a>
                </li>
                {% endif %}
            {% endfor %}
        </ul>

        <div class="my-2 my-lg-0">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    {% if session.has('auth') %}
                    <a class="nav-link" href="/session/end">Log Out</a>
                    {% else %}
                    <a class="nav-link" href="/session/index">Log In / Sign Up</a>
                    {% endif %}
                </li>
            </ul>
        </div>
    </div>
</nav>


<div class="container" style="margin-bottom:46px;padding-bottom:20px;">
    {{ flash.output() }}
    {{ content() }}
</div>

<div class="container-flex fixed-bottom text-center" style="background-color: #F2F2F2;padding:6px;margin-top:4px;">
    <footer>
        <p><a href="/terms/index">Terms</a> &middot; <a href="/about/index">About</a> &middot; <a href="/dispute/index">Dispute</a> &middot; ScanBlocks.io &copy; {{ date('Y') }}</p>
    </footer>
</div>
