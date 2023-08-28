<sup-set ng-model="g.font_cdn" value="{{gfw?'fonts.useso.com':'fonts.googleapis.com'}}"></sup-set>
<sup-set ng-model="g.default_favicon" value="{{theme_url+'/img/default_favicon.png'}}"></sup-set>

<link rel="stylesheet" ng-href="{{theme_url}}/styles/bootstrap.min.css" type="text/css" media="screen">
<link rel="stylesheet" ng-href="{{theme_url}}/styles/responsive.css" type="text/css" media="screen">
<link rel="stylesheet" ng-href="{{theme_url}}/styles/style.css" type="text/css" media="screen">
<link rel="stylesheet" ng-href="{{theme_url}}/styles/touchTouch.css" type="text/css" media="screen">
<link rel="stylesheet" ng-href="{{theme_url}}/styles/kwicks-slider.css" type="text/css" media="screen">
<style ng-bind="theme_meta.styles"></style>