{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}
<div class="bg-content">
<!--============================== content =================================-->
  <div id="content">
    <div class="container">
      <div class="row ">
        <div class="span12">
          <div class="block-404">
            <div class="box-404">
              <h2 sup-widget-text ng-model="meta.title">
                Sorry! Page not found
              </h2>
              <div sup-angular-wysiwyg ng-model="content">
                <p>
                  We can not find the page you are looking for.
                  Maybe the address of the page was wrong.
                  Anyway, click the nav on top to return.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
{% include '_footer.tpl' %}