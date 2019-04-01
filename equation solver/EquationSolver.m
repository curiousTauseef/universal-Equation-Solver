function varargout = EquationSolver(varargin)
% EQUATIONSOLVER MATLAB code for EquationSolver.fig
%      EQUATIONSOLVER, by itself, creates a new EQUATIONSOLVER or raises the existing
%      singleton*.
%
%      H = EQUATIONSOLVER returns the handle to a new EQUATIONSOLVER or the handle to
%      the existing singleton*.
%
%      EQUATIONSOLVER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EQUATIONSOLVER.M with the given input arguments.
%
%      EQUATIONSOLVER('Property','Value',...) creates a new EQUATIONSOLVER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EquationSolver_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EquationSolver_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EquationSolver

% Last Modified by GUIDE v2.5 07-Dec-2018 00:42:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EquationSolver_OpeningFcn, ...
                   'gui_OutputFcn',  @EquationSolver_OutputFcn, ...
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


% --- Executes just before EquationSolver is made visible.
function EquationSolver_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EquationSolver (see VARARGIN)

% Choose default command line output for EquationSolver
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EquationSolver wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = EquationSolver_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Equation_Callback(hObject, eventdata, handles)
% hObject    handle to Equation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Equation as text
%        str2double(get(hObject,'String')) returns contents of Equation as a double


% --- Executes during object creation, after setting all properties.
function Equation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Equation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over Equation.
function Equation_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Equation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function SolutionNum_Callback(hObject, eventdata, handles)
% hObject    handle to SolutionNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SolutionNum as text
%        str2double(get(hObject,'String')) returns contents of SolutionNum as a double


% --- Executes during object creation, after setting all properties.
function SolutionNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SolutionNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in SolvePB.
function SolvePB_Callback(hObject, eventdata, handles)
% hObject    handle to SolvePB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global  Soul
%Soul ={};
syms x y z 
f= lower(get(handles.Equation,'String'));
NoS=str2num(get(handles.SolutionNum,'String'));
for i =1:NoS
    try
    Soul{i}=vpasolve(eval(f),'random',true);
     catch
       
        ed= errordlg('Input syntax must be correct','Error');
        set(ed, 'WindowStyle', 'modal');
        uiwait(ed);
        break;
    end
    VarNum = numel(fields(Soul{i}));
    try
         txtcell{i,1} =['x: ' num2str(sym2poly(Soul{i}.x))];
    catch
           txtcell{i,1} =['x: ' num2str(sym2poly(Soul{i}(1)))];

    end
   if VarNum >1
   txtcell{i,1} =[txtcell{i,1} '  y: ' num2str(sym2poly(Soul{i}.y))];
   end
   if VarNum >2
          txtcell{i,1} =[txtcell{i,1} '  z: ' num2str(sym2poly(Soul{i}.z))];

   end
   set(handles.listbox1,'Value',1);
   set(handles.listbox1, 'String', txtcell);
  
    end


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in HowPB.
function HowPB_Callback(hObject, eventdata, handles)
% hObject    handle to HowPB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('write the equation in the text filed below as in Matlab syntax.             for example exp(x) for e^x and * for multiply etc','Tips','help');
