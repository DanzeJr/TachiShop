   M S B A M L   `   `   `  ����D  @TachiShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:TachiShop	TachiShop  5      U QSystem.Runtime, Version=4.2.2.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a7,clr-namespace:System;assembly=System.RuntimeSystem 5
      E'clr-namespace:TachiShop.ValidationRulesTachiShop.ValidationRules  5      &     TachiShop.CustomerAddEditControl   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  5      #localclr-namespace:TachiShop  5      V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5	      6sys,clr-namespace:System;assembly=System.Runtime  5
      =validationRules'clr-namespace:TachiShop.ValidationRules  5      $	��450��5      $
��auto��5      $	��800��5         MaterialDesignPaper#���   5        � DataContext  5      ��   Locator �� Source# [  �� Path$ CustomerAddEditViewModel�*  $Microsoft.Xaml.Behaviors.Interaction   Triggers 5      +  %Microsoft.Xaml.Behaviors.EventTrigger  5   
      	EventName$ Loaded��6   *  $Microsoft.Xaml.Behaviors.TriggerBase   Actions. 5      2  ,Microsoft.Xaml.Behaviors.InvokeCommandAction     Command 6$   �� *LoadedCommand+5        5   
   $ Unloaded��6   . 5         6$   �� *UnloadedCommand+5      .��5      �  � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $��* �6   �� 5      $	��100 �6   .+�5    
   �� $��2��5!      $��Right=�5"       & "MaterialDesignIconForegroundButton#���  5&       � ToolTip$ Thoát��5'      ��5#      �� *CloseDialogCommand+��5$      0  *MaterialDesignThemes.Wpf.PackIconExtension  	   Kind$	 Close=�
   Size
 245'      �� 5(   
   $��1��5)      $��	50,0,50,0q�5*      $��Stretch=�5+      $	��Top=�5,      $
��Auto=�5-      $
��Auto=�5.      .��5/      �  � ColumnDefinitions 50      �� 51      $
��Auto �6'   �� 52      $��* �6'    54      �� 55      $��* �6$   �� 56      $��10 �6$   �� 57      $��* �6$   �� 58      $��10 �6$   �� 59      $��* �6$   �� 5:      $��10 �6$   �� 5;      $��* �6$   �� 5<      $��10 �6$   �� 5=      $��* �6$   �� 5>      $��20 �6$   .+�5A      �� $��0��5B      $��0��5C      $��0,0,10,0q�5D      $
��Left=�5E      $��Center=�5F      $��Tên khách hàng��5G      �� 5H      -   5         ��Name$ TbName��5I      $��0��5J      $��1��5K      $	��250��5L      )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Nhập tên khách hàng��5M       �� 	MaxLength$ 50��5N       �� TextWrapping$
 Wrap=�5O      .��6)   ��5P      �� 5Q       �� NotifyOnValidationError$
 True��5R      $ Customer.FullName�5S       �� UpdateSourceTrigger$ PropertyChanged=�5T       �� ValidatesOnDataErrors$
 True��5U       �� ValidationRules 5V      4   .TachiShop.ValidationRules.StringValidationRule  5W   "      RequiredMessage$( "Vui lòng nhập tên khách hàng��6G   5  /System.Windows.Controls.ExceptionValidationRule  5Y   "   5[      .��5\   $   5]      �� 5_      $��2��5`      $��0��5a      $��	0,10,10,0q�5b      $
��Left=�5c      $��Center=�5d      $��Giới tính��5e      �� 5f      -   5         ��Name$ CbGender��5g      $��2��5h      $��1��5i      $	��250��5j      $��0,10,0,0q�5k      $ Chọn giới tính��5l       �� DisplayMemberPath$ Value��5m       �� SelectedValuePath$	 Key��5o      ��5n      �� *	Genders+ �� SelectedValue 5p      �� 5q      $
 True��5r      $ Customer.Gender�5s      $ PropertyChanged=�5t      $
 True��5u       5v      6	   0TachiShop.ValidationRules.NotEmptyValidationRule	  5w   "    	  
EmptyValue$ -1��6I    	  Message$# Vui lòng chọn giới tính��6Y     5y   "   5{      5}      �� 5      $��4��5�      $��0��5�      $��	0,10,10,0q�5�      $
��Left=�5�      $��Center=�5�      $��
Ngày sinh��5�      (
  "System.Windows.Controls.DatePicker
  5�      -   5         
 Name$ DpBirthDate��5�      $��4��5�      $��1��5�      $	��250��5�      $��0,10,0,0q�5�      $ Chọn ngày sinh��5�      
 �� Now 
  DisplayDateEnd# Z 5�       
  SelectedDate 5�      �� 5�      $
 True��5�      $ Customer.BirthDate�5�      $ PropertyChanged=�5�      $
 True��5�       5�        5�   "   5�      5�      �� 5�      $��6��5�      $��0��5�      $��	0,10,10,0q�5�      $
��Left=�5�      $��Center=�5�      $��Số điện thoại��5�      �� 5�      -   5        $ TbPhoneNumber��5�      $��6��5�      $��1��5�      $	��250��5�      $��0,10,0,0q�5�      $! Nhập số điện thoại��5�      $ 50��5�      $
 Wrap=�5�      .��6)   ��5�      �� 5�      $
 True��5�      $ Customer.PhoneNumber�5�      $ PropertyChanged=�5�      $
 True��5�       5�        5�   "   5�      .��5�   $   5�      �� 5�      $��8��5�      $��0��5�      $��	0,15,10,0q�5�      $
��Left=�5�      $	��Top=�5�      $��Địa chỉ��5�      �� 5�      -   5        $ 	TbAddress��5�      $��8��5�      $��1��5�      $	��250��5�      $��0,10,0,0q�5�      $ Nhập địa chỉ��5�       �� AcceptsReturn$
 True��5�      $	 255��5�      $
 Wrap=�5�      .��6)   ��5�      �� 5�      $
 True��5�      $ Customer.Address�5�      $ PropertyChanged=�5�      $
 True��5�       5�        5�   "   5�      .��5�   $   5�      5�      5�      � 5�   
   $��2��5�      $��Stretch=�5�      $��Center=�5�       5�      �� 5�      �� 5�      .+�5�      �� $	��100��6   ��6!   �� *AddEditCommand+  � 	Resources  5�       " MaterialDesignRaisedDarkButton! �� BasedOn" �� 
TargetType# �� Property$ �� Value% �� Triggers& �� Binding  NullableToBooleanConverter' �� 	Converter( �� Value��%�  '��       7  7  �� 5�      8!   "" ��6V   .�5�      �� # � ��$$ Tạo��64   �� 5�      # �@�ToolTip$$ Tạo mới mặt hàng��64   �� 5�      # � ��
$ � � �67   �� 5�      # � ��
$ � � �68   % 5�      �� 5�      & 6*   �� *Id+8'  ( True6x   .a�5�   "   �� # � ��$$ Cập nhật��6<   �� 5�   "   # �@�ToolTip$$ Cập nhật mặt hàng��6<   �� 5�   "   # � ��
$ ����6?   �� 5�   "   # � ��
$ ����6@   5�      5�      5�      5�      �� 5�      $��1��5�      $	��100��5�      $��
Làm mới��5�      #��[ 5�      $ Làm mới mặt hàng��5�      ��5�      �� *ClearCommand+5�      5�      5�      5�      