{% import 'g.tpl' %}
{% include '_css_.tpl' %}
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
