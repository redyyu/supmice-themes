{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}
<div class="error-404">
  <div class="error-content"
   sup-angular-wysiwyg
   ng-model="content" 
   default="{{_('$_CONTENT')}}">
  </div>
</div>
