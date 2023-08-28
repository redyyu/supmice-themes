{% include 'g.tpl' %}
{% include '_css.tpl' %}

<div id="wrapper">
	{% include '_header.tpl' %}
	<!-- Tagline -->
	<div class="container">
		<section class="jumbotron">
			<h1 sup-widget-text
          ng-model="meta.tagline"
          default="{{_('Tagline')}}">
      </h1>
		</section>
	</div>
	<!-- #Tagline -->
	<!-- Contents -->
	<div class="container">
		<section class="row works-list"
             sup-query="works"
             perpage="11"
             ng-model="query.portfolio">

      <figure class="col-md-3 col-sm-6 create">
        <div sup-widget-create
             type="works">
          <a href="#">
  			    <figcaption>{{works.title}}</figcaption>
  			    <img ng-src="{{g.trans}}"
                 style="{{g.add_img|bg_img}}"/>
          </a>
        </div>
			</figure>

      <figure class="col-md-3 col-sm-6"
              ng-repeat="works in query.portfolio.contents">
        <div sup-widget-open="works">
          <a href="#">
  			    <figcaption>{{works.title}}</figcaption>
  			    <img ng-src="{{g.trans}}"
                 style="{{works.featured_img.src|thumbnail|bg_img}}"
                 alt="{{works.title}}" />
          </a>
        </div>
			</figure>
		</section>
		<section class="row">
			<div class="col-md-3 pull-right more">
				<a class="btn-more"
           ng-if="query.portfolio.contents.length > g.perpage"
           href="#more">
          {{_('More')}}
        </a>
			</div>
		</section>
	</div>
	<!-- #Contents -->
	{% include '_footer.tpl' %}
</div>