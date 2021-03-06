$PBExportHeader$w_help.srw
forward
global type w_help from window
end type
type mle_1 from multilineedit within w_help
end type
end forward

global type w_help from window
integer width = 3584
integer height = 1648
boolean titlebar = true
string title = "towers help"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mle_1 mle_1
end type
global w_help w_help

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

on w_help.create
this.mle_1=create mle_1
this.Control[]={this.mle_1}
end on

on w_help.destroy
destroy(this.mle_1)
end on

event open;wf_Center()


String ls_help

ls_help = "The puzzle involves three pegs. The problem is to move all disks from the left peg to the right peg according to certain rules." +  "~r~n" + &
"Rules:" +  "~r~n" + &
 "~r~n" + &
"·	When a disk is moved, it must be placed on one of the three pegs." +  "~r~n" + &
"·	Only one disk may be moved at a time." +  "~r~n" + &
"·	You can not take a disk that has another disk on top. (It must come from the top of the stack)" +  "~r~n" + &
"·	A larger disk may never be placed on top of a smaller one." +  "~r~n" + &
 "~r~n" + &
"Example Instructions" +  "~r~n" + &
 "~r~n" + &
"1	Select the number of disks to be used using the disk edit box." +  "~r~n" + &
 "~r~n" + &
"Note: The larger the number disks, the larger the number of moves needed to solve problem." +  "~r~n" + &
 "~r~n" + &
"2	Hit Start to begin the process. Once it has begun, you must let the problem go to completion." +  "~r~n" + &
"3	Hit Single Step to allow you to view each move. The moves will stop until you hit a button to continue." +  "~r~n" + &
 "~r~n" + &
"History" +  "~r~n" + &
 "~r~n" + &
"Legend has it that the priests in the Temple of Bramah were given a puzzle consisting of a golden platform with three golden needles on which were placed 64 golden disks. The world was to end when they had successfully finished moving the disks to another disks using the rules given above." 


mle_1.text =  ls_help
end event

event resize;mle_1.move(1,1)
mle_1.resize(newwidth, newheight)
end event

type mle_1 from multilineedit within w_help
integer width = 3328
integer height = 1536
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

