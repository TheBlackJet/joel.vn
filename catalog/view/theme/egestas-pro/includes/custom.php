<?php
function hex2rgb($colour) {
	if ( $colour[0] == '#' ) {
		$colour = substr( $colour, 1 );
	}
	if ( strlen( $colour ) == 6 ) {
		list( $r, $g, $b ) = array( $colour[0] . $colour[1], $colour[2] . $colour[3], $colour[4] . $colour[5] );
	} elseif ( strlen( $colour ) == 3 ) {
		list( $r, $g, $b ) = array( $colour[0] . $colour[0], $colour[1] . $colour[1], $colour[2] . $colour[2] );
	} else {
		return false;
	}
	$r = hexdec( $r );
	$g = hexdec( $g );
	$b = hexdec( $b );
	return array( 'red' => $r, 'green' => $g, 'blue' => $b );
}

function noiseColor($hexa_color) {
	$x = 50;
	$y = 50;

	$rbg = hex2rgb($hexa_color);

	$im = imagecreatetruecolor($x,$y);

	$blue = array_map('hexdec', str_split('0000FF', 2));
	$white = array_map('hexdec', str_split('FFFFFF', 2));

	$color1 = imagecolorallocate($im, $rbg['red'], $rbg['green'], $rbg['blue']);
	$color2 = imagecolorallocatealpha($im, 244, 244, 244, 120);
	$color3 = imagecolorallocatealpha($im, 255, 255, 255, 115);

	imagefill($im, 0, 0, $color1);

	$arr = array();

	for($i = 0; $i < $x; $i += 1)
	{
		$arr[$i] = array();

		for($j = 0; $j < $y; $j += 1)
		{
			if (mt_rand(1, 1000) >= 500)
			{
				$arr[$i][$j] = 2;

				ImageSetPixel($im, $i, $j, $color2);
			}
			else
			{
				$arr[$i][$j] = 3;
				ImageSetPixel($im, $i, $j, $color3);
			}
		}
	}

	ob_start();

	imagepng($im);

	$image = ob_get_contents();

	ob_end_clean();

	$image = base64_encode($image);

	return 'data:image/png;base64,' . $image;
}
?>

<?php if ($primary_color) { ?>
.primary-define #header,
.primary-define .button,
.primary-define .box-product .price div,
.primary-define .product-info .price div,
.primary-define .checkout-heading,
.primary-define .nivo-directionNav a:hover,
.primary-define .kuler-social-icons ul li a,
.primary-define .kuler-accordion .slide .item-title,
.primary-define .kuler-tabs ul.module-nav-list .ui-state-active a,
.primary-define .jcarousel-skin-opencart .jcarousel-next-horizontal:hover,
.primary-define .jcarousel-skin-opencart .jcarousel-prev-horizontal:hover {
	background-color: <?php echo $primary_color; ?>;
}
.primary-define .box-product .details,
.primary-define .product-grid > div:hover,
.primary-define .product-list > div:hover {
	border-color: <?php echo $primary_color; ?>;
}
.primary-define .megamenu li:hover > .menu-category-title,
.primary-define .megamenu li.active > .menu-category-title,
.primary-define .megamenu li.category .dropdown ul ul a:hover,
.primary-define .kuler-tabs ul.module-nav-list li:hover a,
.primary-define .comment-stats,
.primary-define .article-header h2 a:hover{
	color: <?php echo $primary_color; ?>;
}
<?php } ?>

<?php if ($secondary_color) { ?>
.primary-define a,
.primary-define .breadcrumb a:last-child,
.primary-define .treemenu li a:hover,
.primary-define .treemenu li a.active,
.primary-define .box-product .name a:hover,
.primary-define .box-product .wishlist a:hover,
.primary-define .box-product .compare a:hover,
.primary-define .product-filter .display span,
.primary-define .product-filter .display a:hover {
	color: <?php echo $secondary_color; ?>;
}
.primary-define .mainmenu > li:hover > a,
.primary-define .mainmenu > li.active > a,
.primary-define .pagination .links b,
.primary-define .pagination .links a:hover {
	background-color: <?php echo $secondary_color; ?>;
}
<?php } ?>

<?php if ($header_bg_color) { ?>
.primary-define #header {
	background-image: url(<?php echo noiseColor($header_bg_color); ?>);
}
<?php } ?>

<?php if ($mainmenu_bg_color) { ?>
.primary-define #menu {
	background-color: <?php echo $mainmenu_bg_color; ?>;
}
<?php } ?>

<?php if ($mainmenu_item_color) { ?>
.primary-define .mainmenu > li > a {
	color: <?php echo $mainmenu_item_color; ?>;
}
<?php } ?>

<?php if ($mainmenu_item_bg_color) { ?>
.primary-define .mainmenu > li:hover > a,
.primary-define .mainmenu > li.active > a {
	background-color: <?php echo $mainmenu_item_bg_color; ?>;
}
<?php } ?>

<?php if ($bottom_bg_color) { ?>
.primary-define #bottom {
	background-image: url(<?php echo noiseColor($bottom_bg_color); ?>);
}
<?php } ?>

<?php if ($bottom_heading_color) { ?>
.primary-define #bottom h3 {
	color: <?php echo $bottom_heading_color; ?>;
}
<?php } ?>

<?php if ($bottom_heading_border_color) { ?>
.primary-define #bottom h3,
.primary-define #shop-contact ul li {
	border-color: <?php echo $bottom_heading_border_color; ?>;
}
<?php } ?>

<?php if ($bottom_text_color) { ?>
.primary-define #bottom {
	color: <?php echo $bottom_text_color; ?>;
}
<?php } ?>

<?php if ($footer_bg_color) { ?>
.primary-define #footer {
	background-image: url(<?php echo noiseColor($footer_bg_color); ?>);
}
<?php } ?>

<?php if ($footer_heading_color) { ?>
.primary-define #footer h3 {
	color: <?php echo $footer_heading_color; ?>;
}
<?php } ?>

<?php if ($footer_heading_border_color) { ?>
.primary-define #footer h3 {
	border-color: <?php echo $footer_heading_border_color; ?>;
}
<?php } ?>

<?php if ($footer_text_color) { ?>
.primary-define #footer a {
	color: <?php echo $footer_text_color; ?>;
}
<?php } ?>

<?php if ($price_text_color) { ?>
.primary-define .box-product .price div {
	color: <?php echo $price_text_color; ?>;
}
<?php } ?>

<?php if ($special_price_text_color) { ?>
.primary-define .box-product .special-price .price-old {
	color: <?php echo $special_price_text_color; ?>;
}
<?php } ?>

<?php if ($price_label_bg_color) { ?>
.primary-define .box-product .price div {
	background-color: <?php echo $price_label_bg_color; ?>;
}
<?php } ?>

<?php if ($special_price_label_bg_color) { ?>
.primary-define .box-product .price .special-price {
	background-color: <?php echo $special_price_label_bg_color; ?>;
}
<?php } ?>

<?php if ($button_color) { ?>
.primary-define .button {
	background-color: <?php echo $button_color; ?>;
}
<?php } ?>

<?php if ($button_hover_color) { ?>
.primary-define .button:hover {
	background-color: <?php echo $button_hover_color; ?>;
}
<?php } ?>