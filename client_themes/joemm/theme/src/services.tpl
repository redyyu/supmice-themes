{% import 'g.tpl' %}
{% include '_css_.tpl' %}
{% include '_header_.tpl' %}
<div id="orange">
	<div class="container">
		<div class="row centered">
			<div class="col-lg-8 col-lg-offset-2">
  			<h4>
  				<span sup-widget-text
                ng-model="meta.title"
                default="{{_('Title')}}"></span>
  			</h4>
  			<p>
  				<span sup-widget-text
                ng-model="meta.description"
                default="{{_('Description text here')}}"></span>
  			</p>
			</div>
		</div>
	</div>
</div>

<div class="container w">
	<div class="row centered"
       sup-widget-series
       ng-model="meta.gallery">
		<br><br>
    <div>
			<div class="col-sm-6 col-md-4"
           ng-repeat="item in meta.gallery"
           series-item>
				<img class="thumbnail-img"
             ng-src="{{theme_url}}/styles/tbg.png"
             style="background-image: url('{{item.src}}');">
				<h4>{{item.title}}</h4>
				<p>{{item.caption}}</p>
			</div>

			<div class="col-sm-6 col-md-4"
           series-item-create>
				<img ng-src="{{theme_url}}/styles/default_img.jpg">
				<h4>{{_('Create New Item')}}</h4>
				<p>{{_('Click here to create a item.')}}</p>
			</div>

		</div>
	</div>
</div>
{% include '_footer_.tpl' %}
