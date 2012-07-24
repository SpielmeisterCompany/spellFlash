////////////////////////////////////////////////////////////////////////////////
//
//  ADOBE SYSTEMS INCORPORATED
//  Copyright 2008-2009 Adobe Systems Incorporated
//  All Rights Reserved.
//
//  NOTICE: Adobe permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
//////////////////////////////////////////////////////////////////////////////////
package flashx.textLayout.property
{
	import flashx.textLayout.debug.assert;
	import flashx.textLayout.formats.FormatValue;
	import flashx.textLayout.tlf_internal;
		
	use namespace tlf_internal;
		
	[ExcludeClass]
	/** A property description with a Boolean value. @private */
	public class BooleanProperty extends Property
	{
		public function BooleanProperty(nameValue:String, defaultValue:Boolean, inherited:Boolean, category:String)
		{
			super(nameValue, defaultValue, inherited, category);
		}
		
		/** @private */
		public override function setHelper(currVal:*,newObject:*):*
		{ 
			if (newObject === null)
				newObject = undefined;

			if (newObject === undefined || newObject is Boolean || newObject == FormatValue.INHERIT)
				return newObject;
			
			if (newObject == "true" || newObject == "false")
				return newObject == "true";
			
			Property.errorHandler(this,newObject);
			return currVal;	
		}
		
		/** @private */
		public override function hash(val:Object, seed:uint):uint
		{ 
			if (val == FormatValue.INHERIT)
				return UintProperty.doHash(inheritHashValue, seed);
			CONFIG::debug { assert(!(val is String),"BooleanProperty.has non inherit string"); }
			return UintProperty.doHash((val as Boolean) ? 1 : 0, seed);
		}
	}
}
