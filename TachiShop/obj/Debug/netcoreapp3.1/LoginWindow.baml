   M S B A M L   `   `   `  ����D  @TachiShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE'clr-namespace:TachiShop.InfrastructuresTachiShop.Infrastructures  5      %clr-namespace:TachiShop	TachiShop  5      E'clr-namespace:TachiShop.ValidationRulesTachiShop.ValidationRules  5          TachiShop.LoginWindow   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  5      =infrastructures'clr-namespace:TachiShop.Infrastructures  5      #localclr-namespace:TachiShop  5      V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5	      Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5
      =validationRules'clr-namespace:TachiShop.ValidationRules  5      -   5          � Title$  Tachi Shop - Login��5      $	��800��5      $	��550��5       � AllowsTransparency$
 True��5         MaterialDesignPaper#���   5       � Icon$ Resources/KhaHanFarm.jpg��5       � 
ResizeMode$ CanMinimize=�5      $��13(�5      $��Regular"�5        MaterialDesignBody#���  5      &   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�5         TextRenderingMode$
 Auto=�5       � WindowStartupLocation$ CenterScreen=�5       � WindowStyle$
 None=�5       � DataContext 5      ��   Locator	 �� Source#	 [ 
 �� Path$
 LoginViewModel���5      :  4MaterialDesignThemes.Wpf.MaterialDesignFontExtension  *  $Microsoft.Xaml.Behaviors.Interaction   Triggers 5      +  %Microsoft.Xaml.Behaviors.EventTrigger  5   
      	EventName$ Loaded��6   *  $Microsoft.Xaml.Behaviors.TriggerBase   Actions. 5       2  ,Microsoft.Xaml.Behaviors.InvokeCommandAction     Command 6$   �� *LoadedCommand+5!        5"   
   $ Unloaded��6   . 5#         6$   �� *UnloadedCommand+5$      .��5&      )  #MaterialDesignThemes.Wpf.DialogHost  -   5          Name$ LoginDialog��5'   	      DialogTheme$ Inherit=�5(   	      
Identifier$ LoginDialog��5)   	    5*   
     5+      $ DialogClosing��6   . 5,         6(   �� *FinishLoginCommand+5-         DialogContent 5/   
   � 50      $��30,20,30,20q�6    � RowDefinitions 51      �� 52      �� 53      �� 54      .+�56      �� -   5         ��Name$ TbLoginStatus��57      $��10q�58      $��Center=�59      $��Center=�5:      $��15(�5;      ��5<      �� 5=       �� 
TargetType" ��6    .�5>      ��  �� Property � �� �� Value$ Đang đăng nhập...��65   �� 5?       � ��
 �   �6;    �� Triggers 5@      �� 5A   "    �� Binding 6.   �� *	IsSuccess+ �� Value True6L   .a�5B   &   ��  � ��$  Đăng nhập thành công��6=   �� 5C   &    � ��$
 Bold"�6C   �� 5D   &    � ��
 � � �6C   5E   #   �� 5F   "    6.   �� *	IsSuccess+	 False6L   .a�5G   &   ��  � ��$: 4Tên đăng nhập hoặc mật khẩu không đúng��6=   �� 5H   &    � ��$
 Bold"�6C   �� 5I   &    � ��
 �  ��6C   5J   #   5L      5N      � 5O      -   5         �Name$ ProgressBarLogin��5P      $��1��5Q      $��10q�5R      $��Center=�5S      $��Center=�5T       � IsIndeterminate$
 True��5U       % !MaterialDesignCircularProgressBar#��[ 5V      y�5W      �� *ProgressVisibility+�� 5X      -   5         ��Name$ BtnFinishLogin��5Y      $��2��5Z      $��0,10,0,0q�5[      $��Center=�5\      $��Center=�5]         CloseDialogCommand#��Z 5^      
�������  MaterialDesignRaisedButton#��[ 5a      ��5_      �� *DialogButtonText+5a      5b      .��5d   
   � .+�5e      �  � ColumnDefinitions 5f      �� 5g      $��* �6'   �� 5h      $��* �6'   .+�5j      � $��Center=�6    5k      �� 5l      �� 5m      �� 5n      �� 5o      .+�5q      �� $��	0,-80,0,0q�5r      $��Center=�5s       $  MaterialDesignHeadline4TextBlock#���  5t      $��
Tachi Shop��5u      �� 5v      $��1��5w      $��0,20,0,0q�5x      $��Center=�5y        �� Orientation$  
Horizontal=�5z      .+�5{      '  !MaterialDesignThemes.Wpf.PackIcon  $��	0,15,10,0q�5|      $��Center=�5}      !   Kind$! Account=�5      ��5~      �� " �� ElementName$" 
TbUsername��$
 BorderBrush�5      �� 5�      -   5        # ��Name$# 
TbUsername��5�      $	��180��5�      )	  #MaterialDesignThemes.Wpf.HintAssist$ 	  
Foreground
$ � � �% 	  Hint$% Tên đăng nhập��5�      .
  (MaterialDesignThemes.Wpf.TextFieldAssist& 
  UnderlineBrush
& � � � % !MaterialDesignFloatingHintTextBox#��[ 5�      .��6X   ��5�      �� 5�   "   ' �� NotifyOnValidationError$
' True��5�   %   $
 UserName�5�   %   ( �� UpdateSourceTrigger$( PropertyChanged=�5�   %   ) �� ValidatesOnDataErrors$
) True��5�   %   * �� ValidationRules* 5�   &   6   0TachiShop.ValidationRules.UsernameValidationRule  5�   *   5  /System.Windows.Controls.ExceptionValidationRule  5�   *   5�   #   .��5�   ,   5�      5�      �� 5�      $��2��5�      $��0,20,0,0q�5�      $��Center=�5�      $  
Horizontal=�5�      .+�5�        $��	0,10,10,0q�5�      $��Center=�5�      $
! Lock=�5�      ��5�      �� $" 
PbPassword��$
 BorderBrush�5�      G� 5�      -   5        + G�Name$+ 
PbPassword��5�      $	��180��5�      .   (TachiShop.Infrastructures.PasswordHelper,   Attach$
, True��5�      
$ � � �$% Mật khẩu��5�      
& � � � ) %MaterialDesignFloatingHintPasswordBox#��[ 5�      -   Password- 5�      �� 5�   "   . �� Mode$. TwoWay=�5�   %   $
' True��5�   %   $
 Password�5�   %   $( PropertyChanged=�5�   %   $
) True��5�   %   * 5�   &   6   0TachiShop.ValidationRules.PasswordValidationRule  5�   *     5�   *   5�   #   5�      5�      �� 5�      $��3��5�      $	��165��5�      $��0,20,0,0q�5�      $��Center=�5�      $  Vertical=�5�      .+�5�      �� $��0,0,20,0q�5�      $��Center=�5�      $��Ghi nhớ đăng nhập��5�      / d� 	IsChecked/ 5�      �� *
RememberMe+�� 5�      -   5        $ BtnLogin��5�      $	��150��5�      $��40��5�      $��0,30,0,0q�5�      +  %MaterialDesignThemes.Wpf.ButtonAssist0   CornerRadius$0 20��5�      $��Đăng nhập��5�      
�������1 �� 	IsDefault$
1 True��5�      #��[ 5�      ��5�      �� *LoginCommand+5�      5�      5�      #  MaterialDesignThemes.Wpf.Card  5�      $��1��5�      $��Stretch=�5�      $��Stretch=�5�      .��5�      �� $��Center=�5�      $��Resources/KhaHanFarm.jpg��5�      $��UniformToFill=�5�      5�      5�      �� 5�      $��Right=�5�      $	��Top=�5�      $  
Horizontal=�5�      .+�5�      �� -	   5        $ BtnMinimize��5�      $��30��5�      $��30��5�        MaterialDesignIconButton#���  5�      2 � ToolTip$2 	Thu nhỏ��5�      .��5�        
���   �$! WindowMinimize=�6A   5�      �� 5�      -
   5        $ BtnClose��5�      $��30��5�      $��30��5�      #���  5�      $2 Đóng ứng dụng��5�      .��5�        
���   �$! Shutdown=�6A   5�      5�      5�      5�      5�      