   M S B A M L   `   `   `  ���� D  @TachiShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE'clr-namespace:TachiShop.InfrastructuresTachiShop.Infrastructures  %clr-namespace:TachiShop	TachiShop  U QSystem.Runtime, Version=4.2.2.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a7,clr-namespace:System;assembly=System.RuntimeSystem E'clr-namespace:TachiShop.ValidationRulesTachiShop.ValidationRules  "    TachiShop.UserDetailsControl   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  =infrastructures'clr-namespace:TachiShop.Infrastructures  #localclr-namespace:TachiShop  V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  6sys,clr-namespace:System;assembly=System.Runtime  =validationRules'clr-namespace:TachiShop.ValidationRules     MaterialDesignPaper#���     � DataContext  ��   Locator �� Source# [  �� Path$ UserDetailsViewModel�*  $Microsoft.Xaml.Behaviors.Interaction   Triggers +  %Microsoft.Xaml.Behaviors.EventTrigger     	EventName$ Loaded��*  $Microsoft.Xaml.Behaviors.TriggerBase   Actions. 2  ,Microsoft.Xaml.Behaviors.InvokeCommandAction     Command �� *LoadedCommand+  $ Unloaded��.    �� *UnloadedCommand+ � 	Resources   MaterialDesignComboBox �� BasedOn	 �� 
TargetType
 �� Property �� Value  DetailsButtonStyle  MaterialDesignRaisedButton �� Triggers �� Binding �� Value  ReadOnlyTextBoxStyle  MaterialDesignTextBox.  (MaterialDesignThemes.Wpf.TextFieldAssist  OnlyCreateTextBoxStyle  PrimaryHueMidBrush 	 CustomTextBoxStyle�� %9  '��       7  &	 H     7  &	 �     7  &	 �    7  &		 z    7  �� 8   "	 ��.��� 
 � ��$ Stretch=��� 
 � ��$ 0,8,0,8q��� 8   "	 ��.��� 
 � y�$ 	Collapsed=� ��  �� *Mode+ 2.a��� 
 � y�$ Visible=��� 8   "	 ��.��� 
 �@��
IsReadOnly$
 True���� 
 � ��$ 0q��� 
 �@ UnderlineBrush
 ���� �� 
 � y�$ 	Collapsed=� ��  �� *Mode+ 2.a��� 
 � y�$ Visible=��� 8   "	 ��.��� 
 �@��
IsReadOnly$
 True���� 
 � ��$ 0q��� 
 �@ UnderlineBrush
 ����  ��  �� *Mode+ 0.a��� 
 �@��
IsReadOnly$ False���� 
 � ��$ 0,0,0,1q��� 
 �@ UnderlineBrush# �  �� 8   "	 ��.��� 
 �@��
IsReadOnly$
 True���� 
 � ��$ 0q��� 
 �@ UnderlineBrush
 ����  ��  �� *Mode+ 0.a��� 
 �@��
IsReadOnly$ False���� 
 � ��$ 0,0,0,1q��� 
 �@ UnderlineBrush# �  ��  �� *Mode+ 1.a��� 
 �@��
IsReadOnly$ False���� 
 � ��$ 0,0,0,1q��� 
 �@ UnderlineBrush# �  .��� $��
20,0,20,20q� � RowDefinitions �� $
��Auto ��� $��* �.+�]� $��0��$��0��$��0,0,0,10q�.+��� $
��Left=�$��DemiBold"�����  $
  MaterialDesignHeadline4TextBlock# [
 "	 ��.��� 
 � ��$ Thông tin nhân viên�� ��  �� *Mode+ 1.a��� 
 � ��$) #Cập nhật thông tin nhân viên����  �� *Mode+ 0.a��� 
 � ��$ Tạo mới nhân viên���� $��40��$��40��$
��20,0q�$��0q�$��Center=�
���"�"�
������ $��Right=�#��[  � ToolTip$ Đổi mật khẩu������ *!OpenChangePasswordDialogCommand+.��'  !MaterialDesignThemes.Wpf.PackIcon  $��30��$��30��$��Center=�$��Center=�
�������   Kind$ 	LockReset=��� $��40��$��40��$��20,0,0,0q�$��0q�$��Right=�$��Center=�
������
������ $��Right=�#��[ $ Chỉnh sửa thông tin������ *SwitchToEditCommand+.��  $��30��$��30��$��Center=�$��Center=�
�������$
 Edit=�� $��1��$��0,80,0,0q� � ColumnDefinitions �� $��* ��� $
��Auto ��� $��10 ��� $	��250 ��� $��* ��� $
��Auto ��� $��10 ��� $	��250 ��� $��* � �� $
��Auto ��� $��20 ��� $
��Auto ��� $��20 ��� $
��Auto ��� $��20 ��� $
��Auto ��� $��20 ��� $��* ��� $��20 ��� $
��Auto ��� $��20 �.+��� $��0��$��1��$
��0,10q�$��Center=�$��DemiBold"�$��Tài khoản: ���� -    ��Name$ 
TbUsername��$��0��$��3��$��Center=�)  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Nhập tên đăng nhập�� �� 	MaxLength$ 20��#��[ .������  �� NotifyOnValidationError$
 True��$ User.UserName� �� UpdateSourceTrigger$ PropertyChanged=� �� ValidatesOnDataErrors$
 True�� �� ValidationRules 6   0TachiShop.ValidationRules.UsernameValidationRule     
CheckExist$
 True��5	  /System.Windows.Controls.ExceptionValidationRule	  .���� $��0��$��5��$
��0,10q�$��Center=�$��DemiBold"����� "	 ��.��� 
 � ��$ Ngày tạo: �� ��  �� *Mode+ 0.a��� 
 � ��$ Mật khẩu: ���� $��0��$��7��$��Center=�   UnderlineBrush
 ���� $��0q� �� 
IsReadOnly$ False������ *User.CreatedDate+ �� StringFormat$ {0:dd/MM/yyyy HH:mm:ss}��.�� ��%|   '��       7  �� 8   "	 ��.��� 
 � y�$ Visible=� ��  �� *Mode+ 0.a��� 
 � y�$ 	Collapsed=�.��G� -    G�Name$ 
PbPassword��$��0��$��7��$��Center=�.
   (TachiShop.Infrastructures.PasswordHelper 
  Attach$
 True��$ Nhập mật khẩu��  G� 	MaxLength$  30������   MaterialDesignPasswordBox# [ "	 G�.��� 
 � y�$ 	Collapsed=� ��  �� *Mode+ 0.a��� 
 � y�$ Visible=�! 
  Password! �� " �� Mode$" TwoWay=�$
 True��$ User.Password�$ PropertyChanged=�$
 True�� 6   0TachiShop.ValidationRules.PasswordValidationRule  	  �� $��2��$��1��$��7��$��	0,10,0,20q��� $��4��$��1��$
��0,10q�$��Center=�$��DemiBold"�$��Tên nhân viên: ���� -   $ TbName��$��4��$��3��$��Center=�$&  Nhập họ và tên nhân viên��$ 50��#��[	 .������ $
 True��$ User.FullName�$ PropertyChanged=�$
 True�� 4   .TachiShop.ValidationRules.StringValidationRule  #   RequiredMessage$$# Vui lòng nhập họ và tên��	  .���� $��4��$��5��$
��0,10q�$��Center=�$��DemiBold"�$��Điện thoại: ���� -   $ TbPhoneNumber��$��4��$��7��$��Center=�$! Nhập số điện thoại��#��[	 .������ $
 True��$ User.PhoneNumber�$ PropertyChanged=�$
 True��   $+# %Vui lòng nhập số điện thoại��	  .���� $��6��$��1��$
��0,10q�$��Center=�$��DemiBold"�$��Ngày sinh: ���� $��6��$��3��$��Center=�#��[ ���� *User.BirthDate+$ 
dd/MM/yyyy��(  "System.Windows.Controls.DatePicker  -   $  Name$$ DpBirthDate��$��6��$��3��$��Center=�$ Chọn ngày sinh��
% �� Now&   DisplayDateEnd#& Z% ����   MaterialDesignDatePicker# [ "	  .��� 
 � y�$ Visible=� ��  �� *Mode+ 2.a��� 
 � y�$ 	Collapsed=�'   SelectedDate' �� $
 True��$ User.BirthDate�$ PropertyChanged=�$
 True�� 6   0TachiShop.ValidationRules.DateTimeValidationRule  (   RequiredMessage$!( Vui lòng chọn ngày sinh��	  �� $��6��$��5��$
��0,10q�$��Center=�$��DemiBold"�$��Giới tính: ���� $��6��$��7��$��Center=�#��[ ���� *User.Gender+  EnumConverter) �� 	Converter#) [ * �� ConverterParameter$* GENDER���� -   + ��Name$+ CbGender��$��6��$��7��$��Center=�$ Chọn giới tính��, �� DisplayMemberPath$, Value��- �� SelectedValuePath$	- Key������ *	Genders+���� # [ "	 ��.��� 
 � y�$ Visible=� ��  �� *Mode+ 2.a��� 
 � y�$ 	Collapsed=�. �� SelectedValue. �� $
 True��$ User.Gender�$ PropertyChanged=�$
 True�� 6   0TachiShop.ValidationRules.NotEmptyValidationRule  /   
EmptyValue$/ -1��0   Message$#0 Vui lòng chọn giới tính��	  �� $��8��$��1��$
��0,10q�$	��Top=�$��DemiBold"�$��Email: ���� -   $ TbEmail��$��8��$��3��$	��0,5q�$	��Top=�$ 50��.������ # [	 "	 ��.��� 
 �@ Hint$ Nhập email�� ��  �� *Mode+ 2.a��� 
 �@ Hint$  ��.������ $
 True��$ 
User.Email�$ PropertyChanged=�$
 True��   1   Regex$41 .^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$��2   RegexMessage$2 Email không hợp lệ��3   Required$3 False��	  .���� $��8��$��5��$
��0,10q�$	��Top=�$��DemiBold"�$��Địa chỉ: ���� -   $ 	TbAddress��$��8��$��7��$	��0,5q�$	��Top=�$ Nhập địa chỉ��4 �� AcceptsReturn$
4 True��$	 255��#��[	 5 �� TextWrapping$
5 Wrap=�.������ $
 True��$ User.Address�$ PropertyChanged=�$
 True��   $## Vui lòng nhập địa chỉ��	  .��� $��10��$��1��$��7��$��	0,10,0,10q�$��Stretch=�$��Center=� �� �� �� .+��� $	��100������ *AddEditCommand+  " MaterialDesignRaisedDarkButton��%�  '��       7  �� 8   "	 ��.��� 
 � ��$ Tạo���� 
 �@�ToolTip$$ Tạo tài khoản nhân viên���� 
 � ��
 � � ��� 
 � ��
 � � ��� 
 � y�$ Visible=� ��  �� *Mode+ 1.a��� 
 � ��$ Cập nhật���� 
 �@�ToolTip$) #Cập nhật thông tin nhân viên���� 
 � ��
 ������ 
 � ��
 ������ 
 � y�$ Visible=���  �� *Mode+ 2.a��� 
 � y�$ 	Collapsed=��� $��1��$	��100��$��Hủy��$ Hủy cập nhật������ *CancelEditCommand+ ��%|   '��       7  �� 8   "	 ��.��� 
 � y�$ 	Collapsed=� ��  �� *Mode+ 1.a��� 
 � y�$ Visible=��� $��2��$	��100��$��
Làm mới��$ Làm mới thông tin������ *ClearCommand+ ��%|   '��       7  �� 8   "	 ��.��� 
 � y�$ Visible=� ��  �� *Mode+ 2.a��� 
 � y�$ 	Collapsed=�