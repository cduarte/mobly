<?php /* @var $this Controller */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="language" content="en" />

	<!-- blueprint CSS framework -->
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/screen.css" media="screen, projection" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/print.css" media="print" />
	<!--[if lt IE 8]>
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/ie.css" media="screen, projection" />
	<![endif]-->

	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/main.css" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/form.css" />

	<title><?php echo CHtml::encode($this->pageTitle); ?></title>

	<style type="text/css">
		.product-img{
			width: 150px;
			height: 150px;
		}
		.product-list{
			margin: 10px 10px;
			text-align: center;
			border: 1px solid #e4e4e4;
			padding: 9px;
			border-radius: 6px;
		}
	</style>
</head>

<body>

<div class="container" id="page">

	<div id="header">
		<div id="logo"><?php echo CHtml::encode(Yii::app()->name); ?></div>

		<div class="busca">
			<form id="order-fin_products-form" action="/index.php?r=product/search" method="post">
					<label for="product_find" class="required">Busca</label>
					<input name="product_name" id="product_find" autocomplete="off" type="text" maxlength="45">
					<?php echo CHtml::submitButton('Buscar'); ?>
			</form>
		</div>

		<div id="cart">
			<?php
				$image = CHtml::image('http://www.jackcelulares.com.br/jackcelulares/images/layout/carrinho/carrinho_vazio.png');
				echo CHtml::link($image, array('order/cartView'));
			?>
			total: R$ <?php echo number_format($this->cart_total,2,",",".");?>
		</div>
	</div><!-- header -->

	<div id="mainmenu">
		<?php $this->widget('zii.widgets.CMenu',array(
			'items'=> $this->menus
		)); ?>
	</div><!-- mainmenu -->
	<?php if(isset($this->breadcrumbs)):?>
		<?php $this->widget('zii.widgets.CBreadcrumbs', array(
			'links'=>$this->breadcrumbs,
		)); ?><!-- breadcrumbs -->
	<?php endif?>

	<?php echo $content; ?>

	<div class="clear"></div>

	<div id="footer">
		Charles Duarte dos Santos - dos.santos.charles@gmail.com<br/>
		<?php echo Yii::powered(); ?>
	</div><!-- footer -->

</div><!-- page -->

</body>
</html>
