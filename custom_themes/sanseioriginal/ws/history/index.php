<?php
/* Function to show error and exit */
function error($msg) {
  header("HTTP/1.0 404 Not Found");
  echo $msg;
  exit;
}

/* Context */
// $opts = [
//     "http" => [
//         "method" => "GET",
//         "header" => "Accept-language: en\r\n" .
//             "Cookie: foo=bar\r\n"
//     ]
// ];

// $context = stream_context_create($opts);

/* Request */
$url = "http://www.namabi.com/sansei-original/";

$result = file_get_contents($url, FALSE);
if( FALSE === $result ) {
  error("Cannot get $url .");
}

echo $result;
?>