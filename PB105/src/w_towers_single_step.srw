$PBExportHeader$w_towers_single_step.srw
forward
global type w_towers_single_step from window
end type
type cb_cancel from commandbutton within w_towers_single_step
end type
type cb_step from commandbutton within w_towers_single_step
end type
end forward

global type w_towers_single_step from window
integer x = 1632
integer y = 1404
integer width = 882
integer height = 412
boolean titlebar = true
string title = "Towers of Hanoi"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_cancel cb_cancel
cb_step cb_step
end type
global w_towers_single_step w_towers_single_step

forward prototypes
public function integer wf_center ()
end prototypes

public function integer wf_center ();//*-----------------------------------------------------------------*/
//*    f_Center:  Center the window
//*-----------------------------------------------------------------*/
int li_screenheight, li_screenwidth, li_rc, li_x=1, li_y=1
environment	lenv_obj

/*  Check for a window association with this object  */
If IsNull ( this ) Or Not IsValid ( this ) Then Return -1

/*  Get environment  */
If GetEnvironment ( lenv_obj ) = -1 Then Return -1

/*  Determine current screen resolution and validate  */
li_screenheight = PixelsToUnits ( lenv_obj.ScreenHeight, YPixelsToUnits! )
li_screenwidth  = PixelsToUnits ( lenv_obj.ScreenWidth, XPixelsToUnits! )
If Not ( li_screenheight > 0 ) Or Not ( li_screenwidth > 0 ) Then Return -1

/*  Get center points  */
If li_screenwidth > this.Width Then
	li_x = ( li_screenwidth / 2 ) - ( this.Width / 2 )
End If
If li_screenheight > this.Height Then
	li_y = ( li_screenheight / 2 ) - ( this.Height / 2 )
End If

/*  Center window  */
li_rc = this.Move ( li_x, li_y )
If li_rc <> 1 Then Return -1

Return 1
end function

on w_towers_single_step.create
this.cb_cancel=create cb_cancel
this.cb_step=create cb_step
this.Control[]={this.cb_cancel,&
this.cb_step}
end on

on w_towers_single_step.destroy
destroy(this.cb_cancel)
destroy(this.cb_step)
end on

event open;wf_Center()
end event

type cb_cancel from commandbutton within w_towers_single_step
integer x = 137
integer y = 176
integer width = 576
integer height = 108
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
boolean cancel = true
end type

on clicked;//turn off the single step click box
//return a 0 meaning single step will not continue
Closewithreturn(Parent,0)
end on

type cb_step from commandbutton within w_towers_single_step
integer x = 137
integer y = 32
integer width = 576
integer height = 108
integer taborder = 10
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Step"
boolean default = true
end type

on clicked;//close window and allow processing to continue
//close returning a 1 meaning that single step will continue.
ClosewithReturn(Parent,1)
end on

