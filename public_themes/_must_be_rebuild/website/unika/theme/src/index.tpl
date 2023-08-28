{% import 'g.tpl' %}
{% include '_css.tpl' %}

<section id="text-carousel-intro-section"
 class="parallax {{meta.background.class}}"
 data-stellar-background-ratio="0.5"
 style="{{meta.background.style or site_meta.bg.style}}"
 sup-editor-widget-bg ng-model="meta.background">
    <div class="container">
        <div class="caption text-center text-white" data-stellar-ratio="0.7">
            <div id="owl-intro-text" class="owl-carousel" sup-editor-widget-collect ng-model="meta.carousel">
                <div class="item" ng-repeat="c in meta.carousel">
                    <h1>{{c.name}}</h1>
                    <p>{{c.value}}</p>
                    <div class="extra-space-l"></div>
                </div>

                <div class="item" ng-if="!meta.carousel || meta.carousel.length == 0">
                    <h1>{{_('Name')}}</h1>
                    <p>{{_('Value')}}</p>
                    <div class="extra-space-l"></div>
                </div>
            </div>
        </div>
    </div>
</section>