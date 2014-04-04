<h1><?php echo $product['name']; ?></h1>

Esta cadastrado na(s) categoria(s):
<?php
 foreach ($product['categories'] as $category) { ?>
	<h4 style="margin-bottom: 0;"> <?php echo $category['name']; ?></h4>
<?php } ?>
<br>
<?php echo CHtml::image($product['image'], $product['image'], array('class'=>'product-img'));?>

<p style="margin:30px;font-weight:bold;font-size:20px;color:red">R$ <?php echo number_format($product['price'],2,",",".");?></p>

<p><?php echo CHtml::link('Adicionar ao carrinho', array('order/cartAdd', 'id'=>$product['id']), array('style'=>'font-size:20px'));?></p>

<p><?php echo $product['description']; ?></p>



<?php if (isset($product['featureValues'][0])) { ?>
<h2 style="color:red">Características</h2>

<?php foreach ($product['featureValues'] as $data) { ?>
		<p><b><?php echo $data['feature']['name']?>:</b> <?php echo $data['value']['value']?></p>
<?php }
} ?>
