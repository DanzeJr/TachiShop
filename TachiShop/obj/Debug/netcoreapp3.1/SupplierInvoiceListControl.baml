   M S B A M L   `   `   `  ����D  @TachiShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:TachiShop	TachiShop  5      *    $TachiShop.SupplierInvoiceListControl   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  5      #localclr-namespace:TachiShop  5      V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5	      $
��auto��5
      $
��auto��5         MaterialDesignPaper#���   5        � DataContext  5      ��   Locator �� Source# [  �� Path$" SupplierInvoiceListViewModel�*  $Microsoft.Xaml.Behaviors.Interaction   Triggers 5      +  %Microsoft.Xaml.Behaviors.EventTrigger  5   
      	EventName$ Loaded��6   *  $Microsoft.Xaml.Behaviors.TriggerBase   Actions. 5      2  ,Microsoft.Xaml.Behaviors.InvokeCommandAction     Command 6$   �� *LoadedCommand+5        5   
   $ Unloaded��6   . 5         6$   �� *UnloadedCommand+5       � 	Resources 5        MaterialDesignTextBox �� BasedOn	 �� 
TargetType
 �� Property �� Value  MaterialDesignComboBox�� 5   
   %�   '��       7  '�� R     7  �� 5      8   "	 ��6E   .�5      �� 
 � ��$ 0,8,0,8q�6+   5      �� 5      8   "	 ��6F   .�5      �� 
 � ��$ Stretch=�68   �� 5      
 � ��$ 0,8,0,8q�6+   5      5       .��5"      � $
��20,0q�6    � RowDefinitions 5#   
   �� 5$      $
��Auto �6   �� 5%      $��* �6   .+�5'   
   � $��0��6    � ColumnDefinitions 5(      �� 5)      �� 5*      .+�5,      �� $
��Left=�5-      $��DemiBold"�5.       $  MaterialDesignHeadline4TextBlock#��[ 5/      $&�� Danh sách hóa đơn nhập kho��50      �� 51      $��1��52      $��40��53      $��40��54      $��0q�55      $��Right=�56      $��Center=�57      
��� � �
������   MaterialDesignRaisedButton#���  5;       � ToolTip$ Tạo mới hóa đơn��5<      ��5:      �� *ViewAddEditCommand+.��5=      '  !MaterialDesignThemes.Wpf.PackIcon  $��40��5>      $��40��5?      $��Center=�5@      $��Center=�5A      
�������   Kind$	 Add=�5C      5D      5E      &   System.Windows.Controls.DataGrid  5F   
   $��1��5G      $
��Auto��5H      $��Stretch=�5I         AutoGenerateColumns$ False��5J         CanUserAddRows$ False��5K         
IsReadOnly$
 True��5L      $
��True��5N      $
��Auto=�5O      $
��Auto=�5P      ��5M      �� *SupplierInvoices+ 5Q        CenterCellStyle��%V   &	       �� 5R      "	 ��60   .�5S      �� 
 � ��$ Center=�6:   5T      5U         Columns 5V      0  *System.Windows.Controls.DataGridTextColumn  5W      ,  &System.Windows.Controls.DataGridColumn   Width5	  /System.Windows.Controls.DataGridLengthConverter$
 Auto	 5X      1
  +System.Windows.Controls.DataGridBoundColumn 
  ElementStyle# [ 5Z         Header$ Ngày nhập��5[         SortMemberPath$ 
ImportDate��5\       
  Binding 5Y      �� *
ImportDate+ �� StringFormat$ {0:dd/MM/yyyy HH:mm:ss}��5\        5]      $
 Auto	 5^      # [ 5`      $ Tên nhà cung cấp��5a       5_      �� *Supplier.Name+5a        5b      $
 Auto	 5c         MaxWidth$	 350Q�5d      $ Danh sách mặt hàng��5f      $ ProductOptions.Count��5g       5e      �� *ProductOptions+  CollectionConverter �� 	Converter# [  �� ConverterParameter$ PRODUCTOPTIONS�� 5h      �� 5i      "	 ��6    .�5j      �� 
 � ��$
 Wrap=�6=   5k      5m        5n      $
 Auto	 5o      $ Tổng tiền��5q      $ 
TotalPrice��5r       5p      �� *
TotalPrice+  DecimalConverter# [ $ PRICE�� 5s      �� 5t      # [ 6    "	 ��6K   .�5u      �� 
 � ��$ Right=�6D   5v      5x      4  .System.Windows.Controls.DataGridTemplateColumn  5y      $
 Auto	 6)      CellTemplate 5z      �� 5{      .R�5|      �� $��20��5}   !   
����  � &	 "MaterialDesignIconForegroundButton#��� 	 5�   !   $ Xem chi tiết��5�   !   ��5~   !   �� * DataContext.ViewDetailsCommand+ �� RelativeSource �� *FindAncestor+ �� AncestorType" >���5   !   �� *DataContext.Id+ �� *FindAncestor+)  #System.Windows.Controls.DataGridRow"  .��5�   "     $��20��6:   $ Forward=�6F   5�      5�      5�      5�      5�      5�      