   M S B A M L   `   `   `  ���� D  @TachiShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:TachiShop	TachiShop  U QSystem.Runtime, Version=4.2.2.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a7,clr-namespace:System;assembly=System.RuntimeSystem E'clr-namespace:TachiShop.ValidationRulesTachiShop.ValidationRules  &     TachiShop.CustomerAddEditControl   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  #localclr-namespace:TachiShop  V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  6sys,clr-namespace:System;assembly=System.Runtime  =validationRules'clr-namespace:TachiShop.ValidationRules  $	��450��$
��auto��$	��800��   MaterialDesignPaper#���     � DataContext  ��   Locator �� Source# [  �� Path$ CustomerAddEditViewModel�*  $Microsoft.Xaml.Behaviors.Interaction   Triggers +  %Microsoft.Xaml.Behaviors.EventTrigger     	EventName$ Loaded��*  $Microsoft.Xaml.Behaviors.TriggerBase   Actions. 2  ,Microsoft.Xaml.Behaviors.InvokeCommandAction     Command �� *LoadedCommand+  $ Unloaded��.    �� *UnloadedCommand+.���  � RowDefinitions �� $
��Auto ��� $��* ��� $	��100 �.+��� $��2��$��Right=� & "MaterialDesignIconForegroundButton#���   � ToolTip$ Thoát������ *CloseDialogCommand+��0  *MaterialDesignThemes.Wpf.PackIconExtension  	   Kind$	 Close=�
   Size
 24�� $��1��$��	50,0,50,0q�$��Stretch=�$	��Top=�$
��Auto=�$
��Auto=�.���  � ColumnDefinitions �� $
��Auto ��� $��* � �� $��* ��� $��10 ��� $��* ��� $��10 ��� $��* ��� $��10 ��� $��* ��� $��10 ��� $��* ��� $��20 �.+��� $��0��$��0��$��0,0,10,0q�$
��Left=�$��Center=�$��Tên khách hàng���� -    ��Name$ TbName��$��0��$��1��$	��250��)  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Nhập tên khách hàng�� �� 	MaxLength$ 50�� �� TextWrapping$
 Wrap=�.������  �� NotifyOnValidationError$
 True��$ Customer.FullName� �� UpdateSourceTrigger$ PropertyChanged=� �� ValidatesOnDataErrors$
 True�� �� ValidationRules 4   .TachiShop.ValidationRules.StringValidationRule     RequiredMessage$( "Vui lòng nhập tên khách hàng��5  /System.Windows.Controls.ExceptionValidationRule  .���� $��2��$��0��$��	0,10,10,0q�$
��Left=�$��Center=�$��Giới tính���� -    ��Name$ CbGender��$��2��$��1��$	��250��$��0,10,0,0q�$ Chọn giới tính�� �� DisplayMemberPath$ Value�� �� SelectedValuePath$	 Key������ *	Genders+ �� SelectedValue �� $
 True��$ Customer.Gender�$ PropertyChanged=�$
 True�� 6	   0TachiShop.ValidationRules.NotEmptyValidationRule	   	  
EmptyValue$ -1�� 	  Message$# Vui lòng chọn giới tính��  �� $��4��$��0��$��	0,10,10,0q�$
��Left=�$��Center=�$��
Ngày sinh��(
  "System.Windows.Controls.DatePicker
  -    
 Name$ DpBirthDate��$��4��$��1��$	��250��$��0,10,0,0q�$ Chọn ngày sinh��
 �� Now 
  DisplayDateEnd# Z  
  SelectedDate �� $
 True��$ Customer.BirthDate�$ PropertyChanged=�$
 True��   �� $��6��$��0��$��	0,10,10,0q�$
��Left=�$��Center=�$��Số điện thoại���� -   $ TbPhoneNumber��$��6��$��1��$	��250��$��0,10,0,0q�$! Nhập số điện thoại��$ 50��$
 Wrap=�.������ $
 True��$ Customer.PhoneNumber�$ PropertyChanged=�$
 True��   .���� $��8��$��0��$��	0,15,10,0q�$
��Left=�$	��Top=�$��Địa chỉ���� -   $ 	TbAddress��$��8��$��1��$	��250��$��0,10,0,0q�$ Nhập địa chỉ�� �� AcceptsReturn$
 True��$	 255��$
 Wrap=�.������ $
 True��$ Customer.Address�$ PropertyChanged=�$
 True��   .��� $��2��$��Stretch=�$��Center=� �� �� .+��� $	��100������ *AddEditCommand+  � 	Resources   " MaterialDesignRaisedDarkButton! �� BasedOn" �� 
TargetType# �� Property$ �� Value% �� Triggers& �� Binding  NullableToBooleanConverter' �� 	Converter( �� Value��%N  '��       7  7  �� 8!   "" ��.��� # � ��$$ Tạo���� # �@�ToolTip$$ Tạo mới mặt hàng���� # � ��
$ � � ��� # � ��
$ � � �% �� & �� *Id+8'  ( True.a��� # � ��$$ Cập nhật���� # �@�ToolTip$$ Cập nhật mặt hàng���� # � ��
$ ������ # � ��
$ ������ $��1��$	��100��$��
Làm mới��#��[ $ Làm mới mặt hàng������ *ClearCommand+