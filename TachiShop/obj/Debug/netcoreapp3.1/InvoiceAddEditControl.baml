   M S B A M L   `   `   `  ����D  @TachiShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:TachiShop	TachiShop  5      U QSystem.Runtime, Version=4.2.2.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a7,clr-namespace:System;assembly=System.RuntimeSystem 5
      E'clr-namespace:TachiShop.ValidationRulesTachiShop.ValidationRules  5      %    TachiShop.InvoiceAddEditControl   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  5      #localclr-namespace:TachiShop  5      V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5	      6sys,clr-namespace:System;assembly=System.Runtime  5
      =validationRules'clr-namespace:TachiShop.ValidationRules  5         MaterialDesignPaper#���   5        � DataContext  5      ��   Locator �� Source# [  �� Path$ InvoiceAddEditViewModel�*  $Microsoft.Xaml.Behaviors.Interaction   Triggers 5      +  %Microsoft.Xaml.Behaviors.EventTrigger  5   
      	EventName$ Loaded��6   *  $Microsoft.Xaml.Behaviors.TriggerBase   Actions. 5      2  ,Microsoft.Xaml.Behaviors.InvokeCommandAction     Command 6$   �� *LoadedCommand+5        5   
   $ Unloaded��6   . 5         6$   �� *UnloadedCommand+5       � 	Resources 5      ,   &TachiShop.ValidationRules.BindingProxy 	 Proxy   Data  MaterialDesignTextBox	 �� BasedOn
 �� 
TargetType �� Property �� Value  MaterialDesignComboBox�� 5   
   %  &	       '��      7  '�� n     7    5       69   �� �� 5      8	   "
 ��6E   .�5      ��  � ��$ 0,8,0,8q�6+   5      �� 5      8	   "
 ��6F   .�5      ��  � ��$ Stretch=�68   �� 5       � ��$ 0,8,0,8q�6+   5       5!      .��5$      � $
��20,0q�6    � RowDefinitions 5%   
   �� 5&      $��* �6   �� 5'      $	��100 �6   .+�5*   
   �  � ColumnDefinitions 5+      �� 5,      $
��Auto �6#   �� 5-      $	��240 �6#   �� 5.      $��10 �6#   �� 5/      $��30 �6#   �� 50      $��20 �6#   �� 51      $��* �6#    53      �� 54      $
��Auto �6    �� 55      $
��Auto �6    �� 56      $
��Auto �6    �� 57      $
��Auto �6    �� 58      $
��Auto �6    �� 59      $
��Auto �6    �� 5:      $
��Auto �6    �� 5;      $
��Auto �6    �� 5<      $
��Auto �6    �� 5=      $
��Auto �6    �� 5>      $
��Auto �6    �� 5?      $
��Auto �6    �� 5@      $
��Auto �6    .+�5B      �� $��0��5C      $��0��5D      $��6��5E      $��0,0,0,10q�5F       �� Orientation$ 
Horizontal=�5G      .+�5H      �� -   5         ��Name$ TbTitle��5I      $
��Left=�5J      $��DemiBold"�5K       $  MaterialDesignHeadline4TextBlock#��[ 5L      $'��!Tạo mới hóa đơn bán hàng��5M      5N      &   System.Windows.Controls.DataGrid  5P      -   5          Name$ DataGrid��5Q      $��1��5R      $��8��5S      $��5��5T      $
��Auto��5U         AutoGenerateColumns$ False��5V         CanUserAddRows$ False��5W         
IsReadOnly$
 True��5X      $
��True��5Z      $
��Auto=�5[      $
��Auto=�5\      ��5Y      �� *InvoiceProducts+ �� SelectedItem 5]      �� *SelectedInvoiceProduct+ 5^         CenterRightColumnHeaderStyle & "MaterialDesignDataGridColumnHeader=  7System.Windows.Controls.Primitives.DataGridColumnHeader  CenterRightCellStyle��%,  &	       7  &	 �     �� 5_      8	   "
  5b      .�5c      ��  � ��$ Center=�6E   �� 5d       � ��$ Right=�6G   �� 5e       � ��$	 5,0q�64   5f      �� 5g      "
 ��69   .�5h      ��  � ��$ Center=�6>   �� 5i       � ��$ Right=�6@   5j      5k       5l        5m      $ SelectionChanged��6%   . 5n         60   �� *!DataGridSelectionChangedCommand+5o         Columns 5q      0  *System.Windows.Controls.DataGridTextColumn  5r      ,	  &System.Windows.Controls.DataGridColumn 	  Width5
  /System.Windows.Controls.DataGridLengthConverter$
 Auto
 5s       	  Header$ Tên mặt hàng��5u      1  +System.Windows.Controls.DataGridBoundColumn   Binding 5t      �� *ProductOption.Product.Name+5u        5v      $
 Auto
 5w      $ Ngày nhập��5y       	  SortMemberPath$ ProductOption.CreatedDate��5z       5x      �� *ProductOption.CreatedDate+ �� StringFormat$ {0:dd/MM/yyyy HH:mm:ss}��5z        5{      $
 Auto
 5|      $ 
Đơn Giá��5~      $ Price��5       5}      �� *Price+ 	 DecimalConverter �� 	Converter# [	  �� ConverterParameter$ PRICE��5        5�      $
 Auto
 5�      $ Số lượng��5�      $ Amount��5�       5�      �� *Amount+# [	 $
 UNIT��5�        5�      $
 Auto
 5�      $ Đơn vị tính��5�       5�      �� *Unit+ 
 EnumConverter# [
 $ PRODUCTUNIT��5�        5�      $
 Auto
 5�         ElementStyle# [ 5�      $ Thành tiền��5�       	  HeaderStyle# [ 5�      $ 
TotalPrice��5�       5�      �� *
TotalPrice+# [	 $ PRICE��5�      5�      �� 5�      $��1��5�      $��0��5�      $��16,0,8,0q�5�      $��Center=�5�      $��
Ngày bán��5�      � 5�      $��1��6   $��1��6     5�      �� 5�      $��1* �6'   �� 5�      $��15 �6'   �� 5�      $��1* �6'   .+�5�      (  "System.Windows.Controls.DatePicker  -   5           Name$  DpPurchaseDate��5�      $��25��5�      $��0,0,0,0q�5�      )  #MaterialDesignThemes.Wpf.HintAssist!   Hint$! Chọn ngày��5�      
" �� Now#   DisplayDateEnd## Z" 5�      $   SelectedDate$ 5�      �� 5�      % �� NotifyOnValidationError$
% True��5�      $ PurchaseDate�5�      & �� UpdateSourceTrigger$& PropertyChanged=�5�      ' �� ValidatesOnDataErrors$
' True��5�      ( �� ValidationRules( 5�      6   0TachiShop.ValidationRules.DateTimeValidationRule  5�   "   )   Required$
) True��6I   5  /System.Windows.Controls.ExceptionValidationRule  5�   "   5�      5�      )  #MaterialDesignThemes.Wpf.TimePicker  5�      -   5        *  Name$* TpPurchaseTime��5�      $��2��5�      $��25��5�      $��0,0,0,0q�5�      $! Chọn giờ��5�      +   SelectedTime+ 5�      �� 5�      $
% True��5�      $ PurchaseTime�5�      $& PropertyChanged=�5�      $
' True��5�      ( 5�        5�   "   ,   RequiredMessage$, Vui lòng nhập giờ��6I     5�   "   5�      5�      5�      �� 5�      $��3��5�      $��0��5�      $��	16,20,8,0q�5�      $��Center=�5�      $��Khách hàng��5�      �� 5�      -   5        - ��Name$- 
CbCustomer��5�      $��3��5�      $��1��5�      $��0,20,0,0q�5�      $��Bottom=�5�      $! Chọn khách hàng��5�      . �� DisplayMemberPath$. DisplayValue��5�      / �� SelectedValuePath$/ Id��5�      ��5�      �� *	Customers+ 5�      �� *Invoice.Customer+0 �� SelectedValue0 5�      �� 5�      $
% True��5�      $ Invoice.CustomerId�5�      $& PropertyChanged=�5�      $
' True��5�      ( 5�      2   ,TachiShop.ValidationRules.GuidValidationRule  5�      1   Required$
1 True��6A   2   RequiredMessage$#2 Vui lòng chọn khách hàng��6Q     5�      5�      5�      �� 5�      $��3��5�      $��3��5�      $��30��5�      $��30��5�      $��Bottom=�5�      
��� � �  MaterialDesignIconButton#���  5�      3 � ToolTip$3 Tạo mới khách hàng��5�      ��5�      �� *OpenAddCustomerDialogCommand+.��5�      '  !MaterialDesignThemes.Wpf.PackIcon  
�������4   Kind$4 	PersonAdd=�6=   5�      �� 5�      $��4��5�      $��0��5�      $��2��5�      $��	16,30,8,0q�5�      $��Center=�5�      $��15(�5�      $��DemiBold"�5�      $��Danh sách mặt hàng��5�      �� 5�      $��5��5      $��0��5     $��	16,10,8,0q�5     $��Center=�5     $��Mặt hàng��5     �� 5     -   5        $- 	CbProduct��5     $��5��5     $��1��5     $��0,10,0,0q�5	     $��Bottom=�5
     $! Chọn mặt hàng��5     $
. Name��5     $/ Id��5     ��5     �� *
Products+ 5       5     $ SelectionChanged��6%   . 5        60   �� * ProductSelectionChangedCommand+5      5     �� 5     $
% True��5     $ SelectedProduct�5     $& PropertyChanged=�5     $
' True��5     ( 5     6   0TachiShop.ValidationRules.NotEmptyValidationRule  5     5   Message$"5 Vui lòng chọn mặt hàng��6E     5     5     5!     �� 5#     $��6��5$     $��0��5%     $��	16,18,8,0q�5&     $��Center=�5'     $��Ngày nhập��5(     �� 5)     -   5        $- CbOption��5*     $��6��5+     $��1��5,     $��0,20,0,0q�5-     $��Bottom=�5.     $! Chọn ngày nhập��5/     $. DisplayValue��50     $/ Id��52     ��51     �� *ProductOptions+ 53       54     $ SelectionChanged��6%   . 55        60   �� *OptionSelectionChangedCommand+56      58     �� 59     $
% True��5:     $ SelectedOption�5;     $& PropertyChanged=�5<     $
' True��5=     ( 5>       5?     $#5 Vui lòng chọn ngày nhập��6E     5A     5C     5E     �� 5G     $��7��5H     $��0��5I     $��	16,18,8,0q�5J     $��Center=�5K     $��
Đơn giá��5L     �� 5M     $��7��5N     $��1��5O     $��0,20,8,0q�5P     $��Center=�5Q     $��DemiBold"�5R     
���  ��6 �� TextAlignment$6 Right=�5U     ��5T     �� *SelectedOption.Price+# [	 $ 	PRICELONG��5U     �� 5W     $��8��5X     $��0��5Y     $��	16,18,8,0q�5Z     $��Center=�5[     $��Số lượng��5\     �� 5]     -   5        7 ��Name$7 TbAmount��5^     $��8��5_     $��1��5`     $��0,20,0,3q�5a     $! Nhập số lượng��5b     .  (MaterialDesignThemes.Wpf.TextFieldAssist8   
SuffixText8 5c     �� *SelectedOption.Unit+# [
 $ PRODUCTUNIT��.��6�   ��5d     �� 5e     # [	 5f     $
 UNIT��5g     9 �� Delay$	9 500��5h     $
% True��5i     $ InvoiceProduct.Amount�5j     $& PropertyChanged=�5k     $
' True��5l     ( 5m     5   /TachiShop.ValidationRules.DecimalValidationRule  5n     
:   Min: 0.016D   ;   RequiredMessage$$; Vui lòng nhập số lượng��6O   <   Wrapper< 5o  "   .   (TachiShop.ValidationRules.DecimalWrapper  5p  &   =   DecimalPlaces= 6E   �� *Data.SelectedOption.Unit+  UnitToDecimalPlaceConverter# [ # [ 
>   Max> 6�   �� *Data.SelectedOption.Stock+# [ 5r       5t     5v     .��5w      5x     � 5z     $��10��5{     $��0��5|     $��4��5}     $��	0,30,0,15q�5~      5     �� 5�     $
��1.7* �6'   �� 5�     .+�5�     �� $	��130��5�     $��25��5�     $��Right=�5�     $��11(�5�     ��5�     �� *AddEditProductInvoiceCommand+ 5�      " MaterialDesignRaisedDarkButton? �� Triggers@ �� BindingA �� ElementName  NotZeroConverterB �� Value��%Q  '��       7  7  �� 5�     8	   "
 ��6Z   .�5�     ��  � ��$ Thêm vào hóa đơn��68   �� 5�      �@�ToolTip$' !Thêm mặt hàng vào hóa đơn��68   �� 5�      � ��
 � � �6;   �� 5�      � ��
 � � �6<   ? 5�     �� 5�  "   @ 6.   �� $A DataGrid��$ SelectedItems.Count�8  B True6�   .a�5�  &   ��  � ��$ Cập nhật hóa đơn��6@   �� 5�  &    �@�ToolTip$. (Cập nhật mặt hàng vào hóa đơn��6@   �� 5�  &    � ��
 ����6C   �� 5�  &    � ��
 ����6D   5�  #   5�     5�     5�     �� 5�     $��1��5�     $
��Auto��5�     $��25��5�     $��Center=�5�     $��
Làm mới��5�     $��11(�5�     #��[ 5�     $3 Làm mới mặt hàng��5�     ��5�     �� *ClearProductCommand+5�     5�     �� 5�     $��10��5�     $��5��5�     $
��Auto��5�     $��25��5�     $
��0,15q�5�     $��Right=�5�     $��Xóa khỏi hóa đơn��5�     $��11(�5�     #��[ 5�     $3 Xóa khỏi hóa đơn��5�     ��5�     �� *RemoveProductInvoiceCommand+��5�     �� $A DataGrid��$ SelectedItems�y�5�     �� $A DataGrid��$ SelectedItems.Count�   NotZeroToVisibilityConverter# [ � 5�     $��12��5�     $��5��5�     y�5�     �� *InvoiceProducts.Count+# [  5�     �� 5�     $��2* �6'   �� 5�     $��3* �6'   .+�5�     �� $
��Left=�5�     $��DemiBold"�5�      $  MaterialDesignHeadline6TextBlock#��[ 5�     $��Tổng Tiền: ��5�     �� 5�     $��1��5�     $��Right=�5�     $��DemiBold"�5�     
���  ��#��[ 5�     ��5�     �� *
TotalPrice+# [	 $ 	PRICELONG��5�     5�     � 5�  
   $��1��5�     $��Stretch=�5�     $��Center=�5�      5�     �� 5�     �� 5�      5�     �� 5�     �� 5�     .+�5�     �� $	��120��5�     
��� � �
��� � �$��Tạo hóa đơn��5�     #��[ 5�     $'3 !Tạo mới hóa đơn nhập kho��5�     ��5�     �� *AddInvoiceCommand+5�     �� 5�     $��1��5�     $	��120��5�     $��
Làm mới��5�     #��[ 5�     $3 Làm mới hóa đơn��5�     ��5�     �� *ClearCommand+5�     '  !MaterialDesignThemes.Wpf.Snackbar  5�     $��1��6&   $��1��63   5�     5�     5�     