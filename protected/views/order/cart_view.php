
<?php if ( isset(Yii::app()->session['cart'][0]) ) { ?>
<table>
	<thead>
		<tr>
			<th>id</th>
			<th>Produto</th>
			<th>Preço</th>
		</tr>
	</thead>
	
	<tbody>
<?php $total = 0 ?>
<?php foreach (Yii::app()->session['cart'] as $item) { ?>
		<tr>
			<td><?php echo $item['id']?></td>
			<td><?php echo $item['name']?></td>
			<td>R$ <?php echo number_format($item['price'],2,",",".");?></td>
		</tr>
<?php $total += $item['price'] ?>
<?php } ?>
	</tbody>
	
	<tfoot>
		<tr>
			<th></th>
			<th>TOTAL</th>
			<th>R$ <?php echo number_format($total,2,",",".");?></th>
		</tr>
	</tfoot>
</table>

<p><?php echo CHtml::link('Limpar carrinho de compras', array('order/cartClear', 'id'=>$item['id']));?></p>
<p><?php echo CHtml::link('Realizar pedido', array('order/orderCreate'));?></p>

<?php } else { ?>
	Nenhum produto adicionado ao carrinho de compras
<?php } ?>


<p><?php echo CHtml::link('Voltar a home para mais compras', array('site/index'));?></p>
