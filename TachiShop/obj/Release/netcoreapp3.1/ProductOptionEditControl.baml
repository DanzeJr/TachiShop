   M S B A M L   `   `   `  ���� D  @TachiShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:TachiShop	TachiShop  E'clr-namespace:TachiShop.ValidationRulesTachiShop.ValidationRules  (    "TachiShop.ProductOptionEditControl   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  #localclr-namespace:TachiShop  V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  =validationRules'clr-namespace:TachiShop.ValidationRules  $	��400��$
��auto��   MaterialDesignPaper#���     � DataContext  ��   Locator �� Source# [  �� Path$  ProductOptionEditViewModel� � 	Resources ,   &TachiShop.ValidationRules.BindingProxy 	 Proxy   Data��%   &	          �� *  $Microsoft.Xaml.Behaviors.Interaction   Triggers +  %Microsoft.Xaml.Behaviors.EventTrigger     	EventName$ Loaded��*  $Microsoft.Xaml.Behaviors.TriggerBase   Actions. 2  ,Microsoft.Xaml.Behaviors.InvokeCommandAction     Command �� *LoadedCommand+  $ Unloaded��.    �� *UnloadedCommand+.��� 	 � RowDefinitions	 �� $
��Auto ��� $��* ��� $	��100 �.+��� $��2��$��Right=� & "MaterialDesignIconForegroundButton#���  
 � ToolTip$
 Thoát������ *CloseDialogCommand+��0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$ Close=�   Size 24�� $��1��$��	50,0,50,0q�$��Stretch=�$	��Top=�$
��Auto=�$
��Auto=�.���  � ColumnDefinitions �� $
��Auto ��� $��* �	 �� $��* ��� $��10 ��� $��* ��� $��10 ��� $��* ��� $��20 �.+��� $��0��$��0��$��0,0,10,0q�$
��Left=�$��Center=�$��	Giá bán���� -    ��Name$ TbPrice��$��0��$��1��$	��208��)  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Nhập giá bán�� �� 	MaxLength$ 50�� �� TextWrapping$
 Wrap=�.������   DecimalConverter �� 	Converter# [  �� ConverterParameter$ PRICE�� �� Delay$	 500�� �� NotifyOnValidationError$
 True��$ ProductOption.Price� �� UpdateSourceTrigger$ PropertyChanged=� �� ValidatesOnDataErrors$
 True�� �� ValidationRules 5   /TachiShop.ValidationRules.DecimalValidationRule  
   Min 100   RequiredMessage$  Vui lòng nhập giá bán��5	  /System.Windows.Controls.ExceptionValidationRule	  .���� $��2��$��0��$��	0,10,10,0q�$
��Left=�$��Center=�$��Trạng thái���� -    ��Name$ CbStatus��$��2��$��1��$	��208��$��0,10,0,0q�$ Chọn trạng thái�� �� DisplayMemberPath$ Value�� �� SelectedValuePath$	 Key������ *
Statuses+ �� SelectedValue �� $
 True��$ ProductOption.Status�$ PropertyChanged=�$
 True�� 6
   0TachiShop.ValidationRules.NotEmptyValidationRule
   
  
EmptyValue$ -1��  
  Message$$  Vui lòng chọn trạng thái��	  �� $��4��$��0��$��	0,10,10,0q�$
��Left=�$��Center=�$��	Tồn kho���� -   $ TbStock��$��4��$��1��$	��208��$��0,10,0,0q�$$ Nhập số lượng tồn kho��$ 50��$
 Wrap=�.  (MaterialDesignThemes.Wpf.TextFieldAssist!   
SuffixText! �� *ProductOption.Unit+  EnumConverter# [ $ PRODUCTUNIT��.������ # [ $
 UNIT��$	 500��$
 True��$ ProductOption.Stock�$ PropertyChanged=�$
 True��    0.01$. (Vui lòng nhập số lượng tồn kho��"   Wrapper" .   (TachiShop.ValidationRules.DecimalWrapper  #   DecimalPlaces# �� *Data.ProductOption.Unit+  UnitToDecimalPlaceConverter# [ # [ 
$   Max$ �� * Data.ProductOption.OriginStock+# [ 	  .��� $��2��$��Stretch=�$��Center=� �� �� .+��� $	��100��
������
������$��Cập nhật�� " MaterialDesignRaisedDarkButton#��[ $
 Cập nhật������ *UpdateCommand+�� $��1��$	��100��$��
Làm mới��#��[ $
 
Làm mới������ *ClearCommand+