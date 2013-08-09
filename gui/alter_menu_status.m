function newstc = alter_menu_status(stc, parent, field, value)
stc.(parent).(field) = value;
newstc = stc;