<?php

class SiteController extends Controller
{
	public function actionIndex($category_id = null)
	{
		if ( ($category_id != null) && is_numeric($category_id) ) { 
			$data['products'] = Product::model()
							->with(array( 'categories' => array('condition' => 'categories.id = '. $category_id)))
							->findAll();
		} else {
			$data['products'] = Product::model()->findAll();
		}

		$this->render('index', $data);
	}

	/**
	 * This is the action to handle external exceptions.
	 */
	public function actionError()
	{
		if($error=Yii::app()->errorHandler->error)
		{
			if(Yii::app()->request->isAjaxRequest)
				echo $error['message'];
			else
				$this->render('error', $error);
		}
	}

}