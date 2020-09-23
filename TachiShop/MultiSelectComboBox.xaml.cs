using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace TachiShop
{
    /// <summary>
    /// Interaction logic for MultiSelectComboBox.xaml
    /// </summary>
    public partial class MultiSelectComboBox : UserControl
    {
        private ObservableCollection<Node> _nodeList;
        public MultiSelectComboBox()
        {
            InitializeComponent();
            _nodeList = new ObservableCollection<Node>();
            Items = new ObservableCollection<MultiSelectComboBoxItem>();
            Items.CollectionChanged += Items_CollectionChanged;
        }

        private void Items_CollectionChanged(object sender, System.Collections.Specialized.NotifyCollectionChangedEventArgs e)
        {
            OnItemsSourceChanged(this, new DependencyPropertyChangedEventArgs(ItemsProperty, e.OldItems, e.NewItems));
        }

        #region Dependency Properties

        public static readonly DependencyProperty ItemsSourceProperty =
             DependencyProperty.Register("ItemsSource", typeof(IList), typeof(MultiSelectComboBox), new FrameworkPropertyMetadata(null,
        new PropertyChangedCallback(MultiSelectComboBox.OnItemsSourceChanged)));

        public static readonly DependencyProperty SelectedItemsProperty =
         DependencyProperty.Register("SelectedItems", typeof(IList), typeof(MultiSelectComboBox), new FrameworkPropertyMetadata(null,
     new PropertyChangedCallback(MultiSelectComboBox.OnSelectedItemsChanged)));

        public static readonly DependencyProperty TextProperty =
           DependencyProperty.Register("Text", typeof(string), typeof(MultiSelectComboBox), new UIPropertyMetadata(string.Empty, new PropertyChangedCallback(MultiSelectComboBox.OnTextChanged)));


        public ObservableCollection<MultiSelectComboBoxItem> Items
        {
            get { return (ObservableCollection<MultiSelectComboBoxItem>)GetValue(ItemsProperty); }
            set { SetValue(ItemsProperty, value); }
        }
        public static readonly DependencyProperty ItemsProperty =
            DependencyProperty.Register("ItemsProperty", typeof(ObservableCollection<MultiSelectComboBoxItem>), typeof(MultiSelectComboBox), new UIPropertyMetadata(null));


        public static readonly DependencyProperty SelectedValuePathProperty = DependencyProperty.Register("SelectedValuePath", typeof(string), typeof(MultiSelectComboBox), new UIPropertyMetadata(string.Empty));
        public static readonly DependencyProperty DisplayMemberPathProperty = DependencyProperty.Register("DisplayMemberPath", typeof(string), typeof(MultiSelectComboBox), new UIPropertyMetadata(string.Empty));


        public ICommand Command
        {
            get { return (ICommand)GetValue(CommandProperty); }
            set { SetValue(CommandProperty, value); }
        }

        public static readonly DependencyProperty CommandProperty = DependencyProperty.Register(
            "Command",
            typeof(ICommand),
            typeof(MultiSelectComboBox),
            new PropertyMetadata(null, OnCommandPropertyChanged));

        private static void OnCommandPropertyChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            MultiSelectComboBox control = d as MultiSelectComboBox;
            if (control == null) return;

        }

        public IList ItemsSource
        {
            get
            {
                var items = (IList)GetValue(ItemsProperty);
                if (items != null && items.Count > 0)
                    return items;
                var itemSource = (IList)GetValue(ItemsSourceProperty);
                return itemSource;
            }
            set
            {
                SetValue(ItemsSourceProperty, value);
            }
        }

        public IList SelectedItems
        {
            get { return (IList)GetValue(SelectedItemsProperty); }
            set
            {
                SetValue(SelectedItemsProperty, value);
            }
        }

        public string Text
        {
            get
            {
                return (string)GetValue(TextProperty);
            }
            set
            {
                SetValue(TextProperty, value);
            }
        }

        public string SelectedValuePath
        {
            get { return (string)GetValue(SelectedValuePathProperty); }
            set { SetValue(SelectedValuePathProperty, value); }
        }

        public string DisplayMemberPath
        {
            get { return (string)GetValue(DisplayMemberPathProperty); }
            set { SetValue(DisplayMemberPathProperty, value); }
        }
        #endregion

        #region Events
        private static void OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            MultiSelectComboBox control = (MultiSelectComboBox)d;
            control.DisplayInControl();
        }

        private static void OnSelectedItemsChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            MultiSelectComboBox control = (MultiSelectComboBox)d;

            control.SelectNodes();
            control.SetText();
        }
        private static void OnTextChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {

            //var test = SelectedItems;
            MultiSelectComboBox control = (MultiSelectComboBox)d;
            if (control.SelectedItems != null)
            {

                StringBuilder displayText = new StringBuilder();
                foreach (Node s in control._nodeList)
                {
                    if (s.IsSelected == true)
                    {
                        displayText.Append(s.Title);
                        displayText.Append(',');
                    }
                }
                var text = (displayText.ToString().TrimEnd(new char[] { ',' }));
                if (e.NewValue.ToString() != text)
                {
                    d.SetValue(TextProperty, text);
                }
            }
            //control.SelectNodes();
            //control.SetText();

        }

        private void CheckBox_Click(object sender, RoutedEventArgs e)
        {
            int _selectedCount = 0;
            foreach (Node s in _nodeList)
            {
                if (s.IsSelected)
                    _selectedCount++;
            }
            SetSelectedItems();
            SetText();

        }
        #endregion


        #region Methods
        private void SelectNodes()
        {
            if (SelectedItems == null)
                return;
            foreach (var node in _nodeList)
            {
                node.IsSelected = SelectedItems.Cast<object>().Any(x => x.GetType().GetProperties().FirstOrDefault(y => y.Name == SelectedValuePath).GetValue(x)?.ToString() == node.Key);
            }
        }

        private void SetSelectedItems()
        {
            if (SelectedItems == null)
            {
                var listType = this.ItemsSource.GetType();


                var instance = Activator.CreateInstance(listType);
                //typeof()
                SelectedItems = (IList)instance;
            }

            SelectedItems.Clear();
            foreach (Node node in _nodeList)
            {
                if (node.IsSelected)
                {
                    if (this.ItemsSource.Count > 0)
                    {
                        var item = this.ItemsSource.Cast<object>().FirstOrDefault(x => x.GetType().GetProperties().FirstOrDefault(y => y.Name == SelectedValuePath).GetValue(x)?.ToString() == node.Key);
                        SelectedItems.Add(item);
                    }

                }
            }

            ICommand command = this.Command;

            if (command != null && command.CanExecute(null))
                command.Execute(SelectedItems);
        }

        private void DisplayInControl()
        {
            if (_nodeList != null && this.ItemsSource != null)
            {
                _nodeList.Clear();
                //if (this.ItemsSource.Count > 0)
                //    _nodeList.Add(new Node("All"));
                foreach (var keyValue in this.ItemsSource)
                {
                    var displayTextKey = keyValue.GetType().GetProperties().FirstOrDefault(x => x.Name == DisplayMemberPath);
                    var displayTextKeyValue = displayTextKey.GetValue(keyValue);

                    var idKey = keyValue.GetType().GetProperties().FirstOrDefault(x => x.Name == SelectedValuePath);
                    var idKeyValue = idKey.GetValue(keyValue);

                    Node node = new Node(idKeyValue?.ToString(), displayTextKeyValue?.ToString());
                    _nodeList.Add(node);
                }
                MultiSelectCombo.ItemsSource = _nodeList;
            }
        }

        private void SetText()
        {
            if (this.SelectedItems != null)
            {
                StringBuilder displayText = new StringBuilder();
                foreach (Node s in _nodeList)
                {
                    if (s.IsSelected == true)
                    {
                        displayText.Append(s.Title);
                        displayText.Append(',');
                    }
                }
                this.Text = displayText.ToString().TrimEnd(new char[] { ',' });
            }
        }


        #endregion

        private void MultiSelectCombo_OnPreviewKeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key != Key.Tab)
                e.Handled = true;
        }

        private void MultiSelectCombo_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ComboBox combo = (ComboBox)sender;
            if (combo.SelectedItem != null && combo.SelectedItem is Node node)
            {
                e.Handled = true;
                node.IsSelected = !node.IsSelected;
                SetSelectedItems();
                SetText();
            }

        }
    }

    public class MultiSelectComboBoxItem
    {
        public string Key { get; set; }

        public string Value { get; set; }
    }

    public class Node : INotifyPropertyChanged
    {

        private string _title, _key;
        private bool _isSelected;
        #region ctor
        public Node(string key, string title)
        {
            Title = title;
            Key = key;
        }
        #endregion

        #region Properties
        public string Key
        {
            get
            {
                return _key;
            }
            set
            {
                _key = value;
                NotifyPropertyChanged("Key");
            }
        }
        public string Title
        {
            get
            {
                return _title;
            }
            set
            {
                _title = value;
                NotifyPropertyChanged("Title");
            }
        }
        public bool IsSelected
        {
            get
            {
                return _isSelected;
            }
            set
            {
                _isSelected = value;
                NotifyPropertyChanged("IsSelected");
            }
        }
        #endregion

        public event PropertyChangedEventHandler PropertyChanged;
        protected void NotifyPropertyChanged(string propertyName)
        {
            if (PropertyChanged != null)
            {
                PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
            }
        }

    }
}
