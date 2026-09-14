package lab1.controller;

import lab1.model.InternetLifeModel;
import lab1.view.InputDialog;
import lab1.view.MainFrame;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class InternetLifeController {
    private final InternetLifeModel model;
    private final MainFrame view;

    public InternetLifeController(InternetLifeModel model, MainFrame view) {
        this.model = model;
        this.view = view;
    }

    public void start() {
        view.bindModel(model);
        view.addInputButtonListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent event) {
                requestInput();
            }
        });
        view.setLocationRelativeTo(null);
        view.setVisible(true);
    }

    private void requestInput() {
        Double hoursPerDay = InputDialog.showDialog(view, model.getHoursPerDay(), model.hasData());
        if (hoursPerDay != null) {
            model.setHoursPerDay(hoursPerDay);
        }
    }
}
