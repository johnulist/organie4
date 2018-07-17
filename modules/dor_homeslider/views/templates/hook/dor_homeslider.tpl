{if $page_name =='index'}
	{if isset($homeslider_slides)}
	<div id="dorSlideShow">
		{if isset($homeslider_slides.0) && isset($homeslider_slides.0.sizes.1)}{capture name='height'}{$homeslider_slides.0.sizes.1}{/capture}{/if}
		<div id="Dor_Full_Slider" style="width: 1300px; height: 550px;">
		    <!-- Loading Screen -->
		    <div class="slider-loading" data-u="loading" style="position: absolute; top: 0px; left: 0px;">
		        <div style="filter: alpha(opacity=70); opacity: 0.7; position: absolute; display: block; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
		        <div class="slider-loading-img"></div>
		    </div>
		    <div class="slider-content-wrapper" data-u="slides">
		    	{foreach from=$homeslider_slides item=slide}
					{if $slide.active}
			        <div class="slider-content effectSlider{$slide.effect}" data-p="225.00" style="display:none;">
			            <img data-u="image" src="{$link->getMediaLink("`$smarty.const._MODULE_DIR_`dor_homeslider/images/`$slide.image|escape:'htmlall':'UTF-8'`")}"{if isset($slide.size) && $slide.size} {$slide.size}{else} width="100%" height="100%"{/if} alt="{$slide.legend|escape:'htmlall':'UTF-8'}" />
			            <div class="product-item-image">
		                    <!-- <img data-u="caption" data-t="0" style="position: absolute; top: -300px; left: 89px; width: 210px; height: 178px;" src="http://cdn.jssor.com/demos/img/present/02/mock-pc.png" />
		                    <img data-u="caption" data-t="1" style="position: absolute; top: 55px; left: -200px; width: 114px; height: 144px;" src="http://cdn.jssor.com/demos/img/present/02/mock-ipad.png" /> -->
		                    {if isset($slide.imageproduct) && $slide.imageproduct != ""}
		                    <img data-u="caption" data-t="2" src="{$slide.imageproduct}" alt="" />
		                    {/if}
		                    {if isset($slide.price) && $slide.price != ""}
		                    <div data-u="caption" data-t="16" class="dor-slider-price">
			                    <div class="price-slider button--sacnite button--round-l">
			                    	<span>-{l s="Only" mod="dor_homeslider"}-</span>
			                    	<span>{$slide.price}</span>
			                    </div>
		                    </div>
		                    {/if}
		                    
		                </div>
			            <div class="dor-info-perslider">
			            	<div class="container">
					            <div class="dor-slider-title" data-u="caption" data-t="81">
					            	{if $slide.type_title == "image"}
					            		<img src="{$slide.title}" alt="">
					            	{else}
					            		{$slide.title|escape:'html':'UTF-8'}
					            	{/if}
					            </div>
					            <div class="dor-slider-caption" data-u="caption" data-t="1">{$slide.legend|escape:'html':'UTF-8'}</div>
					            {if $slide.description}
					            <div class="dor-slider-desc" data-u="caption" data-t="82">{$slide.description}</div>
					            {/if}
					            {if $slide.txtReadmore1 || $slide.txtReadmore2}
					            <div class="slider-read-more" data-u="caption" data-t="3">
					            	{if $slide.txtReadmore1}<a href="{$slide.UrlReadmore1}" class="dor-effect-hzt button--winona" data-text="{$slide.txtReadmore1}"><span>{$slide.txtReadmore1}</span></a>{/if}
					            	{if $slide.txtReadmore2}<a href="{$slide.UrlReadmore2}" class="dor-effect-hzt button--winona" data-text="{$slide.txtReadmore2}"><span>{$slide.txtReadmore2}</span></a>{/if}
					            </div>
					            {/if}
				            </div>
			            </div>
			        </div>
			        {/if}
				{/foreach}
		    </div>
		    <!-- Bullet Navigator -->
		    <div data-u="navigator" class="dorNavSlider" style="bottom:70px;right:16px;" data-autocenter="1">
		        <!-- bullet navigator item prototype -->
		        <div data-u="prototype"></div>
		    </div>
		    <!-- Arrow Navigator -->
		    <span data-u="arrowleft" class="dorArrowLeft" style="" data-autocenter="2"></span>
		    <span data-u="arrowright" class="dorArrowRight" style="" data-autocenter="2"></span>
		</div>
	</div>
	{/if}
{/if}