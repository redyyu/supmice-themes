{% import 'g.tpl' %}
{% include '_header.tpl' %}
<div class="bg-content">
	<!--============================== content =================================-->
	<div id="content">
		<div class="ic"></div>
		<div class="container">
			<div class="row">
				<article class="span8">
					<div sup-editor-media ng-model="meta.photo">
						<img class="thumbnail-img" ng-src="{{theme_url}}/img/bg770.png" style="background-image: url('{{meta.photo.src}}')">
					</div>
				</article>
				<article class="span4">
					<h3><div sup-editor-meta ng-model="meta.title"></div></h3>
					<div sup-angular-wysiwyg ng-model="content">
					  <address class="address-1">
			              <span>Phone:</span>+86 185 1626 2490<br>
			              <span>Wechat:</span>panwenchi001<br>
			              <span>Weibo:</span><a href="http://www.weibo.com/speshowpwc">speshowpwc</a><br>
			              <span>Primary E-mail:</span><a href="mailto:412519653@qq.com">412519653@qq.com</a><br>
			              <span>Alternative E-mail:</span><a href="mailto:minidevinpan@gmail.com">minidevinpan@gmail.com</a><br>
			              <span>Facebook:</span> <a href="http://www.facebook.com/devinpan.photography" class="mail-1">devinpan.photography</a><br>
			              <span>Address:</span>Grewis 8901 Marmora Road Glasgow, D04 89GR.
			          </address>
					</div>
				</article>
			</div>
		</div>
	</div>
</div>
{% include '_footer.tpl' %}