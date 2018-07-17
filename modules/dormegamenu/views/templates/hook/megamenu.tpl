
<nav class="dor-megamenu col-lg-12 col-sx-12 col-sm-12">
    <div class="navbar navbar-default " role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle open_menu">
                <i class="fa fa-bars"></i>
            </button>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div id="dor-top-menu" class="collapse navbar-collapse navbar-ex1-collapse">
            <div class="close_menu" style="display:none;">
                <span class="btn-close"><i class="fa fa-angle-left"></i></span>
            </div>
            <div class="mobile-logo-menu hidden-lg hidden-md">
                <a href="{if isset($force_ssl) && $force_ssl}{$base_dir_ssl}{else}{$base_dir}{/if}" title="{$shop_name|escape:'html':'UTF-8'}">
                    <img class="logo img-responsive" src="{$tpl_uri|escape:'html':'UTF-8'}img/dorado/logo-menu.png" alt="{$shop_name|escape:'html':'UTF-8'}"/>
                </a>
            </div>
            {$output}{* HTML, can not escape *}
        </div>
    </div>  
</nav>