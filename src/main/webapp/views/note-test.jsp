<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/richtext/richtext.min.css" type="text/css">
    <script type="text/javascript" src="/js/jquery.richtext.min.js"></script>
</head>

<body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" type="text/javascript"></script>
    <textarea name="" id="content" cols="30" rows="10"></textarea>

    <script>
        $('#content').richText();
    </script>
</body>

</html>