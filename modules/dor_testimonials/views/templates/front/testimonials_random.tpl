{if $testimonials}
<div id="testimonials-client" class="testimonials-client col-lg-12 col-sm-12 col-xs-12">
  <div id="testimonials-wrapper">
        <ul class="testimonials-slide">
          {foreach from=$testimonials key=test item=testimonial}
            {if $testimonial.active == 1}
              <li >
                <div class="media-content">
                  {if $testimonial.media}
                    {if in_array($testimonial.media_type,$arr_img_type)}
                      <a class="fancybox-media" data-rel="fancybox-button">
                        <img src="{$mediaUrl}{$testimonial.media}" alt="Image Testimonial">
                      </a>
                    {/if}
                  {/if}
                </div>
                <h3 class="testimonials-title">{$testimonial.title_post|truncate:250}</h3>
                <div class="content_test">
                  <p class="des_testimonial">“{$testimonial.content|truncate:1000}"</p>
                </div>
                <div class="testimonial-rate star_content clearfix">
                {section name="i" start=0 loop=5 step=1}
                {if $testimonial.rating le $smarty.section.i.index}
                  <div class="star"></div>
                {else}
                  <div class="star star_on"></div>
                {/if}
                {/section}
                </div>
                <p class="des_namepost"><span class="test-namepost">{$testimonial.name_post}</span>/<span class="test-companypost">{$testimonial.company}</span></p>
              </li>
            {/if}
          {/foreach}
        </ul>
  </div>
</div>
{/if}