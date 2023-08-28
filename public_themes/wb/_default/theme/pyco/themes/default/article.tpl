<sup-set ng-model="g.ver" value="{{theme_meta.version}}"></sup-set><sup-set ng-model="g.default_pic"         value="{{theme_url+'/styles/default.jpg'}}"></sup-set><sup-set ng-model="g.opts" object="theme_meta.options"></sup-set>
<!-- reset css -->
<link ng-href="{{theme_url}}/styles/reset.css?{{g.ver}}"
      rel="stylesheet">

<!-- theme css -->
<link ng-href="{{theme_url}}/styles/style.css?{{g.ver}}"
      rel="stylesheet" />

<style ng-bind-html="theme_meta.styles"></style>
<div class="outer">
  <div class="masthead">
    <a href="#">
      &rarr; {{_('Chapter')}}
    </a>
  </div>

  <article class="container">
    <header>
      <h2>
        <span sup-widget-text
            default="{{_('Title')}}"
            ng-model="meta.title"></span>
      </h2>
    </header>
    <div class="content clearfix"
             sup-angular-wysiwyg
             default="{{_('$_CONTENT')}}"
             ng-model="content">
    </div>
  </article>

  <aside>
    <ul class="paginator">
      <li class="previous">
        <a href="#">
          {{_('Previous article')}}
        </a>
      </li>
      <li class="next">
        <a href="#">
          {{_('Next article')}}
        </a>
      </li>
    </ul>
  </aside>
</div>
