////////////////////////////////////////////////////////////////////////////////
//
//  ADOBE SYSTEMS INCORPORATED
//  Copyright 2004-2007 Adobe Systems Incorporated
//  All Rights Reserved.
//
//  NOTICE: Adobe permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package mx.accessibility
{

import mx.accessibility.AccConst;
import mx.containers.Panel;
import mx.core.UIComponent;
import mx.core.mx_internal;

use namespace mx_internal;

/**
 *  PanelAccImpl is a subclass of AccessibilityImplementation
 *  which implements accessibility for the Panel class.
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Flex 3
 */
public class PanelAccImpl extends AccImpl
{
    include "../core/Version.as";

	//--------------------------------------------------------------------------
	//
	//  Class methods
	//
	//--------------------------------------------------------------------------

	/**
	 *  Enables accessibility in the Panel class.
	 * 
	 *  <p>This method is called by application startup code
	 *  that is autogenerated by the MXML compiler.
	 *  Afterwards, when instances of Panel are initialized,
	 *  their <code>accessibilityImplementation</code> property
	 *  will be set to an instance of this class.</p>
	 *  
	 *  @langversion 3.0
	 *  @playerversion Flash 9
	 *  @playerversion AIR 1.1
	 *  @productversion Flex 3
	 */
	public static function enableAccessibility():void
	{
		Panel.createAccessibilityImplementation =
			createAccessibilityImplementation;
	}

	/**
	 *  @private
	 *  Creates  Panel's AccessibilityImplementation object.
	 *  This method is called from UIComponent's
	 *  initializeAccessibility() method.
	 */
	mx_internal static function createAccessibilityImplementation(
								component:UIComponent):void
	{
		// The AccessibilityImplementation is placed on the
		// Panel's titleBar, not on the Panel itself.
		// If it were placed on the Panel itself,
		// the AccessibilityImplementations of the Panel's children
		// would be ignored.
		var titleBar:UIComponent = Panel(component).getTitleBar();
		titleBar.accessibilityImplementation =
			new PanelAccImpl(component);
	}

	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------

	/**
	 *  Constructor.
	 *
	 *  @param master The UIComponent instance that this AccImpl instance
	 *  is making accessible.
	 *  
	 *  @langversion 3.0
	 *  @playerversion Flash 9
	 *  @playerversion AIR 1.1
	 *  @productversion Flex 3
	 */
	public function PanelAccImpl(master:UIComponent)
	{
		super(master);

		role = AccConst.ROLE_SYSTEM_GROUPING;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Overridden methods: AccessibilityImplementation
	//
	//--------------------------------------------------------------------------

	/**
	 *  @private
	 *  IAccessible method for returning the state of the Panel.
	 *  States are predefined for all the components in MSAA. Values are assigned to each state.
	 *  Depending upon the Panel being Focusable, Focused and Moveable, a value is returned.
	 *
	 *  @param childID:int
	 *
	 *  @return State:uint
	 */
	override public function get_accState(childID:uint):uint
	{
		var accState:uint = getState(childID);
				
		return accState;
	}

	//--------------------------------------------------------------------------
	//
	//  Overridden methods: AccImpl
	//
	//--------------------------------------------------------------------------

	/**
	 *  @private
	 *  method for returning the name of the Panel
	 *  which is spoken out by the screen reader
	 *  The Panel should return the Title as the name.
	 *
	 *  @param childID:uint
	 *
	 *  @return Name:String
	 */
	override protected function getName(childID:uint):String
	{
		return Panel(master).title;
	}
}

}
