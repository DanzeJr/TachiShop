   M S B A M L   `   `   `  ���� D  @TachiShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE'clr-namespace:TachiShop.InfrastructuresTachiShop.Infrastructures  %clr-namespace:TachiShop	TachiShop  E'clr-namespace:TachiShop.ValidationRulesTachiShop.ValidationRules  %    TachiShop.ChangePasswordControl   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  =infrastructures'clr-namespace:TachiShop.Infrastructures  #localclr-namespace:TachiShop  V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  =validationRules'clr-namespace:TachiShop.ValidationRules  $	��400��$
��auto��   MaterialDesignPaper#���     � DataContext  ��   Locator �� Source# [  �� Path$ ChangePasswordViewModel� � 	Resources ,   &TachiShop.ValidationRules.BindingProxy 	 Proxy   Data��%   &	          �� *  $Microsoft.Xaml.Behaviors.Interaction   Triggers +  %Microsoft.Xaml.Behaviors.EventTrigger     	EventName$ Loaded��*  $Microsoft.Xaml.Behaviors.TriggerBase   Actions. 2  ,Microsoft.Xaml.Behaviors.InvokeCommandAction     Command �� *LoadedCommand+  $ Unloaded��.    �� *UnloadedCommand+.��)  #MaterialDesignThemes.Wpf.DialogHost  -   	  Name$	 ChangePasswordDialog��
   DialogTheme$
 Inherit=�   
Identifier$ ChangePasswordDialog��.���  � RowDefinitions �� $
��Auto ��� $��* ��� $	��100 �.+��� $��2��$��Right=� & "MaterialDesignIconForegroundButton#���   � ToolTip$ Thoát������ *CloseDialogCommand+��0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$ Close=�   Size 24�� $��1��$��	50,0,50,0q�$��Stretch=�$	��Top=�$
��Auto=�$
��Auto=�.���  � ColumnDefinitions �� $
��Auto ��� $��* � �� $
��Auto ��� $��20 ��� $
��Auto ��� $��20 ��� $
��Auto ��� $��20 �.+��� $��0��$��0��$��0,0,10,0q�$
��Left=�$��Center=�$��Mật khẩu cũ������   MaterialDesignTextBlock �� BasedOn# [  �� 
TargetType" ��.���  �� Property � y� �� Value$ Visible=� �� Triggers ��  �� Binding �� *RequiredPassword+ �� Value	 False.a���  � y�$ 	Collapsed=�G� -    G�Name$ PbOldPassword��$��0��$��1��$	��180��$��Center=�.   (TachiShop.Infrastructures.PasswordHelper   Attach$
 True��)	  #MaterialDesignThemes.Wpf.HintAssist 	  Hint$ Nhập mật khẩu cũ�� G� 	MaxLength$ 30������   MaterialDesignPasswordBox# [ " G�.���  � y�$ Visible=� ��  �� *RequiredPassword+	 False.a���  � y�$ 	Collapsed=�   Password ��  �� Mode$ TwoWay=� �� NotifyOnValidationError$
 True��$ OldPassword� �� UpdateSourceTrigger$ PropertyChanged=�  �� ValidatesOnDataErrors$
  True��! �� ValidationRules! 6
   0TachiShop.ValidationRules.PasswordValidationRule
  " 
  RequiredMessage$'" !Vui lòng nhập mật khẩu cũ��5  /System.Windows.Controls.ExceptionValidationRule  �� $��2��$��0��$��	0,10,10,0q�$
��Left=�$��Center=�$��Mật khẩu mới��G� -   $ PbNewPassword��$��2��$��1��$	��180��$��0,10,0,0q�$��Center=�$
 True��$ Nhập mật khẩu mới��$ 30�� �� $ TwoWay=�$
 True��$ NewPassword�$ PropertyChanged=�$
  True��! 
  # 
  NotEqualMessage$@# :Mật khẩu mới không được trùng mật khẩu cũ��$)" #Vui lòng nhập mật khẩu mới��$ 
  Wrapper$ /   )TachiShop.ValidationRules.PasswordWrapper  %   NotEqual% �� *Data.OldPassword+# [   �� $��4��$��0��$��	0,10,10,0q�$
��Left=�$��Center=�$$��Xác nhận mật khẩu mới��G� -   $ PbConfirmPassword��$��4��$��1��$	��180��$��0,10,0,0q�$��Center=�$
 True��$% Nhập lại mật khẩu mới��$ 30�� �� $ TwoWay=�$
 True��$ ConfirmPassword�$ PropertyChanged=�$
  True��! 
  & 
  EqualMessage$ & Mật khẩu không khớp��$." (Vui lòng xác nhận mật khẩu mới��$   '   Equal' �� *Data.NewPassword+# [   � $��2��$
��50,0q�$��Center=� �� �� .+��� $
��Auto��$
��Left=�
������
������$��Đổi mật khẩu��( �� 	IsDefault$
( True�� " MaterialDesignRaisedDarkButton#��[ $ Đổi mật khẩu������ *ChangePasswordCommand+�� $��1��$
��Auto��$��Right=�$��
Làm mới��#��[ $ 
Làm mới������ *ClearCommand+