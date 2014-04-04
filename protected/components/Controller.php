<?php
/**
 * Controller is the customized base controller class.
 * All controller classes for this application should extend from this base class.
 */
class Controller extends CController
{
	/**
	 * @var string the default layout for the controller view. Defaults to '//layouts/column1',
	 * meaning using a single column layout. See 'protected/views/layouts/column1.php'.
	 */
	public $layout='//layouts/column2';
	/**
	 * @var array context menu items. This property will be assigned to {@link CMenu::items}.
	 */
	public $menu=array();
	/**
	 * @var array the breadcrumbs of the current page. The value of this property will
	 * be assigned to {@link CBreadcrumbs::links}. Please refer to {@link CBreadcrumbs::links}
	 * for more details on how to specify this property.
	 */
	public $breadcrumbs=array();

	public $menus;
	public $cart_total;

	public function beforeAction($action) {
		$categories = Category::model()->findAll();

		$this->menus[] = array('label'=>'Home', 'url'=>array('/site/index'));
		foreach ($categories as $category) {
			$this->menus[] = array('label'=>$category['name'], 'url'=>array('/site/index', 'category_id' => $category['id']));
		}

		$this->cart_total = 0;
		if (isset(Yii::app()->session['cart'])) {
			foreach (Yii::app()->session['cart'] as $item) {
				$this->cart_total += $item['price'];
			}
		}

		return parent::beforeAction($action);
	}
}