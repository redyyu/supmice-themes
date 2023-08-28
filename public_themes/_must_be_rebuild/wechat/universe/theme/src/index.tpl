{% include '_head_.tpl' %}
<div class="wrapper">
    <header class="bg-cover {{meta.background.class}}"
     style="{{meta.background.style || site_meta.bg.style}}" 
     sup-editor-widget-bg ng-model="meta.background">
        <h1>
            <span sup-editor-meta ng-model="meta.title" default="{{_('Title')}}"></span>
        </h1>
        <div class="date">
            {{meta.date_formatted}} | {{meta.author}}
        </div>
    </header>
    <div class="container clearfix">
        <article class="content clearfix">
            <div default="{{_('$_CONTENT')}}" sup-angular-wysiwyg ng-model="content"></div>
        </article>
    </div>
    {% include '_footer.html' %}
</div>