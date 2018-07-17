{*
* 2007-2014 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2014 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
<!-- pos search module TOP -->
<div id="dor_search_top" class="center_column clearfix" >
    <form method="get" action="{$link->getPageLink('search')|escape:'html'}" id="dorsearchbox" class="form-inline">
        <div id="dor-search-header2" class="dor_search form-group">
            <button type="submit" name="submit_search" class="btn btn-default"><i class="fa fa-search"></i></button>
			<input class="search_query form-control" type="text" id="dor_query_top" name="search_query" value="{$search_query|escape:'html':'UTF-8'|stripslashes}" placeholder="{l s='Search...' mod='dor_searchcategories'}" autocomplete="off" />
        </div>
        <label for="dor_query_top"></label>
        <input type="hidden" name="controller" value="search" />
        <input type="hidden" name="orderby" value="position" />
        <input type="hidden" name="orderby" value="categories" />
        <input type="hidden" name="orderway" value="desc" />
        {if $smarty.get.valSelected == ""}
        <input type="hidden" name="valSelected" value="0" />
        {else}
        <input type="hidden" name="valSelected" value="{$smarty.get.valSelected}" />
        {/if}
    </form>
</div>
<!-- /pos search module TOP -->
