{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}

<div class="editor-top"></div>

<section id="{{meta.slug}}"
         class="common">
  <div class="container">
    <header>
      <h2>
        <span sup-widget-text
              default="{{_('Title')}}"
              ng-model="meta.title"></span>
      </h2>
      <p>
        <span sup-widget-text
              default="{{_('Description text here')}}"
              ng-model="meta.description"></span>
      </p>
    </header>

    <div id="owl-carosuel"
         class="owl-carousel owl-theme is-block">

      <div class="client"
           sup-widget-carousel
           default="{{[
             {
               'title': _('Client Title'),
               'caption': _('Click here to edit the client.'),
               'src': theme_url+'/styles/client1.png'
             },
             {
               'title': _('Client Title'),
               'caption': _('Click here to edit the client.'),
               'src': theme_url+'/styles/client2.png'
             },
             {
               'title': _('Client Title'),
               'caption': _('Click here to edit the client.'),
               'src': theme_url+'/styles/client3.png'
             },
           ]}}"
           ng-model="meta.carousel">
        <h3>{{meta.carousel[0].title}}</h3>
        <img class="thumbnail-img"
             ng-src="{{theme_url}}/styles/trans_cover.png"
             style="{{meta.carousel[0].src|bg_img}}">
        <p>{{meta.carousel[0].caption}}</p>
      </div>

    </div>
  </div>
</section>
