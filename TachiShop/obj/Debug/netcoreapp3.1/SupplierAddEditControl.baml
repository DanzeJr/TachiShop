   M S B A M L   `   `   `  ����D  @TachiShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:TachiShop	TachiShop  5      E'clr-namespace:TachiShop.ValidationRulesTachiShop.ValidationRules  5
      &     TachiShop.SupplierAddEditControl   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  5      #localclr-namespace:TachiShop  5      V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5	      =validationRules'clr-namespace:TachiShop.ValidationRules  5
      $	��400��5      $
��auto��5         MaterialDesignPaper#���   5        � DataContext  5      ��   Locator �� Source# [  �� Path$ SupplierAddEditViewModel�*  $Microsoft.Xaml.Behaviors.Interaction   Triggers 5      +  %Microsoft.Xaml.Behaviors.EventTrigger  5   
      	EventName$ Loaded��6   *  $Microsoft.Xaml.Behaviors.TriggerBase   Actions. 5      2  ,Microsoft.Xaml.Behaviors.InvokeCommandAction     Command 6$   �� *LoadedCommand+5        5   
   $ Unloaded��6   . 5         6$   �� *UnloadedCommand+5      .��5      �  � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $��* �6   �� 5      $	��100 �6   .+�5   
   �� $��2��5      $��Right=�5        & "MaterialDesignIconForegroundButton#���  5$       � ToolTip$ Thoát��5%      ��5!      �� *CloseDialogCommand+��5"      0  *MaterialDesignThemes.Wpf.PackIconExtension  	   Kind$	 Close=�
   Size
 245%      �� 5&   
   $��1��5'      $��	50,0,50,0q�5(      $��Stretch=�5)      $	��Top=�5*      $
��Auto=�5+      $
��Auto=�5,      .��5-      �  � ColumnDefinitions 5.      �� 5/      $
��Auto �6'   �� 50      $��* �6'    52      �� 53      $��* �6$   �� 54      $��10 �6$   �� 55      $��* �6$   �� 56      $��10 �6$   �� 57      $��* �6$   �� 58      $��20 �6$   .+�5;      �� $��0��5<      $��0��5=      $��0,0,10,0q�5>      $
��Left=�5?      $��Center=�5@      $��Tên nhà cung cấp��5A      �� 5B      -   5         ��Name$ TbName��5C      $��0��5D      $��1��5E      $	��186��5F      )  #MaterialDesignThemes.Wpf.HintAssist   Hint$! Nhập tên nhà cung cấp��5G       �� 	MaxLength$ 50��5H       �� TextWrapping$
 Wrap=�5I      .��6)   ��5J      �� 5K       �� NotifyOnValidationError$
 True��5L      $ Supplier.Name�5M       �� UpdateSourceTrigger$ PropertyChanged=�5N       �� ValidatesOnDataErrors$
 True��5O       �� ValidationRules 5P      4   .TachiShop.ValidationRules.StringValidationRule  5Q   "      RequiredMessage$+ %Vui lòng nhập tên nhà cung cấp��6G   5  /System.Windows.Controls.ExceptionValidationRule  5S   "   5U      .��5V   $   5W      �� 5Y      $��2��5Z      $��0��5[      $��	0,10,10,0q�5\      $
��Left=�5]      $��Center=�5^      $��Số điện thoại��5_      �� 5`      -   5        $ TbPhoneNumber��5a      $��2��5b      $��1��5c      $	��186��5d      $��0,10,0,0q�5e      $! Nhập số điện thoại��5f      $ 50��5g      $
 Wrap=�5h      .��6)   ��5i      �� 5j      $
 True��5k      $ Supplier.PhoneNumber�5l      $ PropertyChanged=�5m      $
 True��5n       5o        5p   "   5r      .��5s   $   5t      �� 5v      $��4��5w      $��0��5x      $��	0,15,10,0q�5y      $
��Left=�5z      $	��Top=�5{      $��Địa chỉ��5|      �� 5}      -   5        $ 	TbAddress��5~      $��4��5      $��1��5�      $	��186��5�      $��0,10,0,0q�5�      $ Nhập địa chỉ��5�       �� AcceptsReturn$
 True��5�      $	 255��5�      $
 Wrap=�5�      .��6)   ��5�      �� 5�      $
 True��5�      $ Supplier.Address�5�      $ PropertyChanged=�5�      $
 True��5�       5�        5�   "   5�      .��5�   $   5�      5�      5�      � 5�   
   $��2��5�      $��Stretch=�5�      $��Center=�5�       5�      �� 5�      �� 5�      .+�5�      �� $	��100��6   ��6!   �� *AddEditCommand+ � 	Resources 5�       " MaterialDesignRaisedDarkButton �� BasedOn �� 
TargetType �� Property �� Value �� Triggers �� Binding  NullableToBooleanConverter �� 	Converter �� Value��%�  '��       7  7  �� 5�      8   " ��6V   .�5�      ��  � ��$ Tạo��64   �� 5�       �@�ToolTip$ Tạo mới mặt hàng��64   �� 5�       � ��
 � � �67   �� 5�       � ��
 � � �68    5�      �� 5�       6*   �� *Id+8   True6x   .a�5�   "   ��  � ��$ Cập nhật��6<   �� 5�   "    �@�ToolTip$ Cập nhật mặt hàng��6<   �� 5�   "    � ��
 ����6?   �� 5�   "    � ��
 ����6@   5�      5�      5�      5�      �� 5�      $��1��5�      $	��100��5�      $��
Làm mới��5�      #��[ 5�      $ Làm mới mặt hàng��5�      ��5�      �� *ClearCommand+5�      5�      5�      5�      