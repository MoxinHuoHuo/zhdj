// AnyChat for Web SDK

/********************************************
 *				�������岿��				*
 *******************************************/

// ��Ƶ�豸���壨API��BRAC_AudioGetVolume��BRAC_AudioSetVolume ���������
var BRAC_AD_WAVEIN = 						0;	// �����豸��Mic
var BRAC_AD_WAVEOUT = 						1;	// ����豸��Wave

// �豸���Ͷ��壨API��BRAC_EnumDevices ���������
var BRAC_DEVICE_VIDEOCAPTURE = 				1;	// ��Ƶ�ɼ��豸
var BRAC_DEVICE_AUDIOCAPTURE = 				2;	// ��Ƶ�ɼ��豸
var BRAC_DEVICE_AUDIOPLAYBACK = 			3;	// ��Ƶ�����豸

// �ں˲������壨API��BRAC_SetSDKOption��BRAC_GetSDKOption ���������
var BRAC_SO_AUDIO_VADCTRL = 				1;	// ��Ƶ���������ƣ�����Ϊ��int�ͣ�1�򿪣�0�رգ�
var BRAC_SO_AUDIO_NSCTRL = 					2;	// ��Ƶ�������ƿ��ƣ�����Ϊ��int�ͣ�1�򿪣�0�رգ�
var BRAC_SO_AUDIO_ECHOCTRL = 				3;	// ��Ƶ�����������ƣ�����Ϊ��int�ͣ�1�򿪣�0�رգ�
var BRAC_SO_AUDIO_AGCCTRL = 				4;	// ��Ƶ�Զ�������ƣ�����Ϊ��int�ͣ�1�򿪣�0�رգ�
var BRAC_SO_AUDIO_CAPTUREMODE = 			5;	// ��Ƶ�ɼ�ģʽ���ã�����Ϊ��int�ͣ�0 ����ģʽ��1 �Ÿ�ģʽ��2 ����OKģʽ��3 ��·����ģʽ��
var BRAC_SO_AUDIO_MICBOOST = 				6;	// ��Ƶ�ɼ�Mic��ǿ���ƣ�����Ϊ��int�ͣ�0 ȡ����1 ѡ�У�2 �豸������[��ѯʱ����ֵ]��
var BRAC_SO_AUDIO_AUTOPARAM = 				7;	// ������Ƶ�ɼ�ģʽ���Զ�ѡ����ʵ���ز������������������������������ʲ����ȣ�����Ϊint�ͣ�1 ���ã�0 �ر�[Ĭ��]��
var BRAC_SO_AUDIO_MONOBITRATE = 			8;	// ���õ�����ģʽ����Ƶ����Ŀ�����ʣ�����Ϊ��int�ͣ���λ��bps��
var BRAC_SO_AUDIO_STEREOBITRATE = 			9;	// ����˫����ģʽ����Ƶ����Ŀ�����ʣ�����Ϊ��int�ͣ���λ��bps��
var BRAC_SO_AUDIO_PLAYDRVCTRL = 			70;	// ��Ƶ��������ѡ�񣨲���Ϊ��int�ͣ�0Ĭ�������� 1 DSound������ 2 WaveOut������ 3 Java����[Androidƽ̨ʹ��]��
var BRAC_SO_AUDIO_CNGCTRL = 				71;	// �����������ɿ��ƣ�����Ϊ��int�ͣ�1�򿪣�0�رգ�
var BRAC_SO_AUDIO_CODECID = 				72;	// ������Ƶ������ID���ã�����Ϊint�ͣ�-1��ʾĬ�ϣ�������õı�����ID�����ڣ����ں˻����Ĭ�ϵı�������
var BRAC_SO_AUDIO_SOFTVOLMODE = 			73;	// �����������ģʽ���ƣ�����Ϊint�ͣ�1�򿪣�0�ر�[Ĭ��]����ʹ���������ģʽ��������ı�ϵͳ����������
var BRAC_SO_AUDIO_RECORDDRVCTRL = 			74;	// ��Ƶ�ɼ��������ƣ�����Ϊint�ͣ�0Ĭ�������� 1 DSound������ 2 WaveIn������ 3 Java�ɼ�[Androidƽ̨ʹ��]��

var BRAC_SO_RECORD_VIDEOBR = 				10;	// ¼����Ƶ�������ã�����Ϊ��int�ͣ���λ��bps��
var BRAC_SO_RECORD_AUDIOBR = 				11;	// ¼����Ƶ�������ã�����Ϊ��int�ͣ���λ��bps��
var BRAC_SO_RECORD_TMPDIR = 				12;	// ¼���ļ���ʱĿ¼���ã�����Ϊ�ַ���TCHAR���ͣ������������ľ���·����
var BRAC_SO_SNAPSHOT_TMPDIR = 				13;	// �����ļ���ʱĿ¼���ã�����Ϊ�ַ���TCHAR���ͣ������������ľ���·����
var BRAC_SO_CORESDK_TMPDIR = 				14;	// ����AnyChat Core SDK��ʱĿ¼������Ϊ�ַ���TCHAR���ͣ������������ľ���·����
var BRAC_SO_CORESDK_MAGICADJUST = 			15;	// �ں˵��Բ���
var BRAC_SO_CORESDK_LOADCODEC = 			16;	// �����ⲿ�������������Ϊ�ַ���TCHAR���ͣ������������ľ���·���������ļ�����������ļ����ľ���·����
var BRAC_SO_CORESDK_USEARMV6LIB = 			17;	// ǿ��ʹ��ARMv6ָ��Ŀ⣬androidƽ̨ʹ�ã�����Ϊ��int�ͣ�1ʹ��ARMv6ָ��� 0�ں��Զ��ж�[Ĭ��]��
var BRAC_SO_CORESDK_USEHWCODEC = 			18;	// ʹ��ƽ̨����Ӳ���������������Ϊint�ͣ�0 ��ʹ��Ӳ���������[Ĭ��]  1 ʹ������Ӳ�����������
var BRAC_SO_CORESDK_REMOTEDEBUG = 			19;	// Զ�̵��ԣ�����Ϊint�ͣ���ʾĿ���û�ID�����ò�������Ϊ�������Ͳ�����

var BRAC_SO_CORESDK_PATH = 					20;	// ����AnyChat Core SDK������·��������Ϊ�ַ���TCHAR���ͣ������������ľ���·����
var BRAC_SO_CORESDK_DUMPCOREINFO = 			21;	// ����ں���Ϣ����־�ļ��У����ڷ�������ԭ�򣨲���Ϊ��int�ͣ�1 �����
var BRAC_SO_CORESDK_MAINVERSION = 			22;	// ��ѯSDK���汾�źţ�����Ϊint�ͣ�
var BRAC_SO_CORESDK_SUBVERSION = 			23;	// ��ѯSDK�Ӱ汾�ţ�����Ϊint�ͣ�
var BRAC_SO_CORESDK_BUILDTIME = 			24;	// ��ѯSDK����ʱ�䣨����Ϊ�ַ���TCHAR���ͣ�
var BRAC_SO_CORESDK_ACTIVESTATE = 			25;	// Ӧ�ó���״̬���ƣ�����Ϊint�ͣ� 1 Ӧ�ó����ڻ״̬�� 0 Ӧ�ó����ڷǻ״̬����������iPhone���豸����ɺ�̨���еĳ���
var BRAC_SO_CORESDK_EXTVIDEOINPUT = 		26;	// �ⲿ��չ��Ƶ������ƣ�����Ϊint�ͣ� 0 �ر��ⲿ��Ƶ����[Ĭ��]�� 1 �����ⲿ��Ƶ���룩
var BRAC_SO_CORESDK_EXTAUDIOINPUT = 		27;	// �ⲿ��չ��Ƶ������ƣ�����Ϊint�ͣ� 0 �ر��ⲿ��Ƶ����[Ĭ��]�� 1 �����ⲿ��Ƶ���룩
var BRAC_SO_CORESDK_LOWDELAYCTRL = 			28;	// ���ӳ�ģʽ���ƣ�����Ϊint�ͣ�0 �رյ��ӳ�ģʽ[Ĭ��]�� 1 ���õ��ӳ�ģʽ��

var BRAC_SO_LOCALVIDEO_BITRATECTRL = 		30;	// ������Ƶ�����������ã�����Ϊint�ͣ���λbps��ͬ���������ã�VideoBitrate��
var BRAC_SO_LOCALVIDEO_QUALITYCTRL = 		31;	// ������Ƶ�����������ӿ��ƣ�����Ϊint�ͣ�ͬ���������ã�VideoQuality��
var BRAC_SO_LOCALVIDEO_GOPCTRL = 			32;	// ������Ƶ����ؼ�֡������ƣ�����Ϊint�ͣ�ͬ���������ã�VideoGOPSize��
var BRAC_SO_LOCALVIDEO_FPSCTRL = 			33;	// ������Ƶ����֡�ʿ��ƣ�����Ϊint�ͣ�ͬ���������ã�VideoFps��
var BRAC_SO_LOCALVIDEO_PRESETCTRL = 		34;	// ������Ƶ����Ԥ��������ƣ�����Ϊint�ͣ�1-5��
var BRAC_SO_LOCALVIDEO_APPLYPARAM = 		35;	// Ӧ�ñ�����Ƶ���������ʹ��ǰ���޸ļ�ʱ��Ч������Ϊint�ͣ�1 ʹ���²�����0 ʹ��Ĭ�ϲ�����
var BRAC_SO_LOCALVIDEO_VIDEOSIZEPOLITIC = 	36;	// ������Ƶ�ɼ��ֱ��ʿ��Ʋ��ԣ�����Ϊint�ͣ�0 �Զ�������ƥ��[Ĭ��]��1 ʹ�òɼ��豸Ĭ�Ϸֱ��ʣ��������õķֱ��ʲ����ɼ��豸֧��ʱ��Ч
var BRAC_SO_LOCALVIDEO_DEINTERLACE = 		37;	// ������Ƶ����֯�������ƣ�����Ϊint�ͣ� 0 �����з���֯����[Ĭ��]��1 ����֯��������������ƵԴ�Ǹ���ɨ��Դ��������źţ�ʱͨ������֯���������߻�������
var BRAC_SO_LOCALVIDEO_WIDTHCTRL = 			38;	// ������Ƶ�ɼ��ֱ��ʿ�ȿ��ƣ�����Ϊint�ͣ�ͬ���������ã�VideoWidth��
var BRAC_SO_LOCALVIDEO_HEIGHTCTRL = 		39;	// ������Ƶ�ɼ��ֱ��ʸ߶ȿ��ƣ�����Ϊint�ͣ�ͬ���������ã�VideoHeight��
var BRAC_SO_LOCALVIDEO_FOCUSCTRL = 			90;	// ������Ƶ����ͷ�Խ����ƣ�����Ϊint�ͣ�1��ʾ�Զ��Խ��� 0��ʾ�ֶ��Խ���
var BRAC_SO_LOCALVIDEO_PIXFMTCTRL = 		91;	// ������Ƶ�ɼ����ȸ�ʽ���ƣ�����Ϊint�ͣ�-1��ʾ����ƥ�䣬�������Ȳ���ָ����ʽ���ο���BRAC_PixelFormat��
var BRAC_SO_LOCALVIDEO_OVERLAY = 			92;	// ������Ƶ����Overlayģʽ������Ϊint�ͣ�1��ʾ����Overlayģʽ�� 0��ʾ��ͨģʽ[Ĭ��]��
var BRAC_SO_LOCALVIDEO_CODECID = 			93;	// ������Ƶ������ID���ã�����Ϊint�ͣ�-1��ʾĬ�ϣ�������õı�����ID�����ڣ����ں˻����Ĭ�ϵı�������
var BRAC_SO_LOCALVIDEO_ROTATECTRL = 		94;	// ������Ƶ��ת���ƣ�����Ϊint�ͣ�0��ʾ��������ת��1��ʾ��ֱ��ת��
var BRAC_SO_LOCALVIDEO_CAPDRIVER = 			95;	// ������Ƶ�ɼ��������ã�����Ϊint�ͣ�0��ʾ�Զ�ѡ��[Ĭ��]�� 1 Video4Linux, 2 DirectShow, 3 Java�ɼ�[Androidƽ̨ʹ��]��
var BRAC_SO_LOCALVIDEO_FIXCOLORDEVIA = 		96;	// ������Ƶ�ɼ���ɫƫɫ������Ϊint�ͣ�0��ʾ�ر�[Ĭ��]��1 ������

var BRAC_SO_NETWORK_P2PPOLITIC = 			40;	// ��������P2P���Կ��ƣ�����Ϊ��int�ͣ�0 ��ֹ����P2P��1 ����������P2P[Ĭ��]��2 �ϲ�Ӧ�ÿ���P2P���ӣ�3 ���轨��P2P���ӣ�
var BRAC_SO_NETWORK_P2PCONNECT = 			41;	// ������ָ���û�����P2P���ӣ�����Ϊint�ͣ���ʾĿ���û�ID�������ӽ����ɹ��󣬻�ͨ����Ϣ�������ϲ�Ӧ�ã�P2P���Ʋ���=2ʱ��Ч
var BRAC_SO_NETWORK_P2PBREAK = 				42;	// �Ͽ���ָ���û���P2P���ӣ�����Ϊint�ͣ���ʾĿ���û�ID��[�ݲ�֧�֣�����]
var BRAC_SO_NETWORK_TCPSERVICEPORT = 		43;	// ���ñ���TCP����˿ڣ�����Ϊint�ͣ������ӷ�����֮ǰ������Ч
var BRAC_SO_NETWORK_UDPSERVICEPORT = 		44;	// ���ñ���UDP����˿ڣ�����Ϊint�ͣ������ӷ�����֮ǰ������Ч
var BRAC_SO_NETWORK_MULTICASTPOLITIC = 		45;	// �鲥���Կ��ƣ�����Ϊint�ͣ�0 ִ�з�����·�ɲ��ԣ���ֹ�鲥����[Ĭ��]�� 1 ���Է�����·�ɲ��ԣ�ֻ���鲥��㲥ý������ 2 ִ�з�����·�ɲ��ԣ�ͬʱ�鲥��
var BRAC_SO_NETWORK_TRANSBUFMAXBITRATE = 	46;	// ���仺�������ļ�������ʿ��ƣ�����Ϊint�ͣ�0 �����ƣ���������ʴ���[Ĭ��]�� �����ʾ�������ʣ���λΪ��bps��

var BRAC_SO_PROXY_FUNCTIONCTRL = 			50;	// �����û������ܿ��ƣ�������Ϊ��int�ͣ�1��������0�رմ���[Ĭ��]��
var BRAC_SO_PROXY_VIDEOCTRL = 				51;	// �����û�������Ƶ���ƣ���������Ƶ��Ϊָ���û�����Ƶ���ⷢ��������Ϊint�ͣ���ʾ�����û���userid��
var BRAC_SO_PROXY_AUDIOCTRL = 				52;	// �����û�������Ƶ���ƣ���������Ƶ��Ϊָ���û�����Ƶ���ⷢ��������ͬBRAC_SO_PROXY_VIDEOCTRL��

var BRAC_SO_STREAM_MAXBUFFERTIME = 			60;	// ���������ʱ�䣨����Ϊint�ͣ���λ�����룬ȡֵ��Χ��500 ~ 5000��Ĭ�ϣ�800��������ģʽ����ֵ������ģʽ���Զ�����һ��
var BRAC_SO_STREAM_SMOOTHPLAYMODE = 		61;	// ƽ������ģʽ������Ϊint�ͣ�0 �ر�[Ĭ��], 1 �򿪣�����״̬��������Ƶ��֡ʱ��������ţ����ܳ��������ˣ������Ῠס

var BRAC_SO_VIDEOSHOW_MODECTRL = 			80;	// ��Ƶ��ʾģʽ���ƣ�����Ϊ��int�ͣ�0 ��������ʾ��1 ��Ƶ������ʾ��
var BRAC_SO_VIDEOSHOW_SETPRIMARYUSER = 		81;	// ��������ʾ�û���ţ�����Ϊ��int�ͣ��û�ID�ţ�
var BRAC_SO_VIDEOSHOW_SETOVERLAYUSER = 		82;	// ���õ�����ʾ�û���ţ�����Ϊ��int�ͣ��û�ID�ţ�
var BRAC_SO_VIDEOSHOW_DRIVERCTRL = 			83;	// ��Ƶ��ʾ�������ƣ�����Ϊ��int�ͣ�0 Ĭ�������� 1 Windows DirectShow��2 Windows GDI��3 SDL, 4 Android2X��


// ����������Ϣ�������壨API��BRAC_QueryTransTaskInfo ���������
var BRAC_TRANSTASK_PROGRESS = 				1;	// ����������Ȳ�ѯ������Ϊ��DOUBLE�ͣ�����ֵ0.0 ~ 100.0�� �����Ϊ��DWORD�ͣ�����ֵ0 ~ 100��
var BRAC_TRANSTASK_BITRATE = 				2;	// ��������ǰ�������ʣ�����Ϊ��int�ͣ���λ��bps��
var BRAC_TRANSTASK_STATUS = 				3;	// ��������ǰ״̬������Ϊ��int�ͣ�
var BRAC_TRANSTASK_SAVEASPATH = 			4;	// �ļ������������Ϊ·�����ã����ļ���������Ϊ�ַ���TCHAR���ͣ�


// �û�״̬��־���壨API��BRAC_QueryUserState ���������
var BRAC_USERSTATE_CAMERA = 				1;	// �û�����ͷ״̬������ΪDWORD�ͣ�
var BRAC_USERSTATE_HOLDMIC = 				2;	// �û���Ƶ�豸״̬������ΪDWORD�ͣ�����ֵ��0 ��Ƶ�ɼ��رգ� 1 ��Ƶ�ɼ�������
var BRAC_USERSTATE_SPEAKVOLUME = 			3;	// �û���ǰ˵������������ΪDOUBLE���ͣ�0.0 ~ 100.0����
var BRAC_USERSTATE_RECORDING = 				4;	// �û�¼������״̬������ΪDWORD�ͣ�
var	BRAC_USERSTATE_LEVEL = 					5;	// �û����𣨲���ΪDWORD�ͣ�
var BRAC_USERSTATE_NICKNAME = 				6;	// �û��ǳƣ�����Ϊ�ַ���TCHAR���ͣ�
var BRAC_USERSTATE_LOCALIP = 				7;	// �û�����IP��ַ������������Ϊ�ַ���TCHAR���ͣ�
var BRAC_USERSTATE_INTERNETIP = 			8;	// �û�������IP��ַ������Ϊ�ַ���TCHAR���ͣ�
var BRAC_USERSTATE_VIDEOBITRATE = 			9;	// �û���ǰ����Ƶ���ʣ�����ΪDWORD���ͣ�Bps��
var BRAC_USERSTATE_AUDIOBITRATE = 			10;	// �û���ǰ����Ƶ���ʣ�����ΪDWORD���ͣ�Bps��
var BRAC_USERSTATE_P2PCONNECT = 			11;	// ��ѯ�����û���ָ���û��ĵ�ǰP2P����״̬������ΪDWORD���ͣ�����ֵ��0 P2P��ͨ�� 1 P2P���ӳɹ�[TCP]��2 P2P���ӳɹ�[UDP]��3 P2P���ӳɹ�[TCP��UDP]��
var BRAC_USERSTATE_NETWORKSTATUS = 			12;	// ��ѯָ���û�������״̬������ΪDWORD���ͣ�����ֵ��0 ������1 �Ϻã�2 һ�㣬3 �ϲ4 �ǳ����ע����ѯ�����Ҫ>1s
var BRAC_USERSTATE_VIDEOSIZE = 				13;	// ��ѯָ���û�����Ƶ�ֱ��ʣ�����ΪDWORD���ͣ�����ֵ����16λ��ʾ��ȣ���16λ��ʾ�߶ȣ�
var BRAC_USERSTATE_PACKLOSSRATE = 			14;	// ��ѯָ���û���������ý�����ݶ����ʣ�����ΪDWORD���ͣ�����ֵ��0 - 100���磺����ֵΪ5����ʾ������Ϊ5%��
var BRAC_USERSTATE_DEVICETYPE =				15; // ��ѯָ���û����ն����ͣ�����ΪDWORD���ͣ�����ֵ��0 Unknow�� 1 Windows��2 Android��3 iOS��4 Web��5 Linux��6 Mac��7 Win Phone��8 WinCE��

// SDK��Ϣ���壨����OnNotifyMessage�¼����ж��¼������ͣ�
var WM_GV = 0x0400 + 200;
var WM_GV_CONNECT			=	WM_GV + 1;		// �ͻ������ӷ�������wParam��BOOL����ʾ�Ƿ����ӳɹ�
var WM_GV_LOGINSYSTEM		=	WM_GV + 2;		// �ͻ��˵�¼ϵͳ��wParam��INT����ʾ�Լ����û�ID�ţ�lParam��INT����ʾ��¼�����0 �ɹ�������Ϊ������룬�ο�������붨��
var WM_GV_ENTERROOM			=	WM_GV + 3;		// �ͻ��˽��뷿�䣬wParam��INT����ʾ�����뷿���ID�ţ�lParam��INT����ʾ�Ƿ���뷿�䣺0�ɹ����룬����Ϊ�������
var WM_GV_MICSTATECHANGE	=	WM_GV + 4;		// �û�����Ƶ�豸״̬�仯��Ϣ��wParam��INT����ʾ�û�ID�ţ�lParam��BOOL����ʾ���û��Ƿ��Ѵ���Ƶ�ɼ��豸
var WM_GV_USERATROOM		=	WM_GV + 5;		// �û����루�뿪�����䣬wParam��INT����ʾ�û�ID�ţ�lParam��BOOL����ʾ���û��ǽ��루TRUE�����뿪��FALSE������
var WM_GV_LINKCLOSE			=	WM_GV + 6;		// ���������ѹرգ�����Ϣֻ���ڿͻ������ӷ������ɹ�֮�������쳣�ж�֮ʱ������wParam��INT����ʾ���ӶϿ���ԭ��
var WM_GV_ONLINEUSER		=	WM_GV + 7;		// �յ���ǰ����������û���Ϣ�����뷿��󴥷�һ�Σ�wParam��INT����ʾ�����û����������Լ�����lParam��INT����ʾ����ID
var WM_GV_CAMERASTATE		=	WM_GV + 11;		// �û�����ͷ״̬�����仯��wParam��INT����ʾ�û�ID�ţ�lParam��INT����ʾ����ͷ�ĵ�ǰ״̬������Ϊ��GV_CAMERA_STATE_XXXX
var WM_GV_CHATMODECHG		=	WM_GV + 12;		// �û�����ģʽ�����仯��wParam��INT����ʾ�û�ID�ţ�lParam��INT����ʾ�û��ĵ�ǰ����ģʽ
var WM_GV_ACTIVESTATE		=	WM_GV + 13;		// �û��״̬�����仯��wParam��INT����ʾ�û�ID�ţ�lParam��INT����ʾ�û��ĵ�ǰ�״̬
var WM_GV_P2PCONNECTSTATE	=	WM_GV + 14;		// �����û��������û���P2P��������״̬�����仯��wParam��INT����ʾ�����û�ID�ţ�lParam��INT����ʾ�����û��������û��ĵ�ǰP2P��������״̬
var WM_GV_PRIVATEREQUEST	=	WM_GV + 21;		// �û�����˽������wParam��INT����ʾ�����ߵ��û�ID�ţ�lParam��INT����ʾ˽�������ţ���ʶ������
var WM_GV_PRIVATEECHO		=	WM_GV + 22;		// �û��ظ�˽������wParam��INT����ʾ�ظ��ߵ��û�ID�ţ�lParam��INT��Ϊ�������
var WM_GV_PRIVATEEXIT		=	WM_GV + 23;		// �û��˳�˽�ģ�wParam��INT����ʾ�˳��ߵ��û�ID�ţ�lParam��INT��Ϊ�������
var WM_GV_SDKWARNING      	=   WM_GV + 41;		// SDK������Ϣ����SDK�����й������Լ췢���쳣״̬ʱ�������ϲ㷢�͸���Ϣ��wParam��INT����ʾ������룬����Ϊ��GV_ERR_WARNING_XXXX

// ������붨��
var GV_ERR_SUCCESS			=	0;				// �ɹ�
var GV_ERR_PLUGINNOINSTALL	=	1010000;		// ���û�а�װ
var GV_ERR_PLUGINOLDVERSION =	1010001;		// ����汾̫��


// ����������汾��
var MIN_ANYCHAT_PLUGIN_VER	=	"1.0.0.2";
var MIN_VIDEO_PLUGIN_VER	=	"1.0.0.2";

/********************************************
 *				�������岿��				*
 *******************************************/
var anychat;									// AnyChat���DMO�����ⲿ��ʼ��

// ��ʼ��SDK�����س������
function BRAC_InitSDK(apilevel) {
	var anychatsdkdiv = "AnyChatSDKPluginDiv";
	try {
		// ����AnyChat SDK���
		var anychatobj = document.createElement("object")
	    anychatobj.id = "AnyChatSDKPlugin";
		anychatobj.width = "1 px";
		anychatobj.height = "1 px";
	    if (window.ActiveXObject)
	        anychatobj.classid = "clsid:91CC58C4-BA8A-400D-A176-856EDF42CB57";
	    else
	        anychatobj.type = "application/anychat-plugin";
	    // ������Ƶ��ʾ���
	    var videoobj = document.createElement("object")
	    videoobj.id = "AnyChatVideoPlugin";
	    if (window.ActiveXObject)
	        videoobj.classid = "clsid:B685A393-905F-45B5-B26E-FF199EEE2FD7";
	    else
	        videoobj.type = "application/anychat-video";
	    // ����һ�����Բ�
	    var insertdiv = document.createElement("div");
	    insertdiv.id = anychatsdkdiv;
		insertdiv.appendChild(anychatobj);
	    insertdiv.appendChild(videoobj);
	    document.body.appendChild(insertdiv);
	    // ���Բ���Ƿ�װ
	    var anychatpluginver = anychatobj.GetVersion(0);
	    var videopluginver = videoobj.GetVersion(0);
	    // �жϲ���İ汾�Ƿ�̫��
	    var bRightVersion = ((anychatpluginver >= MIN_ANYCHAT_PLUGIN_VER) && (videopluginver >= MIN_VIDEO_PLUGIN_VER));
		// �жϵ�ǰ��API Level�Ƿ�����ҵ������Ҫ
		if(apilevel > anychatobj.GetVersion(2))
			bRightVersion = false;
		if(bRightVersion) {
			insertdiv.removeChild(videoobj);
			anychat = anychatobj;
			// �����ص��¼�
			if(window.ActiveXObject) {
				anychat.attachEvent('OnNotifyMessage', OnAnyChatNotifyMessage);
				anychat.attachEvent('OnTextMessage', OnAnyChatTextMessage);
				anychat.attachEvent('OnTransBuffer', OnAnyChatTransBuffer);
				anychat.attachEvent('OnTransBufferEx', OnAnyChatTransBufferEx);
				anychat.attachEvent('OnTransFile', OnAnyChatTransFile);
				anychat.attachEvent('OnVolumeChange', OnAnyChatVolumeChange);
				anychat.attachEvent('OnSDKFilterData', OnAnyChatSDKFilterData);
				anychat.attachEvent('OnRecordSnapShot', OnAnyChatRecordSnapShot);
			} else {
				anychat.OnNotifyMessage = OnAnyChatNotifyMessage;
				anychat.OnTextMessage = OnAnyChatTextMessage;
				anychat.OnTransBuffer = OnAnyChatTransBuffer;
				anychat.OnTransBufferEx = OnAnyChatTransBufferEx;
				anychat.OnTransFile = OnAnyChatTransFile;
				anychat.OnVolumeChange = OnAnyChatVolumeChange;
				anychat.OnSDKFilterData = OnAnyChatSDKFilterData;
				anychat.OnRecordSnapShot = OnAnyChatRecordSnapShot;
			}
		} else {
			document.body.removeChild(insertdiv);
		}
		return bRightVersion ? GV_ERR_SUCCESS : GV_ERR_PLUGINOLDVERSION;
	}
	catch (e) {
	    var insertdiv = BRAC_GetDmoObject(anychatsdkdiv);
	    if (insertdiv)
	        document.body.removeChild(insertdiv);
	    return GV_ERR_PLUGINNOINSTALL;
	}
}

// ��ȡWeb DMO����
function BRAC_GetDmoObject(id) {
	if (document.getElementById) {
		return document.getElementById(id);
	} else if (window[id]) {
		return window[id];
	}
	return null;
}

// ������Ƶ��ʾλ��
function BRAC_SetVideoPos(userid, parentobj, id) {
	var videoobj = BRAC_GetDmoObject(id);
	if(videoobj != null) {
		videoobj.SetIPCGuid(BRAC_GetIPCGuid());
		videoobj.SetUserId(userid);
	} else {
		// ������Ƶ��ʾ���
	    videoobj = document.createElement("object")
	    videoobj.id = id;
		videoobj.width = "100%";
		videoobj.height = "100%";
	    if (window.ActiveXObject)
	        videoobj.classid = "clsid:B685A393-905F-45B5-B26E-FF199EEE2FD7";
	    else
	        videoobj.type = "application/anychat-video";
		parentobj.appendChild(videoobj);
		// ������AnyChat SDK
		videoobj.SetIPCGuid(BRAC_GetIPCGuid());
		videoobj.SetUserId(userid);
	}	
}

// ��ȡ�汾��
function BRAC_GetVersion(type) {
	return anychat.GetVersion(type);
}

// ���÷�������֤���루��������ֹ�Ƿ��û���SDK���ӷ��������Ϸ��û����������ӣ�
function BRAC_SetServerAuthPass(lpPassword) {
	return anychat.SetServerAuthPass(lpPassword);
}

// ���ӷ�����
function BRAC_Connect(lpServerAddr, dwPort) {
	return anychat.Connect(lpServerAddr, dwPort);
}
// ��¼ϵͳ
function BRAC_Login(lpUserName, lpPassword, dwParam) {
	return anychat.Login(lpUserName, lpPassword, dwParam);
}
// ���뷿��
function BRAC_EnterRoom(dwRoomid, lpRoomPass, dwParam) {
	return anychat.EnterRoom(dwRoomid, lpRoomPass, dwParam);
}
// ���뷿��
function BRAC_EnterRoomEx(lpRoomName, lpRoomPass) {
	return anychat.EnterRoomEx(lpRoomName, lpRoomPass);
}
// �뿪����
function BRAC_LeaveRoom(dwRoomid) {
	return anychat.LeaveRoom(dwRoomid);
}
// ע��ϵͳ
function BRAC_Logout() {
	return anychat.Logout();
}

// ��ȡ��ǰ���������û��б�����һ��userid�����飩
function BRAC_GetOnlineUser() {
	var idarray = new Array();
	var size = anychat.PrepareFetchRoomUsers();
	if(size)
	{
		var idx = 0;
		while(1)
		{
			var userid = anychat.FetchNextRoomUsers();
			if(userid == -1)
				break;
			idarray[idx++] = userid;
		}
	}
	return idarray;
}
// ��ѯ�û�����ͷ��״̬
function BRAC_GetCameraState(dwUserId) {
	return anychat.QueryUserStateInt(dwUserId, BRAC_USERSTATE_CAMERA);
}
// ��ѯ�û�����״̬
function BRAC_GetSpeakState(dwUserId) {
	return anychat.QueryUserStateInt(dwUserId, BRAC_USERSTATE_HOLDMIC);
}
// ��ѯ�û�����
function BRAC_GetUserLevel(dwUserId) {
	return anychat.QueryUserStateInt(dwUserId, BRAC_USERSTATE_LEVEL);
}
// ��ѯ�û�����
function BRAC_GetUserName(dwUserId) {
	return anychat.QueryUserStateString(dwUserId, BRAC_USERSTATE_NICKNAME);
}
// ��ѯָ���û����״̬������ֵ״̬��
function BRAC_QueryUserStateInt(dwUserId, infoname) {
	return anychat.QueryUserStateInt(dwUserId, infoname);
}
// ��ѯָ���û����״̬���ַ���ֵ״̬��
function BRAC_QueryUserStateString(dwUserId, infoname) {
	return anychat.QueryUserStateString(dwUserId, infoname);
}

// ��ʾ������Ƶ������ڶԻ���
function BRAC_ShowLVProperty(szCaption) {
	return anychat.ShowLVProperty(szCaption);
}

// ö�ٱ����豸��Ϣ�������豸�������飩
function BRAC_EnumDevices(dwDeviceType) {
	var devicearray = new Array();
	var size = anychat.PrepareFetchDevices(dwDeviceType);
	for(var i=0; i<size; i++) {
		devicearray[i] = anychat.FetchNextDevice(dwDeviceType);
	}
	return devicearray;
}
// ѡ��ָ�����豸
function BRAC_SelectVideoCapture(dwDeviceType, szCaptureName) {
	return anychat.SelectDevice(dwDeviceType, szCaptureName);
}
// ��ȡ��ǰʹ�õ��豸
function BRAC_GetCurrentDevice(dwDeviceType) {
	return anychat.GetCurrentDevice(dwDeviceType);
}

// ���������û���Ƶ��������Զ���û���Ƶ��
function BRAC_UserCameraControl(dwUserId, bOpen) {
	return anychat.UserCameraControl(dwUserId, bOpen);
}
// ���������û�������������Զ���û�������
function BRAC_UserSpeakControl(dwUserId, bOpen) {
	return anychat.UserSpeakControl(dwUserId, bOpen);
}

// ��ȡָ����Ƶ�豸�ĵ�ǰ����
function BRAC_AudioGetVolume(device) {
	return anychat.AudioGetVolume(device);
}
// ����ָ����Ƶ�豸������
function BRAC_AudioSetVolume(device, dwVolume) {
	return anychat.AudioSetVolume(device, dwVolume);
}

// �û�������Ƶ¼��
function BRAC_StreamRecordCtrl(dwUserId, bStartRecord, dwFlags, dwParam) {
	return anychat.StreamRecordCtrl(dwUserId, bStartRecord, dwFlags, dwParam);
}
// ���û�����Ƶ����ץ�ģ����գ�
function BRAC_SnapShot(dwUserId, dwFlags, dwParam) {
	return anychat.SnapShot(dwUserId, dwFlags, dwParam);
}

// ͸��ͨ�����ͻ�����
function BRAC_TransBuffer(dwUserId, lpBuf) {
	return anychat.TransBuffer(dwUserId, lpBuf, 0);
}
// ͸��ͨ�����ͻ�������չ
function BRAC_TransBufferEx(dwUserId, lpBuf, wParam, lParam, dwFlags) {
	return anychat.TransBufferEx(dwUserId, lpBuf, 0, wParam, lParam, dwFlags);
}
// �����ļ�
function BRAC_TransFile(dwUserId, lpLocalPathName, wParam, lParam, dwFlags) {
	return anychat.TransFile(dwUserId, lpLocalPathName, wParam, lParam, dwFlags);
}
// ��ѯ�������������Ϣ
function BRAC_QueryTransTaskInfo(dwUserId, dwTaskId, infoname) {
	return anychat.QueryTransTaskInfo(dwUserId, dwTaskId, infoname);
}
// ȡ����������
function BRAC_CancelTransTask(dwUserId, dwTaskId) {
	return anychat.CancelTransTask(dwUserId, dwTaskId);
}
// �����ı���Ϣ
function BRAC_SendTextMessage(dwUserId, bSecret, lpMsgBuf) {
	return anychat.SendTextMessage(dwUserId, bSecret, lpMsgBuf, 0);
}
// ����SDK Filter ͨ������
function BRAC_SendSDKFilterData(lpBuf) {
	return anychat.SendSDKFilterData(lpBuf, 0);
}

// ���ĵ�ǰ������ģʽ
function BRAC_ChangeChatMode(dwChatMode) {
	return anychat.ChangeChatMode(dwChatMode);
}
// ��ȡָ���û���ǰ������ģʽ
function BRAC_GetUserChatMode(dwUserId) {
	return anychat.GetUserChatMode(dwUserId);
}
// ������Է�˽�ģ���Է�����˽������
function BRAC_PrivateChatRequest(dwUserId) {
	return anychat.PrivateChatRequest(dwUserId);
}
// �ظ��Է���˽������
function BRAC_PrivateChatEcho(dwUserId, dwRequestId, bAccept) {
	return anychat.PrivateChatEcho(dwUserId, dwRequestId, bAccept);
}
// �ظ��Է���˽��������չ�����Ը���������룩
function BRAC_PrivateChatEchoEx(dwUserId, dwRequestId, dwErrorCode) {
	return anychat.PrivateChatEchoEx(dwUserId, dwRequestId, dwErrorCode);
}
// �˳���ĳ�û���˽�ģ����߽�ĳ�û����Լ���˽���б������
function BRAC_PrivateChatExit(dwUserId) {
	return anychat.PrivateChatExit(dwUserId);
}

// SDK�ں˲�������
function BRAC_SetSDKOption(optname, value) {
	if(isNaN(value))
		return anychat.SetSDKOptionString(optname, value);
	else
		return anychat.SetSDKOptionInt(optname, value);
}
// SDK�ں˲���״̬��ѯ�����β���ֵ��
function BRAC_GetSDKOptionInt(optname) {
	return anychat.GetSDKOptionInt(optname);
}
// SDK�ں˲���״̬��ѯ���ַ�������ֵ��
function BRAC_GetSDKOptionString(optname) {
	return anychat.GetSDKOptionString(optname);
}

// ��ȡ�ڲ�ͨ�ž��
function BRAC_GetIPCGuid() {
	var ANYCHATWEB_SO_IPCGUID = 11000; 
	return anychat.GetSDKOptionString(ANYCHATWEB_SO_IPCGUID);
}

// �鲥���ܿ���
function BRAC_MultiCastControl(lpMultiCastAddr, dwPort, lpNicAddr, dwTTL, dwFlags) {
	return anychat.MultiCastControl(lpMultiCastAddr, dwPort, lpNicAddr, dwTTL, dwFlags);
}



