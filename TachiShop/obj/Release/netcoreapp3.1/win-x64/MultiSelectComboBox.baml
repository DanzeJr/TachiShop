   M S B A M L   `   `   `  ���� D  @TachiShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:TachiShop	TachiShop  #    TachiShop.MultiSelectComboBox   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     )localclr-namespace:TachiShop     V RMaterialDesignThemes.Wpf, Version=3.1.3.1513, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes    � 	Resources     MultiSelectComboBoxTemplate �� 
TargetType �Name J� SnapsToDevicePixels6  0MaterialDesignThemes.Wpf.BottomDashedLineAdorner   Brush   	Thickness   
IsAttached �� RelativeSource  NotConverter �� 	Converter	 � ColumnDefinitions
 d�Name & "MaterialDesignComboBoxToggleButton d� 	IsChecked �� Mode � UseLayoutRounding J� Opacity �� Path ��Name# �� SelectionBoxItemStringFormat �� ContentStringFormat �� SelectionBoxItemTemplate J� IsHitTestVisible ��Name ) %MaterialDesignComboBoxEditableTextBox �� 
IsReadOnly �� 
CaretBrush(  "MaterialDesignThemes.Wpf.SmartHint  Name)  #MaterialDesignThemes.Wpf.HintAssist   Hint   Hint   	HintProxyB  <MaterialDesignThemes.Wpf.Converters.HintProxyFabricConverter   Instance   UseFloating   FloatingScale   FloatingOffset    HintOpacity! �� Orientation" ��Name  MaterialDesignToolButton  ClearTextConverter# `� 	Converter$ �� ElementName'  !MaterialDesignThemes.Wpf.PackIcon%   Kind(  "MaterialDesignThemes.Wpf.Underline&  Name.  (MaterialDesignThemes.Wpf.TextFieldAssist'   UnderlineBrush(   IsActive
) �� Top,  &MaterialDesignThemes.Wpf.ComboBoxPopup*  Name+ � AllowsTransparency, � HorizontalOffset- � VerticalOffset.   DefaultVerticalOffset/   DownVerticalOffset0   UpVerticalOffset1   CornerRadius2   ContentMargin  MaterialDesignPaper
3 � Tag  PopupContentUpTemplate4   UpContentTemplate  PopupContentDownTemplate5   DownContentTemplate 	 PopupContentClassicTemplate6   ClassicContentTemplate7 � PlacementTarget8   ContentMinWidth 
 MathAddConverter9 �� ConverterParameter.	  (MaterialDesignThemes.Wpf.ColorZoneAssist: 	  Mode;   ClassicMode<   
Background  FallbackBrushConverter= �� MaxDropDownHeight> ��Name-
  'System.Windows.Input.KeyboardNavigation? 
  DirectionalNavigation@ �� TriggersA P� 
SourceNameB P� PropertyC P� Value # MaterialDesignComboBoxItemStyleD �� ValueE �� PropertyF �� 
TargetNameG ]� 
ConditionsH �� PropertyI �� ValueJ �� 
SourceName  ValidationErrorBrush  RemoveAlphaBrushConverter  MaterialDesignBody  PrimaryHueLightBrush " PrimaryHueLightForegroundBrush  PrimaryHueMidBrush   PrimaryHueMidForegroundBrush  PrimaryHueDarkBrush ! PrimaryHueDarkForegroundBrush  SecondaryAccentBrush " SecondaryAccentForegroundBrush ! MaterialDesignLightBackground ! MaterialDesignLightForeground   MaterialDesignDarkBackground   MaterialDesignDarkForeground  MultiSelectComboBoxK �� 
TargetType  MaterialDesignTextBoxBorderL �� AncestorType ) %MaterialDesignValidationErrorTemplateM �� Triggers-  'MaterialDesignThemes.Wpf.ComboBoxAssist  	TrueValue��%�#  &	        7  7  7  7  7  7  7  7 	 7 
 7  7  7  7  7  7  7  7  7  7  &	 �    7  7  7   7  7  7  �� " ��.R�� $ templateRoot��#��z��$
 True��.+��� .u�� $ 	InnerRoot��# z��# z�� �� *	IsEnabled+ �� *Self+8   	 �� $��* ��� $��0 �#��� r�.+�d� $
 toggleButton��$��2��#��z��#��z��#��z��8��  �� *IsDropDownOpen+$ TwoWay=� �� *TemplatedParent+� #��z��#��z��#��z��# z # z 	 �� $
��Auto ��� $��* ��� $
��Auto �.+��� $��0��#��z�� �� $- '(materialDesign:HintAssist.HintOpacity)� �� *TemplatedParent+� $ 	InputRoot��$��1��$��Stretch=�$��Stretch=�.+��� $ contentPresenter��# z #��z #��z��$ False������ $
 Text� �� *TemplatedParent+�� $ PART_EditableTextBox��$��Stretch=�$��Stretch=�8�� $y�	Collapsed=� �� *
IsReadOnly+ �� *TemplatedParent+ ��  �� *TemplatedParent+$ BorderBrush�  $
 Hint��#��z��# z # z # z  ��  �� *TemplatedParent+# Z  �� $, &(materialDesign:HintAssist.IsFloating)� �� *TemplatedParent+ �� $/ )(materialDesign:HintAssist.FloatingScale)� �� *TemplatedParent+ �� $0 *(materialDesign:HintAssist.FloatingOffset)� �� *TemplatedParent+  �� $- '(materialDesign:HintAssist.HintOpacity)� �� *TemplatedParent+�� $! 
Horizontal=�$��2��$	��Top=�.+��� #��z�� �� $- '(materialDesign:HintAssist.HintOpacity)� �� *TemplatedParent+���� $1 +(materialDesign:TextFieldAssist.SuffixText)� �� *TemplatedParent+�� $" PART_ClearButton��$
��Auto��$��2,0,-6,0q�#���  $|�False��y�`� 8#  .1��� $
$ Hint��$ IsContentNullOrEmpty�8  �� $5 /(materialDesign:TextFieldAssist.HasClearButton)� �� *TemplatedParent+.��  $��0q�$% CloseCircle=�  $& 	Underline��$��2��' �� $5 /(materialDesign:TextFieldAssist.UnderlineBrush)� �� *TemplatedParent+( �� $$ PART_EditableTextBox��$ IsKeyboardFocused�y��� $; 5(materialDesign:TextFieldAssist.DecorationVisibility)� �� *TemplatedParent+���� $5 /(materialDesign:TextFieldAssist.UnderlineBrush)� �� *TemplatedParent+�� $��0��$��Bottom=�.+��� $) 2��$��10(����� *ActualWidth+$$ toggleButton�� �� $- '(materialDesign:HintAssist.HintOpacity)� �� *TemplatedParent+���� $, &(materialDesign:HintAssist.HelperText)� �� *TemplatedParent+  $* 
PART_Popup��$��0��$
+ True��$|�False��$, -11.5��$
 True��$
 True��$��Custom=�$
��Fade=�$- 0��$. 5Q�$/ -15.5Q�$0 15Q�$1 2��$2 6q�#3 �  84  85  86  ���� *IsDropDownOpen+$ TwoWay=� �� *TemplatedParent+7 �� $$ templateRoot��8 �� $$ templateRoot��$ ActualWidth�8  $9 32��: �� $+ %(materialDesign:ColorZoneAssist.Mode)� �� *TemplatedParent+; �� $1 +(materialDesign:ComboBoxAssist.ClassicMode)� �� *TemplatedParent+< `� 8# 	 .1��� $ 
Background� �� *TemplatedParent+�� $	 Tag�$$ 
PART_Popup��.���� .���� #��z= $��1������ *
Background+$$ 
PART_Popup��.���� $> ItemsPresenter��$? 	Contained=�@ P� $A 
PART_Popup��B �@ PopupPlacement$C Classic=�. ��� 8D 
 E � ��P� $A 
PART_Popup��B � ��$
C True��. ��� $F templateRoot��D �� *
Background+$$ 
PART_Popup��E � ��P� B � {�$C False��. ��� $F templateRoot��E �@J�Opacity$
D 0.56Q��� $F toggleButton��E � ��
D ���� P� B �@��
IsEditable$
C True��. ��� $F PART_EditableTextBox��E � y�$D Visible=��� $F 	Underline��D �� $; 5(materialDesign:TextFieldAssist.DecorationVisibility)� �� *TemplatedParent+E � y��� $F contentPresenter��E � y�$D 	Collapsed=�P� B �@ 
IsFloating$
C True��. ��� $F 	InnerRoot��E � ��$D 
0 11.5 0 0q�]� G �� H �@��
IsEditable$I False���� H �@��IsDropDownOpen$
I True��./��� $F 	Underline��E � y�$D Hidden=��� $F toggleButton��E � ��
D ���� ]� G �� $
J Hint��H �@ IsContentNullOrEmpty$I False���� H �@ 
IsFloating$
I True���� H �@J�IsKeyboardFocusWithin$
I True��./��� $
F Hint��D �� $, &(materialDesign:HintAssist.Foreground)� �� *TemplatedParent+E � ���� $
F Hint��E �@ HintOpacity$D 1Q�]� G �� H �@ 
IsFloating$
I True���� $
J Hint�� H �@ IsHintInFloatingPosition$
I True���� H �@J�IsKeyboardFocusWithin$
I True��./��� $
F Hint��D �� $, &(materialDesign:HintAssist.Foreground)� �� *TemplatedParent+E � ���� $
F Hint��E �@ HintOpacity$D 1Q�]� G �� $
J Hint��H �@ IsContentNullOrEmpty$I False���� $J PART_EditableTextBox��H �@J�IsKeyboardFocused$
I True��./��� $
F Hint��D �� $, &(materialDesign:HintAssist.Foreground)� �� *TemplatedParent+E � ���� $
F Hint��E �@ HintOpacity$D 1Q�]� G �� $
J Hint��H �@ IsContentNullOrEmpty$I False���� H �@��IsDropDownOpen$
I True��./��� $
F Hint��D �� $, &(materialDesign:HintAssist.Foreground)� �� *TemplatedParent+E � ���� $
F Hint��E �@ HintOpacity$D 1Q�]� G �� H �@��
IsGrouping$
I True���� "H �@%�IsVirtualizingWhenGrouping$I False��./��� E � ��$D False��P� B �@J�IsKeyboardFocused$
C True��. ��� $F 	Underline��E �@ IsActive$
D True��P� B �@=�HasError$
C True��. ��� #D �  E � ���� $F 	Underline��#D �  E � ��]� G �� H �@J�IsMouseOver$
I True���� H �@=�HasError$
I True��./��� #D �  E � ���� $F 	Underline��#D �  E � ��]� G �� H �@J�IsMouseOver$
I True���� H �@=�HasError$I False��./��� D �� $5 /(materialDesign:TextFieldAssist.UnderlineBrush)� �� *Self+E � ���� $F 	Underline��D �� $5 /(materialDesign:TextFieldAssist.UnderlineBrush)� �� *Self+E � ��]� G �� $J 
PART_Popup��H � ��$
I True���� $J 
PART_Popup��H �@	 Mode$I Standard=�./��� $F 
PART_Popup��#D �  E �@�Tag�� $F 
PART_Popup��D �� *Tag+ �� *Self+8  E �@ 
Background�� #D �  E � ��]� G �� $J 
PART_Popup��H � ��$
I True���� $J 
PART_Popup��H �@	 Mode$I Inverted=�./��� $F 
PART_Popup��#D �  E �@�Tag�� $F 
PART_Popup��D �� *Tag+ �� *Self+8  E �@ 
Background�� #D �  E � ��]� G �� $J 
PART_Popup��H � ��$
I True���� $J 
PART_Popup��H �@	 Mode$I PrimaryLight=�./��� $F 
PART_Popup��#D �  E �@�Tag�� $F 
PART_Popup��D �� *Tag+ �� *Self+8  E �@ 
Background�� #D �  E � ��]� G �� $J 
PART_Popup��H � ��$
I True���� $J 
PART_Popup��H �@	 Mode$I 
PrimaryMid=�./��� $F 
PART_Popup��#D �  E �@�Tag�� $F 
PART_Popup��D �� *Tag+ �� *Self+8  E �@ 
Background�� #D �  E � ��]� G �� $J 
PART_Popup��H � ��$
I True���� $J 
PART_Popup��H �@	 Mode$I PrimaryDark=�./��� $F 
PART_Popup��#D �  E �@�Tag�� $F 
PART_Popup��D �� *Tag+ �� *Self+8  E �@ 
Background�� #D �  E � ��]� G �� $J 
PART_Popup��H � ��$
I True���� $J 
PART_Popup��H �@	 Mode$I Accent=�./��� $F 
PART_Popup��#D �  E �@�Tag�� $F 
PART_Popup��D �� *Tag+ �� *Self+8  E �@ 
Background�� #D �  E � ��]� G �� $J 
PART_Popup��H � ��$
I True���� $J 
PART_Popup��H �@	 Mode$I Light=�./��� $F 
PART_Popup��#D �  E �@�Tag�� $F 
PART_Popup��D �� *Tag+ �� *Self+8  E �@ 
Background�� #D �  E � ��]� G �� $J 
PART_Popup��H � ��$
I True���� $J 
PART_Popup��H �@	 Mode$
I Dark=�./��� $F 
PART_Popup��#D �  E �@�Tag�� $F 
PART_Popup��D �� *Tag+ �� *Self+8  E �@ 
Background�� #D �  E � ���� "K ��.��� E �@�FocusVisualStyleD Z� �� E � ��
D ���� �� E � ��#D �  �� E � ��D ��  �� "L �$ (TextElement.Foreground)��� E � ��$D 0 0 0 1q��� E � ��8D   �� E � ��$
D Auto=��� E � ��$
D Auto=��� E � ��$D 0 6 0 6q��� E � ��$	D Top=��� E � ��$D Stretch=��� E � ��$D Stretch=��� E � ��$D Center=��� E � ��$
D True���� E �@��PanningMode$
D Both=��� E �@��IsFlicksEnabled$D False���� E �@=�ErrorTemplate8D  �� E �@ TextBoxViewMargin$D 1 0 1 0q��� E �@ UnderlineBrush#D �  �� E �@	 Mode$D Standard=��� E �@ 
Foreground#D �  �� E � ��8D  M P� B �@J�IsKeyboardFocused$
C True��. ��� E � ��D �� $5 /(materialDesign:TextFieldAssist.UnderlineBrush)� �� *Self+P� B �@J�IsKeyboardFocusWithin$
C True��. ��� E � ��D �� $5 /(materialDesign:TextFieldAssist.UnderlineBrush)� �� *Self+P� B �@��
IsEditable$
C True��. ��� E � ��$D False���� E �@ ShowSelectedItem8D  P� B �@ ShowSelectedItem8C  . ��� E � ��8D  .���� -   N ��Name$N MultiSelectCombo��#��[ O   
IsFloatingO �� $, &(materialDesign:HintAssist.IsFloating)� �� L UserControlP �� TextP �� $
 Text� �� Q �� Mode$Q FindAncestor=�L UserControl���� .R��� -   ���� *Title+ �� $ 
IsSelected�$ TwoWay=�