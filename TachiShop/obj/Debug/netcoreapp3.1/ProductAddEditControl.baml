   M S B A M L   `   `   `  ����D  @TachiShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:TachiShop	TachiShop  5      E'clr-namespace:TachiShop.ValidationRulesTachiShop.ValidationRules  5
      %    TachiShop.ProductAddEditControl   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  5      #localclr-namespace:TachiShop  5      V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5	      =validationRules'clr-namespace:TachiShop.ValidationRules  5
      $	��400��5      $
��auto��5         MaterialDesignPaper#���   5        � DataContext  5      ��   Locator �� Source# [  �� Path$ ProductAddNewViewModel�*  $Microsoft.Xaml.Behaviors.Interaction   Triggers 5      +  %Microsoft.Xaml.Behaviors.EventTrigger  5   
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
��Left=�5?      $��Center=�5@      $��Tên mặt hàng��5A      �� 5B      -   5         ��Name$ TbName��5C      $��0��5D      $��1��5E      $	��208��5F      )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Nhập tên mặt hàng��5G       �� 	MaxLength$ 50��5H       �� TextWrapping$
 Wrap=�5I      .��6)   ��5J      �� 5K       �� NotifyOnValidationError$
 True��5L      $ Product.Name�5M       �� UpdateSourceTrigger$ PropertyChanged=�5N       �� ValidatesOnDataErrors$
 True��5O       �� ValidationRules 5P      4   .TachiShop.ValidationRules.StringValidationRule  5Q   "      RequiredMessage$' !Vui lòng nhập tên mặt hàng��6G   5  /System.Windows.Controls.ExceptionValidationRule  5R   "   5T      .��5U   $   5V      �� 5X      $��2��5Y      $��0��5Z      $��	0,10,10,0q�5[      $
��Left=�5\      $��Center=�5]      $��Trạng thái��5^      �� 5_      -   5         ��Name$ CbStatus��5`      $��2��5a      $��1��5b      $	��208��5c      $��0,10,0,0q�5d      $ Chọn trạng thái��5e       �� DisplayMemberPath$ Value��5f       �� SelectedValuePath$	 Key��5h      ��5g      �� *
Statuses+ �� SelectedValue 5i      �� 5j      $
 True��5k      $ Product.Status�5l      $ PropertyChanged=�5m      $
 True��5n       5o      6	   0TachiShop.ValidationRules.NotEmptyValidationRule	  5p   "    	  
EmptyValue$ -1��6I    	  Message$$ Vui lòng chọn trạng thái��6Y     5r   "   5t      5v      �� 5x      $��4��5y      $��0��5z      $��	0,10,10,0q�5{      $
��Left=�5|      $��Center=�5}      $��
Danh mục��5~      #
   TachiShop.MultiSelectComboBox
  5      -   5         
 Name$ MCbCategories��5�      $��4��5�      $��1��5�      $	��208��5�      $��0,10,0,0q�5�      $ Chọn danh mục��5�       
  DisplayMemberPath$
 Name��5�       
  SelectedValuePath$ Id��5�       
  ItemsSource 5�      �� *
Categories+ 
  SelectedItems 5�      �� *Product.Categories+5�      5�      5�      � 5�   
   $��2��5�      $��Stretch=�5�      $��Center=�5�       5�      �� 5�      �� 5�      .+�5�      �� $	��100��6   ��6!   �� *AddEditCommand+  � 	Resources  5�       " MaterialDesignRaisedDarkButton! �� BasedOn" �� 
TargetType# �� Property$ �� Value% �� Triggers& �� Binding  NullableToBooleanConverter' �� 	Converter( �� Value��%�  '��       7  7  �� 5�      8!   "" ��6V   .�5�      �� # � ��$$ Tạo��64   �� 5�      # �@�ToolTip$$ Tạo mới mặt hàng��64   �� 5�      # � ��
$ � � �67   �� 5�      # � ��
$ � � �68   % 5�      �� 5�      & 6*   �� *Id+8'  ( True6x   .a�5�   "   �� # � ��$$ Cập nhật��6<   �� 5�   "   # �@�ToolTip$$ Cập nhật mặt hàng��6<   �� 5�   "   # � ��
$ ����6?   �� 5�   "   # � ��
$ ����6@   5�      5�      5�      5�      �� 5�      $��1��5�      $	��100��5�      $��
Làm mới��5�      #��[ 5�      $ Làm mới mặt hàng��5�      ��5�      �� *ClearCommand+5�      5�      5�      5�      