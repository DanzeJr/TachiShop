   M S B A M L   `   `   `  ���� D  @TachiShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:TachiShop	TachiShop  !    TachiShop.InfoDialogControl   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     )localclr-namespace:TachiShop     V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  $	��250��$	��500��   MaterialDesignPaper#���     � 	Resources    ReadOnlyTextBoxStyle  MaterialDesignTextBox �� BasedOn �� 
TargetType �� Property �� Value.  (MaterialDesignThemes.Wpf.TextFieldAssist��%}   &	       7  �� 8   " ��.���  �@��
IsReadOnly$
 True����  � ��$ 0q���  �@ UnderlineBrush Z� .��]� $��10q�.+��� $	��Top=� �� Orientation$ 
Horizontal=�.+�'  !MaterialDesignThemes.Wpf.PackIcon  -     Name$ PiIcon��$��30��$��30��$
��Left=�$��Center=�
������   Kind$ 
InfoCircle=��� -    ��Name$ TbTitle��$��Center=� $  MaterialDesignHeadline6TextBlock#��[ $��Thông báo��� $��20,20,20,10q�	 � RowDefinitions	 �� $
��Auto ��� $��20 ��� $
��Auto �.+��� -   
 ��Name$
 	TbMessage��$��0��$	��400�� �� AcceptsReturn$
 True��#��[ $��Thông báo cái nhẹ�� �� TextWrapping$
 Wrap=��� -    ��Name$
 BtOk��$��2��$��Center=�)  #MaterialDesignThemes.Wpf.DialogHost   CloseDialogCommand#��Z $��OK�� " MaterialDesignRaisedDarkButton#��[ 