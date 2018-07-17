{if isset($products) && $products != null}
{assign var='product' value=$products[0]}
<div class="dorDailyDeal">
	<div class="dataDailyDeal clearfix">
		<div class="dailydealInfo">
			<div class="media-dordeal col-lg-6 col-sm-6 col-xs-12">
				<div class="media-deal-inner">
					<a class="product-image product_img_link"   href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}">
						<img class="replace-2x img-responsive" src="{$product.thumb_image}" alt="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" title="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" {if isset($homeSize)}{/if} />
					</a>
				</div>
				{if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
	                <div class="content_price price">
	                    {if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
	                    	<div class="deail-price-main button--sacnite button--round-l">
		                    	<span class="deail-price-txt">-{l s="Only" mod="dor_dailydeals"}-</span>
		                        <span class="product-price {if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}new-price{/if}">
		                        	{if isset($product.price_custom) && $product.price_custom != ""}
		                        		{$product.price_custom}
		                        	{else}
			                            {hook h="displayProductPriceBlock" product=$product type="before_price"}
			                            {if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}
			                        {/if}
		                        </span>
		                        {hook h="displayProductPriceBlock" product=$product type="price"}
		                        {hook h="displayProductPriceBlock" product=$product type="unit_price"}
		                        {hook h="displayProductPriceBlock" product=$product type='after_price'}
	                        </div>
	                    {/if}
	                </div>
	            {/if}
			</div>
			<div class="info-dordeal col-lg-6 col-sm-6 col-xs-12">
				<div class="info-deal-inner">
					<h3><a class="product-image product_img_link"   href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}">{$product.name}</a></h3>
					<h2>{l s="Deal Of The Day"}</h2>
					<div class="deal-desc">
						{$product.description_short}
					</div>
					<div class="productDetailBottomBox">
						<div class="productDetailBottomBox-inner">
							<p id="product_reference">
								<label>{l s='SKU'} </label>
								<span class="editable" data-itemprop="sku"{if !empty($product.reference) && $product.reference} content="{$product.reference}"{/if}>{if !isset($groups)}{$product.reference|escape:'html':'UTF-8'}{/if}</span>
							</p>
							<div class="posted_in">
								<label>{l s='Category'} </label>
				                <a class="posted-category" href="#">{$product.category|escape:'html':'UTF-8'}</a>
				            </div>
				            {if isset($endDate) && $endDate != ""}
				            	<label>{l s='Expire Date'} </label>
				            	<span>{$endDate|date_format:"%d/%m/%Y"}</span>
				            {/if}
						</div>
					</div>
					<div class="countdown-time-data">
	                <div id="daily-countdown-time"></div>
	                {if isset($endDate) && $endDate|escape:'html':'UTF-8' != ""}
	                <script type="text/javascript">
	                    (function () {
	                        if (jQuery("#daily-countdown-time").length) {
	                            $("#daily-countdown-time").countdown("{$endDate|escape:'html':'UTF-8'}", function (event) {
	                                var $this = $(this).html(event.strftime(''
	                                        + '<div class="item-time"><span class="dw-time">%D</span> <span class="dw-txt">-{l s="days"}-</span></div>'
	                                        + '<div class="item-time"><span class="dw-time">%H</span> <span class="dw-txt">-{l s="hours"}-</span></div>'
	                                        + '<div class="item-time"><span class="dw-time">%M</span> <span class="dw-txt">-{l s="mins"}-</span></div>'
	                                        + '<div class="item-time"><span class="dw-time">%S</span> <span class="dw-txt">-{l s="secs"}-</span></div>'));
	                            });
	                        }
	                    }());
	                </script>
	                {/if}
	            	</div>
	            	<div class="action-btn product-action-deals">
		                {if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.customizable != 2 && !$PS_CATALOG_MODE}
		                    {if (!isset($product.customization_required) || !$product.customization_required) && ($product.allow_oosp || $product.quantity > 0)}
		                        {capture}add=1&amp;id_product={$product.id_product|intval}{if isset($product.id_product_attribute) && $product.id_product_attribute}&amp;ipa={$product.id_product_attribute|intval}{/if}{if isset($static_token)}&amp;token={$static_token}{/if}{/capture}
		                        <div class="add-to-cart cart pull-left"><a class="btn btn-shopping-cart btn-outline ajax_add_to_cart_button" href="{$link->getPageLink('cart', true, NULL, $smarty.capture.default, false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart'}" data-id-product-attribute="{$product.id_product_attribute|intval}" data-id-product="{$product.id_product|intval}" data-minimal_quantity="{if isset($product.product_attribute_minimal_quantity) && $product.product_attribute_minimal_quantity >= 1}{$product.product_attribute_minimal_quantity|intval}{else}{$product.minimal_quantity|intval}{/if}">
		                            <span><span><i class="fa fa-shopping-cart"></i></span></span>
		                            {l s='Add to cart'}
		                        </a></div>
		                    {else}
		                        <div class="add-to-cart cart pull-left"><span class="btn btn-shopping-cart btn-outline ajax_add_to_cart_button disabled">
		                            <span><span><i class="fa fa-shopping-cart"></i></span></span>
		                            {l s='Add to cart'}
		                        </span></div>
		                    {/if}
		                {/if}
		                
		                <div class="hidden">
		                    {if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
		                        {if isset($product.online_only) && $product.online_only}
		                            <span class="online_only">{l s='Online only'}</span>
		                        {/if}
		                    {/if}
		                    {if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
		                    {elseif isset($product.reduction) && $product.reduction && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
		                        <span class="discount">{l s='Reduced price!'}</span>
		                    {/if}
		                </div>
		                <div class="add-to-line pull-left">
		                    <div class="dor-cdw-detail"><a href="{$product.link|escape:'html':'UTF-8'}" class="countdown-view-detail" data-toggle="tooltip" title="{l s='View detail'}"><i class="fa fa-search"></i></a></div>
		                    {if isset($comparator_max_item) && $comparator_max_item}
		                        <div class="compare"><a class="btn-highlighted add_to_compare" href="{$product.link|escape:'html':'UTF-8'}" data-id-product="{$product.id_product}" data-toggle="tooltip" title="{l s='Compare'}">
		                            <i class="fa fa-random"></i></a>
		                        </div>
		                    {/if}
		                    {hook h='displayProductListFunctionalButtons' product=$product}
		                </div>
		            </div>
				</div>
			</div>
		</div>
	</div>
</div>
{/if}