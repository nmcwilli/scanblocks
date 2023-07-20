<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>ScanBlocks.io - Scan blockchain addresses to identify malicious actors.</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="description" content="Scan blockchain addresses to identify malicious actors">
    <meta name="author" content="ScanBlocks">

    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-GRCZ6KYWKK"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());

      gtag('config', 'G-GRCZ6KYWKK');
    </script>

    <!-- Load the google reCaptcha API -->
    <script src="https://www.google.com/recaptcha/api.js"></script>

    <!-- Hide google reCaptcha bottom right badge -->
    <style>
    .grecaptcha-badge { 
      visibility: hidden;
    }
    </style>

</head>
<body>
{{ content() }}

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

<!-- Adding a google reCaptcha callback function to handle the token --> 
<script>
function onSubmit(token) { 
  if (document.URL.indexOf("products/index") >= 0){ 
    document.getElementById("productsForm").submit(); 
  } else if (document.URL.indexOf("submit/index") >= 0){ 
    document.getElementById("submitForm").submit(); 
  } else if (document.URL.indexOf("dispute/index") >= 0){ 
    document.getElementById("disputeForm").submit(); 
  } 
} 
</script>

<!-- Or you can include files via volt function -->
{{ javascript_include('js/utils.js') }}
</body>
</html>
