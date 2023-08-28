{% import 'g.tpl' %}
{% include '_css_.tpl' %}
<div>
  <section id="{{meta.slug}}"
           class="section showreel {{meta.hero.class}}"
           style="{{meta.hero.style}}">
    <div class="slide"
         style="{{meta.carousel[0].src|bg_img}}">
      <div class="container"
           sup-widget-carousel
           default="{{g.carousel}}"
           ng-model="meta.carousel">
        <h4>{{meta.carousel[0].title}}</h4>
        <p>{{meta.carousel[0].caption}}<p>
      </div>
    </div>
  </section>
</div>