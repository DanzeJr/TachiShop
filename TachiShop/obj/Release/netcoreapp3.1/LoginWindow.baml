   M S B A M L   `   `   `  ���� D  @TachiShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE'clr-namespace:TachiShop.InfrastructuresTachiShop.Infrastructures  %clr-namespace:TachiShop	TachiShop  E'clr-namespace:TachiShop.ValidationRulesTachiShop.ValidationRules      TachiShop.LoginWindow   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  =infrastructures'clr-namespace:TachiShop.Infrastructures  #localclr-namespace:TachiShop  V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  =validationRules'clr-namespace:TachiShop.ValidationRules  -     � Title$  Tachi Shop - Login��$	��800��$	��550�� � AllowsTransparency$
 True��   MaterialDesignPaper#���    � Icon$ Resources/KhaHanFarm.jpg�� � 
ResizeMode$ CanMinimize=�$��13(�$��Regular"�  MaterialDesignBody#���  &   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�   TextRenderingMode$
 Auto=� � WindowStartupLocation$ CenterScreen=� � WindowStyle$
 None=� � DataContext ��   Locator	 �� Source#	 [ 
 �� Path$
 LoginViewModel���:  4MaterialDesignThemes.Wpf.MaterialDesignFontExtension  *  $Microsoft.Xaml.Behaviors.Interaction   Triggers +  %Microsoft.Xaml.Behaviors.EventTrigger     	EventName$ Loaded��*  $Microsoft.Xaml.Behaviors.TriggerBase   Actions. 2  ,Microsoft.Xaml.Behaviors.InvokeCommandAction     Command �� *LoadedCommand+  $ Unloaded��.    �� *UnloadedCommand+.��)  #MaterialDesignThemes.Wpf.DialogHost  -     Name$ LoginDialog��   DialogTheme$ Inherit=�   
Identifier$ LoginDialog��   $ DialogClosing��.    �� *FinishLoginCommand+   DialogContent � $��30,20,30,20q� � RowDefinitions �� �� �� .+��� -    ��Name$ TbLoginStatus��$��10q�$��Center=�$��Center=�$��15(�����  �� 
TargetType" ��.���  �� Property � �� �� Value$ Đang đăng nhập...����  � ��
 �   � �� Triggers ��  �� Binding �� *	IsSuccess+ �� Value True.a���  � ��$  Đăng nhập thành công����  � ��$
 Bold"���  � ��
 � � ���  �� *	IsSuccess+	 False.a���  � ��$: 4Tên đăng nhập hoặc mật khẩu không đúng����  � ��$
 Bold"���  � ��
 �  ��� -    �Name$ ProgressBarLogin��$��1��$��10q�$��Center=�$��Center=� � IsIndeterminate$
 True�� % !MaterialDesignCircularProgressBar#��[ y��� *ProgressVisibility+�� -    ��Name$ BtnFinishLogin��$��2��$��0,10,0,0q�$��Center=�$��Center=�   CloseDialogCommand#��Z 
�������  MaterialDesignRaisedButton#��[ ���� *DialogButtonText+.��� .+��  � ColumnDefinitions �� $��* ��� $��* �.+�� $��Center=� �� �� �� �� .+��� $��	0,-80,0,0q�$��Center=� $  MaterialDesignHeadline4TextBlock#���  $��
Tachi Shop���� $��1��$��0,20,0,0q�$��Center=�  �� Orientation$  
Horizontal=�.+�'  !MaterialDesignThemes.Wpf.PackIcon  $��	0,15,10,0q�$��Center=�!   Kind$! Account=����� " �� ElementName$" 
TbUsername��$
 BorderBrush��� -   # ��Name$# 
TbUsername��$	��180��)	  #MaterialDesignThemes.Wpf.HintAssist$ 	  
Foreground
$ � � �% 	  Hint$% Tên đăng nhập��.
  (MaterialDesignThemes.Wpf.TextFieldAssist& 
  UnderlineBrush
& � � � % !MaterialDesignFloatingHintTextBox#��[ .������ ' �� NotifyOnValidationError$
' True��$
 UserName�( �� UpdateSourceTrigger$( PropertyChanged=�) �� ValidatesOnDataErrors$
) True��* �� ValidationRules* 6   0TachiShop.ValidationRules.UsernameValidationRule  5  /System.Windows.Controls.ExceptionValidationRule  .���� $��2��$��0,20,0,0q�$��Center=�$  
Horizontal=�.+�  $��	0,10,10,0q�$��Center=�$
! Lock=����� $" 
PbPassword��$
 BorderBrush�G� -   + G�Name$+ 
PbPassword��$	��180��.   (TachiShop.Infrastructures.PasswordHelper,   Attach$
, True��
$ � � �$% Mật khẩu��
& � � � ) %MaterialDesignFloatingHintPasswordBox#��[ -   Password- �� . �� Mode$. TwoWay=�$
' True��$
 Password�$( PropertyChanged=�$
) True��* 6   0TachiShop.ValidationRules.PasswordValidationRule    �� $��3��$	��165��$��0,20,0,0q�$��Center=�$  Vertical=�.+��� $��0,0,20,0q�$��Center=�$��Ghi nhớ đăng nhập��/ d� 	IsChecked/ �� *
RememberMe+�� -   $ BtnLogin��$	��150��$��40��$��0,30,0,0q�+  %MaterialDesignThemes.Wpf.ButtonAssist0   CornerRadius$0 20��$��Đăng nhập��
�������1 �� 	IsDefault$
1 True��#��[ ���� *LoginCommand+#  MaterialDesignThemes.Wpf.Card  $��1��$��Stretch=�$��Stretch=�.���� $��Center=�$��Resources/KhaHanFarm.jpg��$��UniformToFill=��� $��Right=�$	��Top=�$  
Horizontal=�.+��� -	   $ BtnMinimize��$��30��$��30��  MaterialDesignIconButton#���  2 � ToolTip$2 	Thu nhỏ��.��  
���   �$! WindowMinimize=��� -
   $ BtnClose��$��30��$��30��#���  $2 Đóng ứng dụng��.��  
���   �$! Shutdown=�