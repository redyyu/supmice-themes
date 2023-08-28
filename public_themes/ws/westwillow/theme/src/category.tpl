{% import 'g.tpl' %}
{% include '_css.tpl' %}

<div class="wrapper">
  {% include '_header.tpl' %}

  <div class="container prd-container"
       sup-categorize
       ng-model="category">
    <div class="row">

      <div class="col-md-6 prd"
           ng-repeat="term in category.terms">
        <a href="#">
          <img ng-src="{{g.img_holder_cover}}"
               class="img-holder"
               alt="{{term.meta.name}}"
               style="{{(term.meta.figure || g.default_banner)|bg_img}}" />
        </a>
        <h4 class="text-nowrap">{{term.meta.name}}</h4>
      </div>

    </div>
  </div>

  <div class="container prd-container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3 prd">
        <p>{{_('Categorized entries are automatically obtained. '+
               'You can do nothing about it.')}}</p>
      </div>
    </div>
  </div>

</div>

{% include '_footer.tpl' %}