function varargout = emg_grouping_gui(varargin)
% EMG_GROUPING_GUI M-file for emg_grouping_gui.fig
%      EMG_GROUPING_GUI, by itself, creates a new EMG_GROUPING_GUI or raises the existing
%      singleton*.
%
%      H = EMG_GROUPING_GUI returns the handle to a new EMG_GROUPING_GUI or the handle to
%      the existing singleton*.
%
%      EMG_GROUPING_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EMG_GROUPING_GUI.M with the given input arguments.
%
%      EMG_GROUPING_GUI('Property','Value',...) creates a new EMG_GROUPING_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before emg_grouping_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to emg_grouping_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help emg_grouping_gui

% Last Modified by GUIDE v2.5 12-Aug-2013 17:28:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @emg_grouping_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @emg_grouping_gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before emg_grouping_gui is made visible.
function emg_grouping_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to emg_grouping_gui (see VARARGIN)

% Choose default command line output for emg_grouping_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes emg_grouping_gui wait for user response (see UIRESUME)
% uiwait(handles.main_window);
global tab_struct selected_chan features_struct features_parent_struct

selected_chan = 2;
st1 = struct('parent', 'amplitude', 'active', 0);
st2 = struct('parent', 'frequency', 'active', 0);
st3 = struct('parent', 'entropy', 'active', 0);
st4 = struct('parent', 'linearity', 'active', 0);
st5 = struct('parent', 'stationarity', 'active', 0);
st6 = struct('parent', 'similarity', 'active', 0);
st7 = struct('parent', 'variability', 'active', 0);
features_parent_struct = struct('amplitude_menu', [1 5], 'frequency_menu', [6 10], ...
 'entropy_menu', [11 15], 'linearity_menu', [16 17], ...
 'stationarity_menu', [18 20], 'similarity_menu', [21 23], ...
 'variability_menu', [24 27]);
features_struct = struct('mav_menu', add_field(st1,'feat','bsp_mav'), ...
 'mavsd_menu', add_field(st1,'feat','bsp_mavsd'), 'mavfd_menu', add_field(st1,'feat','bsp_mavfd'), ... 
 'peak_menu', add_field(st1,'feat','bsp_peak'), 'rms_menu', add_field(st1,'feat','bsp_rms'), ...
 'bw_menu', add_field(st2,'feat','bw'), 'fmed_menu', add_field(st2,'feat','fmed'), ...
 'fmean_menu', add_field(st2,'feat','fmean'), 'fmode_menu', add_field(st2,'feat','fmode'), ...
 'zc_menu', add_field(st2,'feat','bsp_zc'), ...
 'ap_en_menu', add_field(st3,'feat','bsp_ap_en'), 'sam_en_menu', add_field(st3,'feat','bsp_sam_en'), ...
 'fuz_en_menu', add_field(st3,'feat','bsp_fuz_en'), 'shan_en_menu', add_field(st3,'feat','bsp_fuz_en'), ...
 'spec_en_menu', add_field(st3,'feat','bsp_spec_en'), ...
 'lag_dependence_menu', add_field(st4,'feat','bsp_lag_dependence'), 'parlag_dependence_menu', add_field(st4,'feat','bsp_parlag_dependence'), ...
 'me_menu', add_field(st5,'feat','me'), 'sd_menu', add_field(st5,'feat','sd'), ...
 'ds_menu', add_field(st5,'feat','ds'), ...
 'cohe_menu', add_field(st6,'feat','bsp_cohe'), 'corr_menu', add_field(st6,'feat','bsp_corr'), ...
 'mi_menu', add_field(st6,'feat','bsp_mi'), ...
 'var_menu', add_field(st7,'feat','bsp_var'), 'std_menu', add_field(st2,'feat','bsp_std'), ...
 'interq_range_menu', add_field(st7,'feat','bsp_interq_range'), 'range_menu', add_field(st7,'feat','bsp_range'));
tab_struct = create_tab_struct({handles.button_tab1, handles.panel_tab1, handles.button_tab2, handles.panel_tab2, handles.button_tab3, handles.panel_tab3});

% --- Outputs from this function are returned to the command line.
function varargout = emg_grouping_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function file_Callback(hObject, eventdata, handles)
% hObject    handle to file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function new_analysis_Callback(hObject, eventdata, handles)
% hObject    handle to new_analysis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global features_parent_struct features_struct
reset_interface(handles,features_parent_struct, features_struct);
set(handles.emg_parent,'Enable','on');
% --------------------------------------------------------------------
function open_analysis_Callback(hObject, eventdata, handles)
% hObject    handle to open_analysis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global location features_parent_struct features_struct emg_jan emg_Fs emg_features emg_data selected_chan

reset_interface(handles,features_parent_struct, features_struct);
[filename, pathname] = uigetfile( ...
            {'*.,at','Mat File (*.mat)'}, ...
            'Choose a mat file containing an analysis to read', location);
file_struc = load([pathname filename]);

features_parent_struct = file_struc.features_parent_struct;
features_struct = file_struc.features_struct;
emg_jan = file_struc.emg_jan;
emg_Fs = file_struc.emg_Fs;
emg_features = file_struc.emg_features;
emg_data = file_struc.emg_data;
selected_chan = file_struc.selected_chan;
set(handles.number_cluesters,'String', file_struc.q_c);
set(handles.number_epochs,'String', file_struc.q_epochs);
set(handles.window_edit,'String', file_struc.window);
set(handles.sampling_freq_edit, 'String', emg_Fs);
set(handles.channel_menu, 'Value', selected_chan - 1);
plot(handles.emg_axes,emg_data(1,:),emg_data(selected_chan,:));
set(handles.process_button,'Enable', 'on');
parent_names = fieldnames(features_parent_struct);
children_names = fieldnames(features_struct);
for i = 1:length(parent_names)
    set(handles.(parent_names{i}),'Enable','on');
end
for i = 1:length(children_names)
    set(handles.(children_names{i}),'Enable','on');
end
set_features_menu(handles,features_struct);
cluester_button_Callback(handles.cluester_button, [], handles);
set(handles.save_analysis,'Enable','on');
set(handles.feature_check, 'Enable', 'on');
set(handles.button_tab2, 'Enable', 'on');
% --------------------------------------------------------------------
function save_analysis_Callback(hObject, eventdata, handles)
% hObject    handle to save_analysis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global features_parent_struct features_struct emg_jan emg_Fs emg_features emg_data selected_chan
[filename, pathname] = uiputfile();
fname = [pathname filename];
q_c = str2double(get(handles.number_cluesters,'String'));
q_epochs = str2double(get(handles.number_epochs,'String'));
window = str2double(get(handles.window_edit,'String'));
formato = 'emg_cluestering';
save(fname, 'features_parent_struct', 'features_struct', 'emg_jan', 'emg_Fs', 'emg_features', 'emg_data', 'selected_chan', 'q_c', 'q_epochs', 'window');

% --------------------------------------------------------------------
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function force_format1_Callback(hObject, eventdata, handles)
% hObject    handle to force_format1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global force_data location force_Fs;

[data force_Fs location] = open_file('Choose a text file to read the Force signal', location, @open_force1);
force_data = data;
plot(handles.force_axes,force_data(1,:),force_data(2,:));
set(handles.force_format1, 'Enbale', 'off');
% --------------------------------------------------------------------
function emg_format1_Callback(hObject, eventdata, handles)
% hObject    handle to emg_format1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global emg_data location emg_Fs selected_chan formato
formato = 1;

[data emg_Fs location] = open_file('Choose a text file to read the EMG signal', location, @open_emg1);
if emg_Fs > 2000
    for i = 1:min(size(data))
        r_data(i,:) = bsp_resample(data(i,:),emg_Fs, 1000);
    end
    emg_Fs = 1000;
    emg_data = r_data;
else
    emg_data = data;
end
set(handles.sampling_freq_edit,'String',emg_Fs);
set(handles.process_button,'Enable', 'on');
set(handles.channel_menu,'String',1:min(size(emg_data))-1);
plot(handles.emg_axes,emg_data(1,:),emg_data(selected_chan,:));
set(handles.emg_parent,'Enable','off');
set(handles.force_parent,'Enable','on');

function button_tab_Callback(hObject, eventdata, handles)

global tab_struct

change_tab(hObject,tab_struct);



function number_cluesters_Callback(hObject, eventdata, handles)
% hObject    handle to number_cluesters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of number_cluesters as text
%        str2double(get(hObject,'String')) returns contents of number_cluesters as a double


% --- Executes during object creation, after setting all properties.
function number_cluesters_CreateFcn(hObject, eventdata, handles)
% hObject    handle to number_cluesters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in cluester_button.
function cluester_button_Callback(hObject, eventdata, handles)
% hObject    handle to cluester_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global features_parent_struct features_struct emg_jan emg_Fs emg_features emg_data selected_chan

arrange = rearrange_struct(features_parent_struct, features_struct);
[vetores nomes] = gera_vetores(emg_features, arrange);
plot(handles.features_axes,vetores');
legend(handles.features_axes,nomes{:});
q_c = str2double(get(handles.number_cluesters,'String'));
q_epochs = str2double(get(handles.number_epochs,'String'));
window = str2double(get(handles.window_edit,'String'));
mapa = som(vetores,q_c,q_epochs,handles.map_axes);
grupos = plot_map(mapa,vetores,handles.map_axes);
ativacao = group_sinal(emg_jan,grupos,(window/1000)*emg_Fs,emg_Fs,handles.grouped_signal_axes);
set(handles.button_tab3,'Enable', 'on');
L = length(ativacao)/2;
hs(1) = subplot(L+1,1,1,'Parent',handles.panel_tab3, 'Units', 'normalized');
plot(emg_data(1,:),emg_data(selected_chan,:));
for i = 1:L
    hs(i+1) = subplot(L+1,1,i+1);
    plot([0 ativacao{2*i-1} (length(emg_data(selected_chan,:))*1/emg_Fs)], [0 ativacao{2*i} 0]);
    xlim([-0.5 (length(emg_data(selected_chan,:))*1/emg_Fs)]);
    ylim([-0.5 1.5]);
end
linkaxes(hs, 'x');
set(handles.save_analysis,'Enable','on');

% --- Executes on button press in process_button.
function process_button_Callback(hObject, eventdata, handles)
% hObject    handle to process_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global emg_data selected_chan emg_Fs emg_features features_parent_struct features_struct emg_jan
window = str2double(get(handles.window_edit,'String'));
emg_jan = bsp_vector_split(emg_data(selected_chan,1:end-1), (window/1000)*emg_Fs);
bar = waitbar(0);
emg_features = processamento(emg_jan,bar);
parent_names = fieldnames(features_parent_struct);
children_names = fieldnames(features_struct);
for i = 1:length(parent_names)
    set(handles.(parent_names{i}),'Enable','on');
end
for i = 1:length(children_names)
    set(handles.(children_names{i}),'Enable','on');
end
set(handles.feature_check, 'Enable', 'on');
set(handles.button_tab2, 'Enable', 'on');
close(bar);

function window_edit_Callback(hObject, eventdata, handles)
% hObject    handle to window_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of window_edit as text
%        str2double(get(hObject,'String')) returns contents of window_edit as a double


% --- Executes during object creation, after setting all properties.
function window_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to window_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sampling_freq_edit_Callback(hObject, eventdata, handles)
% hObject    handle to sampling_freq_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sampling_freq_edit as text
%        str2double(get(hObject,'String')) returns contents of sampling_freq_edit as a double


% --- Executes during object creation, after setting all properties.
function sampling_freq_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sampling_freq_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in channel_menu.
function channel_menu_Callback(hObject, eventdata, handles)
% hObject    handle to channel_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns channel_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from
%        channel_menu
global features_parent_struct features_struct selected_chan emg_data force_data formato
reset_interface(handles,features_parent_struct, features_struct);
selected_chan = get(handles.channel_menu,'Value') + 1;
plot(handles.emg_axes,emg_data(1,:),emg_data(selected_chan,:));
set(handles.process_button, 'Enable', 'on');
if formato == 2
    plot(handles.force_axes, force_data(1,:), force_data(2,:));
end
% --- Executes during object creation, after setting all properties.
function channel_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to channel_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function parent_feature_menu_Callback(hObject, eventdata, handles)
% hObject    handle to peak_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global features_parent_struct features_struct

inds = features_parent_struct.(get(hObject,'Tag'));
if get(hObject, 'Value') == 0
    active = 0;
else
    active = 1;
end
names = fieldnames(features_struct);
for i = inds(1):inds(2)
    features_struct = alter_menu_status(features_struct, names{i}, 'active', active);
    set(handles.(names{i}), 'Value', active);
end

% --------------------------------------------------------------------
function feature_menu_Callback(hObject, eventdata, handles)
% hObject    handle to rms_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global features_struct

if get(hObject, 'Value') == 0
    features_struct = alter_menu_status(features_struct, get(hObject,'Tag'), 'active', 0);
else
    features_struct = alter_menu_status(features_struct, get(hObject,'Tag'), 'active', 1);
end


% --- Executes on button press in feature_check.
function feature_check_Callback(hObject, eventdata, handles)
% hObject    handle to feature_check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global features_parent_struct features_struct emg_data emg_Fs emg_features

arrange = rearrange_struct(features_parent_struct, features_struct);
window = str2double(get(handles.window_edit,'String'));
show_data(emg_data(1,:), emg_data(2,:), emg_Fs, emg_features, (window/1000)*emg_Fs, arrange, handles.emg_axes);



function number_epochs_Callback(hObject, eventdata, handles)
% hObject    handle to number_epochs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of number_epochs as text
%        str2double(get(hObject,'String')) returns contents of number_epochs as a double


% --- Executes during object creation, after setting all properties.
function number_epochs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to number_epochs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function emg_format2_Callback(hObject, eventdata, handles)
% hObject    handle to emg_format2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global emg_data force_data location emg_Fs selected_chan formato
formato = 2;
[data emg_Fs location] = open_file('Choose a text file to read the EMG signal', location, @open_emg2);
if emg_Fs > 2000
    for i = 1:min(size(data))
        r_data(i,:) = bsp_resample(data(i,:),emg_Fs, 1000);
    end
    emg_Fs = 1000;
    emg_data = r_data;
else
    emg_data = data;
end
force_data = emg_data(1,:);
force_data(2,:) = emg_data(4,:);
emg_data = emg_data(1:3,:);    
set(handles.sampling_freq_edit,'String',emg_Fs);
set(handles.process_button,'Enable', 'on');
set(handles.channel_menu,'String',1:min(size(emg_data))-1);
plot(handles.emg_axes,emg_data(1,:),emg_data(selected_chan,:));
plot(handles.force_axes,force_data(1,:),force_data(2,:));
set(handles.emg_parent,'Enable','off');
set(handles.force_parent,'Enable','off');
