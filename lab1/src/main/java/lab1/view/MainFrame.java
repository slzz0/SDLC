package lab1.view;

import lab1.model.InternetLifeModel;
import lab1.model.InternetLifeResult;
import lab1.util.FormatUtils;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingConstants;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Font;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.event.ActionListener;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;

public class MainFrame extends JFrame {
    private final JLabel inputValueLabel;
    private final JLabel yearsOnlineLabel;
    private final JLabel totalHoursLabel;
    private final JLabel memesLabel;
    private final JLabel adsLabel;
    private final JButton inputButton;

    public MainFrame() {
        super("Сколько ты проживешь в интернете");

        inputValueLabel = createValueLabel("Нет данных");
        yearsOnlineLabel = createValueLabel("0 лет");
        totalHoursLabel = createValueLabel("0 часов");
        memesLabel = createValueLabel("0");
        adsLabel = createValueLabel("0");
        inputButton = new JButton("Ввести данные");

        configureWindow();
        buildLayout();
    }

    public void bindModel(final InternetLifeModel model) {
        model.addPropertyChangeListener(new PropertyChangeListener() {
            @Override
            public void propertyChange(PropertyChangeEvent event) {
                updateFromModel(model);
            }
        });
        updateFromModel(model);
    }

    public void addInputButtonListener(ActionListener listener) {
        inputButton.addActionListener(listener);
    }

    private void configureWindow() {
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(620, 420);
        setMinimumSize(getSize());
    }

    private void buildLayout() {
        JPanel root = new JPanel(new BorderLayout(18, 18));
        root.setBorder(BorderFactory.createEmptyBorder(24, 28, 24, 28));
        root.setBackground(new Color(245, 247, 250));

        JLabel titleLabel = new JLabel("Сколько ты проживешь в интернете", SwingConstants.CENTER);
        titleLabel.setFont(titleLabel.getFont().deriveFont(Font.BOLD, 22f));

        JPanel contentPanel = new JPanel(new GridBagLayout());
        contentPanel.setOpaque(false);

        addRow(contentPanel, 0, "Часов онлайн в день:", inputValueLabel);
        addRow(contentPanel, 1, "Лет жизни в интернете:", yearsOnlineLabel);
        addRow(contentPanel, 2, "Всего часов онлайн:", totalHoursLabel);
        addRow(contentPanel, 3, "Мемов увидено:", memesLabel);
        addRow(contentPanel, 4, "Рекламы пролистано:", adsLabel);

        JPanel buttonPanel = new JPanel();
        buttonPanel.setOpaque(false);
        inputButton.setFont(inputButton.getFont().deriveFont(Font.BOLD, 15f));
        inputButton.setFocusPainted(false);
        buttonPanel.add(inputButton);

        root.add(titleLabel, BorderLayout.NORTH);
        root.add(contentPanel, BorderLayout.CENTER);
        root.add(buttonPanel, BorderLayout.SOUTH);

        setContentPane(root);
    }

    private void addRow(JPanel panel, int row, String name, JLabel valueLabel) {
        GridBagConstraints nameConstraints = new GridBagConstraints();
        nameConstraints.gridx = 0;
        nameConstraints.gridy = row;
        nameConstraints.weightx = 0.45;
        nameConstraints.anchor = GridBagConstraints.EAST;
        nameConstraints.insets = new Insets(8, 8, 8, 12);

        JLabel nameLabel = new JLabel(name);
        nameLabel.setFont(nameLabel.getFont().deriveFont(Font.PLAIN, 15f));
        panel.add(nameLabel, nameConstraints);

        GridBagConstraints valueConstraints = new GridBagConstraints();
        valueConstraints.gridx = 1;
        valueConstraints.gridy = row;
        valueConstraints.weightx = 0.55;
        valueConstraints.fill = GridBagConstraints.HORIZONTAL;
        valueConstraints.insets = new Insets(8, 12, 8, 8);

        panel.add(valueLabel, valueConstraints);
    }

    private JLabel createValueLabel(String text) {
        JLabel label = new JLabel(text);
        label.setFont(label.getFont().deriveFont(Font.BOLD, 16f));
        label.setForeground(new Color(35, 74, 120));
        return label;
    }

    private void updateFromModel(InternetLifeModel model) {
        if (!model.hasData()) {
            inputValueLabel.setText("Нет данных");
            yearsOnlineLabel.setText("Нет данных");
            totalHoursLabel.setText("Нет данных");
            memesLabel.setText("Нет данных");
            adsLabel.setText("Нет данных");
            return;
        }

        InternetLifeResult result = model.getResult();
        inputValueLabel.setText(FormatUtils.formatDecimal(result.getHoursPerDay()) + " ч");
        yearsOnlineLabel.setText(FormatUtils.formatDecimal(result.getYearsOnline()) + " лет");
        totalHoursLabel.setText(FormatUtils.formatDecimal(result.getTotalOnlineHours()) + " часов");
        memesLabel.setText(FormatUtils.formatInteger(result.getMemesSeen()));
        adsLabel.setText(FormatUtils.formatInteger(result.getAdsScrolled()));
    }
}
