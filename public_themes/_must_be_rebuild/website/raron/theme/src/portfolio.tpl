{% import 'g.tpl' %}
{% include '_css.tpl' %}
<div id="cbp-so-scroller" class="cbp-so-scroller">

  <div id="portfolio" class="clearfix">
    <div class="portfolio-bg"> </div>
    <div class="typo1">
      <div class="wrapper clearfix">
        <div class="section-title">
          <h3 class="heading"><span sup-editor-meta ng-model="meta.title" default="{{_('Title')}}"></span></h3>
          <p class="desc"><span sup-editor-meta ng-model="meta.description" default="{{_('Description text here')}}"></span></p>
        </div>

        <div id="options" class="clearfix">
          <ul id="filters" class="option-set clearfix" data-option-key="filter">
            <li ng-repeat="term in taxonomy.category.terms">
              <a href="#filter" data-option-value=".{{term.slug}}">{{term.title}}</a>
            </li>
            <li><a href="#filter" data-option-value="*" class="selected">All</a></li>
          </ul>
        </div>

      </div>
      <div class="container">
        <ul class="row" sup-query="product" length="8" ng-model="query.products">
          <li class="colume text-center"
           ng-if="tax.category.content_types.indexOf(item.type) > -1"
           ng-repeat="item in query.products">
            <figure sup-editor-open file="item">
              <img ng-src="{{item.picture.src}}" />
            </figure>
          </li>

          <li class="colume text-center"
           ng-if="!query.products || query.products.length == 0">
            <figure>
              <img src="{{theme_url}}/styles/pf-2.jpg" />
            </figure>
          </li>
          <div class="clear"> </div>
        </ul>
      </div>
    </div>
  </div>
</div>
