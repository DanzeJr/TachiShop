   M S B A M L   `   `   `  ����D  @TachiShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:TachiShop	TachiShop  5      "    TachiShop.InvoiceListControl   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  5      #localclr-namespace:TachiShop  5      V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5	         MaterialDesignPaper#���   5
        � DataContext  5      ��   Locator �� Source# [  �� Path$ InvoiceListViewModel�*  $Microsoft.Xaml.Behaviors.Interaction   Triggers 5      +  %Microsoft.Xaml.Behaviors.EventTrigger  5   
      	EventName$ Loaded��6   *  $Microsoft.Xaml.Behaviors.TriggerBase   Actions. 5      2  ,Microsoft.Xaml.Behaviors.InvokeCommandAction     Command 6$   �� *LoadedCommand+5        5   
   $ Unloaded��6   . 5         6$   �� *UnloadedCommand+5       � 	Resources 5        MaterialDesignTextBox �� BasedOn	 �� 
TargetType
 �� Property �� Value  MaterialDesignComboBox�� 5   
   %�   '��       7  '�� R     7  �� 5      8   "	 ��6E   .�5      �� 
 � ��$ 0,8,0,8q�6+   5      �� 5      8   "	 ��6F   .�5      �� 
 � ��$ Stretch=�68   �� 5      
 � ��$ 0,8,0,8q�6+   5      5      .��5       � $
��20,0q�6    � RowDefinitions 5!   
   �� 5"      $
��Auto �6   �� 5#      $��* �6   .+�5%   
   � $��0��6    � ColumnDefinitions 5&      �� 5'      �� 5(      .+�5*      �� $
��Left=�5+      $��DemiBold"�5,       $  MaterialDesignHeadline4TextBlock#��[ 5-      $&�� Danh sách hóa đơn bán hàng��5.      �� 5/      $��1��50      $��40��51      $��40��52      $��0q�53      $��Right=�54      $��Center=�55      
��� � �
������   MaterialDesignRaisedButton#���  59       � ToolTip$ Tạo mới hóa đơn��5:      ��58      �� *ViewAddEditCommand+.��5;      '  !MaterialDesignThemes.Wpf.PackIcon  $��40��5<      $��40��5=      $��Center=�5>      $��Center=�5?      
�������   Kind$	 Add=�5A      5B      5C      &   System.Windows.Controls.DataGrid  5D   
   $��1��5E      $
��Auto��5F      $��Stretch=�5G         AutoGenerateColumns$ False��5H         CanUserAddRows$ False��5I         
IsReadOnly$
 True��5J      $
��True��5L      $
��Auto=�5M      $
��Auto=�5N      ��5K      �� *
Invoices+ 5O        CenterCellStyle��%V   &	       �� 5P      "	 ��60   .�5Q      �� 
 � ��$ Center=�6:   5R      5S         Columns 5T      0  *System.Windows.Controls.DataGridTextColumn  5U      ,  &System.Windows.Controls.DataGridColumn   Width5	  /System.Windows.Controls.DataGridLengthConverter$
 Auto	 5V      1
  +System.Windows.Controls.DataGridBoundColumn 
  ElementStyle# [ 5X         Header$ 
Ngày bán��5Y         SortMemberPath$ CreatedDate��5Z       
  Binding 5W      �� *CreatedDate+ �� StringFormat$ {0:dd/MM/yyyy HH:mm:ss}��5Z        5[      $
 Auto	 5\      # [ 5^      $ Tên khách hàng��5_       5]      �� *Customer.FullName+5_        5`      $
 Auto	 5a         MaxWidth$	 350Q�5b      $ Danh sách mặt hàng��5d      $ InvoiceProducts.Count��5e       5c      �� *InvoiceProducts+  CollectionConverter �� 	Converter# [  �� ConverterParameter$ INVOICEPRODUCTS�� 5f      �� 5g      "	 ��6    .�5h      �� 
 � ��$
 Wrap=�6=   5i      5k        5l      $
 Auto	 5m      $ Tổng tiền��5o      $ 
TotalPrice��5p       5n      �� *
TotalPrice+  DecimalConverter# [ $ PRICE�� 5q      �� 5r      # [ 6    "	 ��6K   .�5s      �� 
 � ��$ Right=�6D   5t      5v      4  .System.Windows.Controls.DataGridTemplateColumn  5w      $
 Auto	 6)      CellTemplate 5x      �� 5y      .R�5z      �� $��20��5{   !   
����  � &	 "MaterialDesignIconForegroundButton#��� 	 5   !   $ Xem chi tiết��5�   !   ��5|   !   �� * DataContext.ViewDetailsCommand+ �� RelativeSource �� *FindAncestor+ �� AncestorType" >���5}   !   �� *DataContext.Id+ �� *FindAncestor+)  #System.Windows.Controls.DataGridRow"  .��5�   "     $��20��6:   $ Forward=�6F   5�      5�      5�      5�      5�      5�      