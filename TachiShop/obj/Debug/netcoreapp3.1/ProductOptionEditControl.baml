   M S B A M L   `   `   `  ����D  @TachiShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:TachiShop	TachiShop  5      E'clr-namespace:TachiShop.ValidationRulesTachiShop.ValidationRules  5
      (    "TachiShop.ProductOptionEditControl   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  5      #localclr-namespace:TachiShop  5      V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5	      =validationRules'clr-namespace:TachiShop.ValidationRules  5
      $	��400��5      $
��auto��5         MaterialDesignPaper#���   5        � DataContext  5      ��   Locator �� Source# [  �� Path$  ProductOptionEditViewModel� � 	Resources 5      ,   &TachiShop.ValidationRules.BindingProxy 	 Proxy   Data��%&   &	         5   
    65   �� 5      *  $Microsoft.Xaml.Behaviors.Interaction   Triggers 5      +  %Microsoft.Xaml.Behaviors.EventTrigger  5   
      	EventName$ Loaded��6   *  $Microsoft.Xaml.Behaviors.TriggerBase   Actions. 5      2  ,Microsoft.Xaml.Behaviors.InvokeCommandAction     Command 6$   �� *LoadedCommand+5        5   
   $ Unloaded��6   . 5         6$   �� *UnloadedCommand+5      .��5      � 	 � RowDefinitions	 5   
   �� 5      $
��Auto �6   �� 5      $��* �6   �� 5      $	��100 �6   .+�5!   
   �� $��2��5"      $��Right=�5#       & "MaterialDesignIconForegroundButton#���  5'      
 � ToolTip$
 Thoát��5(      ��5$      �� *CloseDialogCommand+��5%      0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$ Close=�   Size 245(      �� 5)   
   $��1��5*      $��	50,0,50,0q�5+      $��Stretch=�5,      $	��Top=�5-      $
��Auto=�5.      $
��Auto=�5/      .��50      �  � ColumnDefinitions 51      �� 52      $
��Auto �6'   �� 53      $��* �6'   	 55      �� 56      $��* �6$   �� 57      $��10 �6$   �� 58      $��* �6$   �� 59      $��10 �6$   �� 5:      $��* �6$   �� 5;      $��20 �6$   .+�5>      �� $��0��5?      $��0��5@      $��0,0,10,0q�5A      $
��Left=�5B      $��Center=�5C      $��	Giá bán��5D      �� 5E      -   5         ��Name$ TbPrice��5F      $��0��5G      $��1��5H      $	��208��5I      )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Nhập giá bán��5J       �� 	MaxLength$ 50��5K       �� TextWrapping$
 Wrap=�5L      .��6)   ��5M      �� 5N        DecimalConverter �� 	Converter# [ 5O       �� ConverterParameter$ PRICE��5P       �� Delay$	 500��5Q       �� NotifyOnValidationError$
 True��5R      $ ProductOption.Price�5S       �� UpdateSourceTrigger$ PropertyChanged=�5T       �� ValidatesOnDataErrors$
 True��5U       �� ValidationRules 5V      5   /TachiShop.ValidationRules.DecimalValidationRule  5W   "   
   Min 1006H      RequiredMessage$  Vui lòng nhập giá bán��6R   5	  /System.Windows.Controls.ExceptionValidationRule	  5Y   "   5[      .��5\   $   5]      �� 5_      $��2��5`      $��0��5a      $��	0,10,10,0q�5b      $
��Left=�5c      $��Center=�5d      $��Trạng thái��5e      �� 5f      -   5         ��Name$ CbStatus��5g      $��2��5h      $��1��5i      $	��208��5j      $��0,10,0,0q�5k      $ Chọn trạng thái��5l       �� DisplayMemberPath$ Value��5m       �� SelectedValuePath$	 Key��5o      ��5n      �� *
Statuses+ �� SelectedValue 5p      �� 5q      $
 True��5r      $ ProductOption.Status�5s      $ PropertyChanged=�5t      $
 True��5u       5v      6
   0TachiShop.ValidationRules.NotEmptyValidationRule
  5w   "    
  
EmptyValue$ -1��6I     
  Message$$  Vui lòng chọn trạng thái��6Y   	  5y   "   5{      5}      �� 5      $��4��5�      $��0��5�      $��	0,10,10,0q�5�      $
��Left=�5�      $��Center=�5�      $��	Tồn kho��5�      �� 5�      -   5        $ TbStock��5�      $��4��5�      $��1��5�      $	��208��5�      $��0,10,0,0q�5�      $$ Nhập số lượng tồn kho��5�      $ 50��5�      $
 Wrap=�5�      .  (MaterialDesignThemes.Wpf.TextFieldAssist!   
SuffixText! 5�      �� *ProductOption.Unit+  EnumConverter# [ $ PRODUCTUNIT��.��5�   )   ��5�      �� 5�      # [ 5�      $
 UNIT��5�      $	 500��5�      $
 True��5�      $ ProductOption.Stock�5�      $ PropertyChanged=�5�      $
 True��5�       5�        5�   "    0.016H   $. (Vui lòng nhập số lượng tồn kho��6S   "   Wrapper" 5�   &   .   (TachiShop.ValidationRules.DecimalWrapper  5�   *   #   DecimalPlaces# 6I   �� *Data.ProductOption.Unit+  UnitToDecimalPlaceConverter# [ # [ 
$   Max$ 6�   �� * Data.ProductOption.OriginStock+# [ 5�   #   	  5�   "   5�      .��5�   $   5�      5�      5�      � 5�   
   $��2��5�      $��Stretch=�5�      $��Center=�5�       5�      �� 5�      �� 5�      .+�5�      �� $	��100��5�      
������
������$��Cập nhật��5�       " MaterialDesignRaisedDarkButton#��[ 5�      $
 Cập nhật��5�      ��5�      �� *UpdateCommand+5�      �� 5�      $��1��5�      $	��100��5�      $��
Làm mới��5�      #��[ 5�      $
 
Làm mới��5�      ��5�      �� *ClearCommand+5�      5�      5�      5�      