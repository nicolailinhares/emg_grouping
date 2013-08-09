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

% Last Modified by GUIDE v2.5 08-Aug-2013 20:04:35

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
global tab_struct selected_chan

selected_chan = 2;

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
reset_interface(handles);
set(handles.emg_parent,'Enable','on');
set(handles.force_parent,'Enable','on');

% --------------------------------------------------------------------
function open_analysis_Callback(hObject, eventdata, handles)
% hObject    handle to open_analysis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function save_analysis_Callback(hObject, eventdata, handles)
% hObject    handle to save_analysis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


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

% --------------------------------------------------------------------
function emg_format1_Callback(hObject, eventdata, handles)
% hObject    handle to emg_format1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global emg_data location emg_Fs selected_chan;

[data emg_Fs location] = open_file('Choose a text file to read the EMG signal', location, @open_emg1);
emg_data = data;
set(handles.sampling_freq_edit,'String',emg_Fs);
set(handles.process_button,'Enable', 'on');
set(handles.channel_menu,'String',1:min(size(emg_data))-1);
plot(handles.emg_axes,emg_data(1,:),emg_data(selected_chan,:));


function button_tab_Callback(hObject, eventdata, handles)

global tab_struct

change_tab(hObject,tab_struct);



function number_clusters_Callback(hObject, eventdata, handles)
% hObject    handle to number_clusters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of number_clusters as text
%        str2double(get(hObject,'String')) returns contents of number_clusters as a double


% --- Executes during object creation, after setting all properties.
function number_clusters_CreateFcn(hObject, eventdata, handles)
% hObject    handle to number_clusters (see GCBO)
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


% --- Executes on button press in process_button.
function process_button_Callback(hObject, eventdata, handles)
% hObject    handle to process_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global emg_data selected_chan emg_Fs emg_features
window = str2double(get(handles.window_edit,'String'));
emg_jan = bsp_vector_split(emg_data(selected_chan,1:end-1), (window/1000)*emg_Fs);
bar = waitbar(0);
emg_features = processamento(emg_jan,bar);
show_data(emg_data(1,:), emg_data(2,:), emg_Fs, {emg_features.amplitude.bsp_rms.dados}, (window/1000)*emg_Fs, {'rms'}, handles.emg_axes);
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
%        contents{get(hObject,'Value')} returns selected item from channel_menu
global selected_chan
selected_chan = get(handles.channel_menu,'Value') + 1;

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


% --- Executes on button press in feature_check.
function feature_check_Callback(hObject, eventdata, handles)
% hObject    handle to feature_check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of feature_check
