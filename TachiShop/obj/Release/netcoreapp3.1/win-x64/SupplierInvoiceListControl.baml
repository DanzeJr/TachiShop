   M S B A M L   `   `   `  ���� D  @TachiShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:TachiShop	TachiShop  *    $TachiShop.SupplierInvoiceListControl   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  #localclr-namespace:TachiShop  V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  $
��auto��$
��auto��   MaterialDesignPaper#���     � DataContext  ��   Locator �� Source# [  �� Path$" SupplierInvoiceListViewModel�*  $Microsoft.Xaml.Behaviors.Interaction   Triggers +  %Microsoft.Xaml.Behaviors.EventTrigger     	EventName$ Loaded��*  $Microsoft.Xaml.Behaviors.TriggerBase   Actions. 2  ,Microsoft.Xaml.Behaviors.InvokeCommandAction     Command �� *LoadedCommand+  $ Unloaded��.    �� *UnloadedCommand+ � 	Resources   MaterialDesignTextBox �� BasedOn	 �� 
TargetType
 �� Property �� Value  MaterialDesignComboBox�� %�   '��       7  '�� -     7  �� 8   "	 ��.��� 
 � ��$ 0,8,0,8q��� 8   "	 ��.��� 
 � ��$ Stretch=��� 
 � ��$ 0,8,0,8q�.��� $
��20,0q� � RowDefinitions �� $
��Auto ��� $��* �.+�� $��0�� � ColumnDefinitions �� �� .+��� $
��Left=�$��DemiBold"� $  MaterialDesignHeadline4TextBlock#��[ $&�� Danh sách hóa đơn nhập kho���� $��1��$��40��$��40��$��0q�$��Right=�$��Center=�
��� � �
������   MaterialDesignRaisedButton#���   � ToolTip$ Tạo mới hóa đơn������ *ViewAddEditCommand+.��'  !MaterialDesignThemes.Wpf.PackIcon  $��40��$��40��$��Center=�$��Center=�
�������   Kind$	 Add=�&   System.Windows.Controls.DataGrid  $��1��$
��Auto��$��Stretch=�   AutoGenerateColumns$ False��   CanUserAddRows$ False��   
IsReadOnly$
 True��$
��True��$
��Auto=�$
��Auto=����� *SupplierInvoices+   CenterCellStyle��%1   &	       �� "	 ��.��� 
 � ��$ Center=�   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Width5	  /System.Windows.Controls.DataGridLengthConverter$
 Auto	 1
  +System.Windows.Controls.DataGridBoundColumn 
  ElementStyle# [    Header$ Ngày nhập��   SortMemberPath$ 
ImportDate�� 
  Binding �� *
ImportDate+ �� StringFormat$ {0:dd/MM/yyyy HH:mm:ss}��  $
 Auto	 # [ $ Tên nhà cung cấp�� �� *Supplier.Name+  $
 Auto	    MaxWidth$	 350Q�$ Danh sách mặt hàng��$ ProductOptions.Count�� �� *ProductOptions+  CollectionConverter �� 	Converter# [  �� ConverterParameter$ PRODUCTOPTIONS�� �� "	 ��.��� 
 � ��$
 Wrap=�  $
 Auto	 $ Tổng tiền��$ 
TotalPrice�� �� *
TotalPrice+  DecimalConverter# [ $ PRICE�� �� # [ "	 ��.��� 
 � ��$ Right=�4  .System.Windows.Controls.DataGridTemplateColumn  $
 Auto	    CellTemplate �� .R��� $��20��
����  � &	 "MaterialDesignIconForegroundButton#��� 	 $ Xem chi tiết������ * DataContext.ViewDetailsCommand+ �� RelativeSource �� *FindAncestor+ �� AncestorType" >����� *DataContext.Id+ �� *FindAncestor+)  #System.Windows.Controls.DataGridRow"  .��  $��20��$ Forward=�