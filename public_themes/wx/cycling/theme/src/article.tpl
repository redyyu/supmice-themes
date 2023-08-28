{% import 'g.tpl' %}
{% include '_css_.tpl' %}

<div class="body wrapper">
  <div class="container clearfix">
    <h1>
      <span sup-widget-text
            default="{{_('Title')}}"
            ng-model="meta.title"></span>
    </h1>
    <div class="date">
      {{meta.date|date_formatted}} | {{meta.author}}
    </div>
    <div class="kv">
      <div sup-widget-media
           ng-model="meta.featured_img">
        <img ng-src="{{meta.featured_img.src || g.cover}}"/>
      </div>
    </div>
    <div>
    </div>
    <article class="clearfix">
      <blockquote>{{meta.description}}</blockquote>
      <div class="text-center"><img src="{{g.deco}}" /></div>
      <div class="content clearfix"
           sup-angular-wysiwyg
           default="{{_('$_CONTENT')}}"
           ng-model="content"
           presets="[
           {'name':_('Separator'),
            'type':'image',
            'figure': g.deco,
            'code':'<div style=&quot;text-align:center;&quot;>
              <img src=&quot;'+g.deco+'&quot; />
              </div><p><br></p>'},
           {'name':_('Slash'),
            'type':'text',
            'figure': g.slash,
            'code':'<div style=&quot;text-align:center;&quot;>
              <img src=&quot;'+g.slash+'&quot; />
              </div><div style=&quot;text-align:center;&quot;><p><b>'+_('Slash Title')+'</b></p></div><p><br></p>'},
           {'name':_('Title'),
            'type':'text',
            'figure': theme_url+'/styles/section-title.jpg',
            'code':'<div style=&quot;text-align:center;&quot;>
              <h2>'+_('Title')+'</h2>
              <div style=&quot;width:96px;height:2px;margin:0 auto;background:#333;&quot;></div></div><p><br></p>'},
           {'name':_('Frame'),
            'type':'text',
            'figure': g.frame_block,
            'code':'<div style=&quot;position:relative;margin:12px auto;width:100%;padding:12px;&quot;><div style=&quot;border:1px solid #333;padding:12px;&quot;><p>Donec quam quam, venenatis consequat congue non, aliquet eget diam. Nullam sit amet tellus sit amet nunc condimentum vestibulum dapibus non eros.</p></div>
              </div><p><br></p>'},
           {'name':_('Photo'),
            'type':'image',
            'figure': theme_url+'/styles/photo.jpg',
            'code':'<div style=&quot;position:relative;margin:12px auto;width:100%;padding:12px;text-align:center;&quot;><div style=&quot;border:1px solid #333;padding:12px;&quot;><img src=&quot;'+g.default+'&quot; style=&quot;max-width:100%;&quot; /></div>
              </div><p><br></p>'},
            {'name':_('Brand'),
            'type':'image',
            'figure': g.brand,
            'code':'<div style=&quot;text-align:center;&quot;>
              <img src=&quot;'+g.brand+'&quot; />
              </div><p><br></p>'},
           ]">
      </div>
    </article>
  </div>

  <footer>
    <div>
      <div class="info">
        <div class="read">{{_('Read')}}</div>
        <div class="count">{{visit.page}}</div>
      </div>
    </div>
    <div class="copyright">
      <span sup-bind-html="site_meta.copyright"></span>
      <span sup-bind-html="site_meta.license"></span>
    </div>
  </footer>
</div>