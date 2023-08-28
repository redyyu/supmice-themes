{% import 'g.tpl' %}
{% include '_css.tpl' %}
<div class="container mt">
  <div class="row">
    <div class="colume text-center">
      <h1><span sup-editor-meta ng-model="meta.title"></span></h1>
      <div sup-editor-media ng-model="meta.picture">
        <img src="{{meta.picture.src}}"/>
      </div>
    </div>
  </div>
</div>