   M S B A M L   `   `   `  ���� D  @TachiShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:TachiShop	TachiShop  ;"clr-namespace:TachiShop.ViewModelsTachiShop.ViewModels      TachiShop.DashboardWindow   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  #localclr-namespace:TachiShop  V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  3
viewModels"clr-namespace:TachiShop.ViewModels    � Title$  Tachi Shop - Dashboard��$
��1024��$	��700��   MaterialDesignPaper#���    � Icon$ Resources/KhaHanFarm.jpg�� � 
ResizeMode$ 	CanResize=�$��13(�$��Regular"�  MaterialDesignBody#���  &   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�   TextRenderingMode$
 Auto=� � WindowStartupLocation$ CenterScreen=� � WindowStyle$
 None=� � DataContext ��   Locator �� Source# [ 	 �� Path$	 DashboardViewModel���:  4MaterialDesignThemes.Wpf.MaterialDesignFontExtension  
 � WindowState
 �� *WindowState+*  $Microsoft.Xaml.Behaviors.Interaction   Triggers +  %Microsoft.Xaml.Behaviors.EventTrigger     	EventName$ Loaded��*  $Microsoft.Xaml.Behaviors.TriggerBase   Actions. 2  ,Microsoft.Xaml.Behaviors.InvokeCommandAction     Command �� *LoadedCommand+  $ Unloaded��.    �� *UnloadedCommand+.��)  #MaterialDesignThemes.Wpf.DialogHost  -     Name$ 
RootDialog��   DialogTheme$ Inherit=�   
Identifier$ 
RootDialog��.��)  #MaterialDesignThemes.Wpf.DrawerHost     IsLeftDrawerOpen ��  �� ElementName$ MenuToggleButton��$	 	IsChecked�   LeftDrawerContent ]� $	��220��.+�d� $��16q�$��Right=� � Cursor$
 Hand��$	��Top=� ' #MaterialDesignHamburgerToggleButton#��[  d� 	IsChecked �� $ MenuToggleButton��$	 	IsChecked� �� Mode$ TwoWay=�� .+�?	  9MaterialDesignThemes.Wpf.Transitions.TransitioningContent	  -    	 Name$ TrainsitionigContentSlide��C
  =MaterialDesignThemes.Wpf.Transitions.TransitioningContentBase 
  OpeningEffect D  >MaterialDesignThemes.Wpf.Transitions.TransitionEffectExtension  *SlideInFromLeft+   Duration 0:0:0.2.��� -    �Name$ 
GridCursor��$��10��$��60��$��0,0,0,0q�$
��Left=�$	��Top=�  PrimaryHueMidBrush#���  �� -    ��Name$ ListViewMenu��$��0,0,10,0q�$��Champagne & Limousines)�$��18(� �� SelectedIndex$ 0��   $ SelectionChanged��.    �� *SelectionChangedCommand+   CommandParameter �� $ ListViewMenu��$	 SelectedIndex�.@��� $��60��.����  �� Orientation$ 
Horizontal=�.+�'  !MaterialDesignThemes.Wpf.PackIcon  $��30��$��30��$��5q�$��Center=�    Kind$  FruitGrapes=��� $
��20,0q�$��Center=�$��17(�$��
Hàng Hóa���� $��60��.���� $ 
Horizontal=�.+�  $��30��$��30��$��5q�$��Center=�$  Invoice=��� $
��20,0q�$��Center=�$��17(�$��Hóa đơn xuất���� $��60��.���� $ 
Horizontal=�.+�  $��30��$��30��$��5q�$��Center=�$  	Warehouse=��� $
��20,0q�$��Center=�$��17(�$��Hóa đơn nhập���� $��60��.���� $ 
Horizontal=�.+�  $��30��$��30��$��5q�$��Center=�$
  User=��� $
��20,0q�$��Center=�$��17(�$��Nhân viên���� $��60��.���� $ 
Horizontal=�.+�  $��30��$��30��$��5q�$��Center=�$  AccountCash=��� $
��20,0q�$��Center=�$��17(�$��Khách hàng��.��]� .+�(  "MaterialDesignThemes.Wpf.ColorZone  -   $��0,0,0,20q�$��5q�+  %MaterialDesignThemes.Wpf.ShadowAssist!   ShadowDepth$! Depth2=�$	��Top=�
�������"   Mode$" 
PrimaryMid=�.��]� .+��� $ 
Horizontal=�.+�d� -   # d�Name$# MenuToggleButton��4  .System.Windows.Automation.AutomationProperties$   Name$$ HamburgerToggleButton��$
 Hand��$ FalseY�#��[ % � ToolTip$
% Menu���� $��	24,0,12,0q�  MaterialDesignToolButton#���  $% 
Quay lại��+  %MaterialDesignThemes.Wpf.RippleAssist&   Feedback& �� ' �� RelativeSource' �� *Self+$	 
Foreground�  BrushRoundConverter( �� 	Converter#( [ ���� *BackCommand+��0  *MaterialDesignThemes.Wpf.PackIconExtension  )   Kind$) 	ArrowLeft=�*   Size* 24���� ' �� + �� AncestorType"+ �$	 (TextElement.Foreground)�{��� *BackStack.Count+  NotZeroConverter#( [ �� $��8,0,0,0q�#���  $% 
Làm mới��$y�	Collapsed=�& �� ' �� *Self+$	 
Foreground�#( [ ��  $) Refresh=�* 24���� ' �� "+ �$	 (TextElement.Foreground)��� $��Right=�$ 
Horizontal=�.+�'  !MaterialDesignThemes.Wpf.PopupBox  $��8,0,0,0q�,   	StaysOpen$
, True��-   ToggleContent-   $��24��$��24��$  Account=�$% Tài khoản������ ' �� "+  $	 (TextElement.Foreground)�.   PopupContent.. �� $ Vertical=�.+��� $��10q�$��Center=�$ 
Horizontal=�.+��� $��	Xin chào���� $��10,0,0,0q�$��DemiBold"����� *CurrentUser.FullName+�� $��10q�$��Đăng xuất��$
 Hand��  MaterialDesignFlatButton#��[ ���� *LogOutCommand+  $��8,0,0,0q�$
, True��-   $��24��$��24��$  Settings=�$% Cài đặt������ ' �� "+  $	 (TextElement.Foreground)�.. �� .+��� $��10q�$��Center=�$ 
Horizontal=�.+��� $��0,0,10,0q�$��Light��d� -   $# DarkModeToggleButton��$
 Hand���� $��10,0,0,0q�$
��Dark���� $��8,0,0,0q�   System.Windows.WindowState/   	Minimized#��Z/ #���  $% 	Thu nhỏ��& �� ' �� *Self+$	 
Foreground�#( [ ���� *SwitchWindowStateCommand+��  $) WindowMinimize=�* 24���� ' �� "+ �$	 (TextElement.Foreground)��� $��8,0,0,0q�& �� ' �� *Self+$	 
Foreground�#( [ ���� *SwitchWindowStateCommand+���� ' �� "+ �$	 (TextElement.Foreground)�0 � 	Resources0 1 �� BasedOn2 �� 
TargetType3 �� Property4 �� Value5   	Maximized6 �� Triggers7 �� Value8 �� Binding9   Normal��%'  '��       7  �� 81   "2 ��.��� 3 � ��4   $) WindowMaximize=�* 24�� 3 �@�ToolTip$4 	Phóng to���� 3 � ��#4 Z5 6 �� #7 Z5 8 �� *WindowState+.a��� 3 � ��4   $) WindowRestore=�* 24�� 3 �@�ToolTip$4 Bình thường���� 3 � ��#4 Z9 �� $��8,0,0,0q�#���  $% Tắt ứng dụng��& �� ' �� *Self+$	 
Foreground�#( [ ���� *ShutDownCommand+��  $) Shutdown=�* 24���� ' �� "+ �$	 (TextElement.Foreground)��� $��50,0,0,0q�$
��Left=�$��Center=�$��22(�$��
Tachi Shop���� ���� *ChildViewModel+0 : �� DataType/   )TachiShop.ViewModels.ProductListViewModel"   TachiShop.ProductListControl5   /TachiShop.ViewModels.ProductOptionListViewModel(   "TachiShop.ProductOptionListControl7   1TachiShop.ViewModels.SupplierInvoiceListViewModel*   $TachiShop.SupplierInvoiceListControl:   4TachiShop.ViewModels.SupplierInvoiceDetailsViewModel-   'TachiShop.SupplierInvoiceDetailsControl:   4TachiShop.ViewModels.SupplierInvoiceAddEditViewModel-   'TachiShop.SupplierInvoiceAddEditControl/   )TachiShop.ViewModels.InvoiceListViewModel"   TachiShop.InvoiceListControl2    ,TachiShop.ViewModels.InvoiceDetailsViewModel%!   TachiShop.InvoiceDetailsControl2"   ,TachiShop.ViewModels.InvoiceAddEditViewModel%#   TachiShop.InvoiceAddEditControl,$   &TachiShop.ViewModels.UserListViewModel%   TachiShop.UserListControl/&   )TachiShop.ViewModels.UserDetailsViewModel"'   TachiShop.UserDetailsControl0(   *TachiShop.ViewModels.CustomerListViewModel#)   TachiShop.CustomerListControl��%v  (��       *, +)(��      *, +)(�� $     *, +)(�� 6     *, +)(�� H     *, +)(�� Z     *, +)(�� l     *,  +)(�� ~     *," +)(�� �     *,$ +)(�� �     *,& +)(�� �     *,( +)�� ":  .R�  �� ":  .R�  �� ":  .R�  �� ":  .R�  �� ":  .R�  �� ":  .R�  �� ":   .R�!  �� ": " .R�#  �� ": $ .R�%  �� ": & .R�'  �� ": ( .R�)  