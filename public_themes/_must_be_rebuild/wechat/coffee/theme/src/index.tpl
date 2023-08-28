{% include '_head_.tpl' %}
<div class="wrapper">
    <div class="container">
        <h1>
            <span sup-editor-meta ng-model="meta.title" default="{{_('Title')}}"></span>
        </h1>
        <div class="featured" sup-editor-media ng-model="meta.featured_img">
            <img ng-src="{{meta.featured_img.src}}" ng-if="meta.featured_img.src">
            <img ng-src="{{theme_url}}/styles/default.png" ng-if="!meta.featured_img.src">
        </div>
        <h4>
            <span sup-editor-meta ng-model="meta.subtitle" default="{{_('Title')}}"></span>
        </h4>
        <div class="date">
            {{meta.date_formatted}} | {{meta.author}}
        </div>
        <article sup-wx-broadcast class="content">
            <div sup-angular-wysiwyg ng-model="cotnent" default="{{_('$_CONTENT')}}"></div>
        </article>
    </div>
</div>