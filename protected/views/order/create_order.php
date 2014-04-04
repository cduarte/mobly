<?php
/* @var $this OrderController */
/* @var $model Order */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'order-create_order-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// See class documentation of CActiveForm for details on this,
	// you need to use the performAjaxValidation()-method described there.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'customer_email'); ?>
		<?php echo $form->textField($model,'customer_email'); ?>
		<?php echo $form->error($model,'customer_email'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'customer_name'); ?>
		<?php echo $form->textField($model,'customer_name'); ?>
		<?php echo $form->error($model,'customer_name'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'customer_address'); ?>
		<?php echo $form->textField($model,'customer_address'); ?>
		<?php echo $form->error($model,'customer_address'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'customer_city'); ?>
		<?php echo $form->textField($model,'customer_city'); ?>
		<?php echo $form->error($model,'customer_city'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'customer_postcode'); ?>
		<?php echo $form->textField($model,'customer_postcode'); ?>
		<?php echo $form->error($model,'customer_postcode'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'shipping_name'); ?>
		<?php echo $form->textField($model,'shipping_name'); ?>
		<?php echo $form->error($model,'shipping_name'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'shipping_address'); ?>
		<?php echo $form->textField($model,'shipping_address'); ?>
		<?php echo $form->error($model,'shipping_address'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'shipping_city'); ?>
		<?php echo $form->textField($model,'shipping_city'); ?>
		<?php echo $form->error($model,'shipping_city'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'shipping_postcode'); ?>
		<?php echo $form->textField($model,'shipping_postcode'); ?>
		<?php echo $form->error($model,'shipping_postcode'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Enviar pedido'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->