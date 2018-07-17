<!-- Block user information module NAV  -->
<h3 class="dor-menu-info-account">{l s="Account"}</h3>
{if $is_logged}
	<div class="header_user_info info-logged">
		<a href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}" title="{l s='View my customer account' mod='blockuserinfo'}" class="account" rel="nofollow"><span><i class="fa fa-user-circle-o"></i>&nbsp;{$cookie->customer_firstname} {$cookie->customer_lastname}</span></a>
	</div>
{/if}
<div class="header_user_info">
	<!-- {if $is_logged}
		<a class="logout" href="{$link->getPageLink('index', true, NULL, "mylogout")|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Log me out' mod='blockuserinfo'}">
			{l s='Sign out' mod='blockuserinfo'}
		</a>
	{else}
		<a class="login" href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Log in to your customer account' mod='blockuserinfo'}">
			{l s='Sign in' mod='blockuserinfo'}
		</a>
	{/if} -->
	<ul class="user-info-lists">
		{$context = Context::getContext()}
		<li class="hidden"><a href="{$link->getPageLink('contact', true)|escape:'html':'UTF-8'}" title="{l s='Contact Us' mod='blockcontact'}">
			<i class="fa fa-phone"></i>{l s='Contact Us' mod='blockuserinfo'}
		</a></li>
		<li><a class="link-myaccount" href="{$link->getPageLink('my-account', true)|escape:'html'}" title="{l s='My account' mod='blockuserinfo'}">
			<i class="fa fa-user-plus"></i>{l s='My account' mod='blockuserinfo'}
		</a></li>
		<li><a class="link-wishlist wishlist_block" href="{$context->link->getModuleLink('blockwishlist', 'mywishlist')}" title="{l s='My wishlist' mod='blockuserinfo'}">
		<i class="fa fa-fw fa-heart"></i>{l s='My wishlist' mod='blockuserinfo'}</a></li>
		{if !$PS_CATALOG_MODE}
		<li><a class="link-mycart" href="{$link->getPageLink('order', true)|escape:'html'}" title="{l s='My cart' mod='blockuserinfo'}">
			<i class="fa fa-shopping-basket"></i>{l s='My cart' mod='blockuserinfo'}</a></li>
		<li><a class="link-mycart" href="{$link->getPageLink('order?step=1', true)|escape:'html'}" title="{l s='My cart' mod='blockuserinfo'}">
			<i class="fa fa-fw fa-usd"></i>{l s='Checkout' mod='blockuserinfo'}</a></li>
		{/if}
		{if $logged}
		<li><a class="logout" href="{$link->getPageLink('index', true, NULL, "mylogout")|escape:'html'}" rel="nofollow" title="{l s='Log me out' mod='blockuserinfo'}"><i class="fa fa-sign-out"></i>{l s='Sign out' mod='blockuserinfo'}</a></li>
		{else}
		<li><a href="#" onclick="return false" class="smartLogin"><i class="fa fa-sign-in"></i>{l s='Sign in popup' mod='blockuserinfo'}</a></li>
		<li><a href="#" onclick="return false" class="smartRegister"><i class="fa fa-user-plus"></i>{l s='Sign up popup' mod='blockuserinfo'}</a></li>
		<li class="last">
			<a class="login" href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Log in to your customer account' mod='blockuserinfo'}">
				<i class="fa fa-users"></i>{l s='Sign in' mod='blockuserinfo'}
				<span>{l s='or' mod='blockuserinfo'}</span>
				{l s='Register' mod='blockuserinfo'}
			</a>
		</li>
		{/if}
	</ul>
</div>
<!-- /Block usmodule NAV -->
