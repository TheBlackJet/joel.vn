<?php include( DIR_TEMPLATE . '/egestas-pro/includes/megamenu.tpl' );?>
<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php if($this->config->get('kuler_compress_styles')) { ?>
<?php echo $this->config->get('kuler_compress_styles') ?>
<?php } else { ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/egestas-pro/stylesheet/general.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/egestas-pro/stylesheet/layout.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/egestas-pro/stylesheet/pages.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/egestas-pro/stylesheet/chosen.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/egestas-pro/stylesheet/modules.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/egestas-pro/stylesheet/responsive.css" />
<?php if ($this->config->get('kuler_cp_settings') && $preset = $this->getChild('module/kulercp/usePreset')) { ?>
<link rel="stylesheet" href="<?php echo $preset; ?>" />
<?php } ?>
<?php if ($this->config->get('kuler_cp_custom_scheme') && $color_scheme = $this->getChild('module/kulercp/colorScheme')) { ?>
<?php echo $color_scheme ?>
<?php } ?>
<?php if ($this->config->get('kuler_cp_settings') && $file_custom_css = $this->getChild('module/kulercp/useCustomCSS')) { ?>
<link rel="stylesheet" href="<?php echo $file_custom_css; ?>" />
<?php } ?>
<?php } ?>
<!-- google fonts -->
<?php include( DIR_TEMPLATE . '/egestas-pro/includes/google_fonts.tpl' );?>
<!-- google fonts /-->
<?php if(!$this->config->get('kuler_compress_styles') || $this->config->get('kuler_compress_style_type') == 'theme') { ?>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<?php } ?>
<?php foreach ($styles as $style) { ?>
<?php if($this->config->get('kuler_compress_style_type') == 'all' && strpos($style['href'], 'catalog/view') === 0) { continue; } ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<?php if(!$this->config->get('kuler_compress_scripts') || $this->config->get('kuler_compress_script_type') == 'theme') { ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
<?php } ?>
<?php if($this->config->get('kuler_compress_scripts')) { ?>
<?php echo $this->config->get('kuler_compress_scripts') ?>
<?php } else { ?>
<script type="text/javascript" src="catalog/view/theme/egestas-pro/js/chosen.js"></script>
<script type="text/javascript" src="catalog/view/theme/egestas-pro/js/utils.js"></script>
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<?php if($this->config->get('kuler_compress_script_type') == 'all' && strpos($script, 'catalog/view') === 0) { continue; } ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<!--[if lte IE 8]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/egestas-pro/stylesheet/ie.css" />
<![endif]-->
<?php if ($stores) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
<?php foreach ($stores as $store) { ?>
$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
<?php } ?>
});
//--></script>
<?php } ?>
<?php if($this->config->get('kuler_analytics_position') == 'head') echo $this->config->get('kuler_analytics_code'); ?>
<script>
// Active the home item if there is no active item
$(document).ready(function () {
	if ( ! $('.mainmenu').find('.active').length) {
		$('.mainmenu > li:eq(0)').addClass('active');
	}
});
</script>
</head>
<body class="primary-define color-<?php echo $this->config->get('kuler_theme_color') ? $this->config->get('kuler_theme_color') : 'teal'; ?><?php if (preg_match('#MSIE (.+?);#', $this->request->server['HTTP_USER_AGENT'], $matches) && intval($matches[1]) < 9) echo ' is-ie'; ?><?php echo ((empty($_GET['_route_']) && empty($_GET['route'])) || (isset($_GET['route']) && $_GET['route'] == 'common/home')) ? ' home' : '' ?>">
<div id="header">
	<div id="topbar">
		<div class="wrapper clearafter"> <?php echo $language; ?> <?php echo $currency; ?>
			<div id="welcome">
				<?php if (!$logged) { ?>
				<?php echo $text_welcome; ?>
				<?php } else { ?>
				<?php echo $text_logged; ?>
				<?php } ?>
			</div>
			<div class="links"> <a href="<?php echo $wishlist; ?>" id="wishlist-total" class="icon-wishlist-white"><?php echo $text_wishlist; ?></a> <a href="<?php echo $account; ?>" id="link-account" class="icon-user-white"><?php echo $text_account; ?></a> <a href="<?php echo $shopping_cart; ?>" id="link-cart" class="icon-cart-white"><?php echo $text_shopping_cart; ?></a> <a href="<?php echo $checkout; ?>" id="link-checkout" class="icon-checkout-white"><?php echo $text_checkout; ?></a> </div>
		</div>
	</div>
	<div id="toppanel">
		<div class="wrapper clearafter">
			<?php if ($logo) { ?>
			<div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
			<?php } ?>
			<?php echo $cart; ?>
			<?php if (($kuler_finder = $this->config->get('kuler_finder')) && $kuler_finder['status']) { ?>
			<?php echo $this->getChild('module/kuler_finder', $kuler_finder); ?>
			<?php } else { ?>
			<div id="search">
				<div id="search-inner">
					<div class="button-search"></div>
					<input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
				</div>
			</div>
			<?php } ?>
		</div>
	</div>
	<?php if ($categories) { ?>
	<div id="menu">
		<div id="menu-inner">
			<div class="wrapper clearafter"> <span id="btn-mobile-toggle">Menu</span>
				<?php if ($this->config->get('kuler_menu_status')) { ?>
				<?php echo $this->getChild('module/kuler_menu'); ?>
				<?php } else { ?>
				<ul class="mainmenu clearafter">
					<li class="item"><a href="index.php" title="Home">Home</a></li>
					<?php $path = isset($this->request->get['path']) ? $this->request->get['path'] : ''; ?>
					<?php foreach ($categories as $category) { ?>
					<?php $category_id = (int) substr($category['href'], strpos($category['href'], 'path=') + 5); ?>
					<li class="item<?php echo count($category['children']) ? ' parent' : '' ?><?php echo !empty($category['active']) ? ' active' : '' ?>"> <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
						<?php if (count($category['children'])) { ?>
						<span class="btn-expand-menu"></span>
						<?php } ?>
						<?php if ($category['children']) { ?>
						<div class="dropdown-container">
							<div class="dropdown clearafter" style="width: <?php echo ($category['column'] * 206); ?>px;">
								<?php for ($i = 0; $i < count($category['children']);) { ?>
								<ul class="sublevel">
									<?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
									<?php for (; $i < $j; $i++) { ?>
									<?php if (isset($category['children'][$i])) { ?>
									<?php $children_id = substr($category['children'][$i]['href'], strpos($category['children'][$i]['href'], 'path=') + 5); ?>
									<li class="item<?php echo !empty($category['children'][$i]['active']) ? ' active' : '' ?><?php if (!empty($category['children'][$i]['children'])) { echo ' parent'; } ?>"> <a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a>
										<?php if (!empty($category['children'][$i]['children'])) { ?>
										<span class="btn-expand-menu"></span>
										<?php } ?>
										<?php if (!empty($category['children'][$i]['children'])) { ?>
										<?php echo renderSubMenuRecursive($category['children'][$i]['children']); ?>
										<?php } ?>
									</li>
									<?php } ?>
									<?php } ?>
								</ul>
								<?php } ?>
							</div>
						</div>
						<?php } ?>
					</li>
					<?php } ?>
				</ul>
				<?php } ?>
				<?php } ?>
			</div>
		</div>
	</div>
</div>
<div id="container">
<div id="container-inner" class="wrapper clearafter">
<div id="notification"></div>
