   M S B A M L   `   `   `  ���� D  @TachiShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:TachiShop	TachiShop  E'clr-namespace:TachiShop.ValidationRulesTachiShop.ValidationRules  %    TachiShop.ProductAddEditControl   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  #localclr-namespace:TachiShop  V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  =validationRules'clr-namespace:TachiShop.ValidationRules  $	��400��$
��auto��   MaterialDesignPaper#���     � DataContext  ��   Locator �� Source# [  �� Path$ ProductAddNewViewModel�*  $Microsoft.Xaml.Behaviors.Interaction   Triggers +  %Microsoft.Xaml.Behaviors.EventTrigger     	EventName$ Loaded��*  $Microsoft.Xaml.Behaviors.TriggerBase   Actions. 2  ,Microsoft.Xaml.Behaviors.InvokeCommandAction     Command �� *LoadedCommand+  $ Unloaded��.    �� *UnloadedCommand+.���  � RowDefinitions �� $
��Auto ��� $��* ��� $	��100 �.+��� $��2��$��Right=� & "MaterialDesignIconForegroundButton#���   � ToolTip$ Thoát������ *CloseDialogCommand+��0  *MaterialDesignThemes.Wpf.PackIconExtension  	   Kind$	 Close=�
   Size
 24�� $��1��$��	50,0,50,0q�$��Stretch=�$	��Top=�$
��Auto=�$
��Auto=�.���  � ColumnDefinitions �� $
��Auto ��� $��* � �� $��* ��� $��10 ��� $��* ��� $��10 ��� $��* ��� $��20 �.+��� $��0��$��0��$��0,0,10,0q�$
��Left=�$��Center=�$��Tên mặt hàng���� -    ��Name$ TbName��$��0��$��1��$	��208��)  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Nhập tên mặt hàng�� �� 	MaxLength$ 50�� �� TextWrapping$
 Wrap=�.������  �� NotifyOnValidationError$
 True��$ Product.Name� �� UpdateSourceTrigger$ PropertyChanged=� �� ValidatesOnDataErrors$
 True�� �� ValidationRules 4   .TachiShop.ValidationRules.StringValidationRule     RequiredMessage$' !Vui lòng nhập tên mặt hàng��5  /System.Windows.Controls.ExceptionValidationRule  .���� $��2��$��0��$��	0,10,10,0q�$
��Left=�$��Center=�$��Trạng thái���� -    ��Name$ CbStatus��$��2��$��1��$	��208��$��0,10,0,0q�$ Chọn trạng thái�� �� DisplayMemberPath$ Value�� �� SelectedValuePath$	 Key������ *
Statuses+ �� SelectedValue �� $
 True��$ Product.Status�$ PropertyChanged=�$
 True�� 6	   0TachiShop.ValidationRules.NotEmptyValidationRule	   	  
EmptyValue$ -1�� 	  Message$$ Vui lòng chọn trạng thái��  �� $��4��$��0��$��	0,10,10,0q�$
��Left=�$��Center=�$��
Danh mục��#
   TachiShop.MultiSelectComboBox
  -    
 Name$ MCbCategories��$��4��$��1��$	��208��$��0,10,0,0q�$ Chọn danh mục�� 
  DisplayMemberPath$
 Name�� 
  SelectedValuePath$ Id�� 
  ItemsSource �� *
Categories+ 
  SelectedItems �� *Product.Categories+� $��2��$��Stretch=�$��Center=� �� �� .+��� $	��100������ *AddEditCommand+  � 	Resources   " MaterialDesignRaisedDarkButton! �� BasedOn" �� 
TargetType# �� Property$ �� Value% �� Triggers& �� Binding  NullableToBooleanConverter' �� 	Converter( �� Value��%N  '��       7  7  �� 8!   "" ��.��� # � ��$$ Tạo���� # �@�ToolTip$$ Tạo mới mặt hàng���� # � ��
$ � � ��� # � ��
$ � � �% �� & �� *Id+8'  ( True.a��� # � ��$$ Cập nhật���� # �@�ToolTip$$ Cập nhật mặt hàng���� # � ��
$ ������ # � ��
$ ������ $��1��$	��100��$��
Làm mới��#��[ $ Làm mới mặt hàng������ *ClearCommand+