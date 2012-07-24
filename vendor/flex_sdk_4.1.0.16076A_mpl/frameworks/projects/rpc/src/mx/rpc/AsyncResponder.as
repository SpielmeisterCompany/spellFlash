////////////////////////////////////////////////////////////////////////////////
//
//  ADOBE SYSTEMS INCORPORATED
//  Copyright 2006-2007 Adobe Systems Incorporated
//  All Rights Reserved.
//
//  NOTICE: Adobe permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package mx.rpc 
{

/**
 * This class provides an RPC specific implementation of <code>mx.rpc.IResponder</code>.
 * 
 * It allows the creator to associate data (a token) and methods that should be 
 * called when a request is completed.
 *
 * The result method specified must have the following signature:
 *  <code><pre>
 *     public function myResultFunction(result:Object, token:Object = null):void;
 *  </pre></code>
 *
 * The fault method specified must have the following signature:
 *  <code><pre>
 *     public function myFaultFunction(error:Object, token:Object = null):void;
 *  </pre></code>
 * 
 * Any other signature will result in a runtime error.
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Flex 3
 */
public class AsyncResponder implements IResponder 
{

    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    /**
     *  Constructs an instance of the responder with the specified data and 
     *  handlers.
     *  
     *  @param result Function that should be called when the request has
     *          completed successfully.
     *          Must have the following signature:
     *          <pre>public function (result:Object, token:Object = null):void;</pre>
     *  @param fault Function that should be called when the request has
     *          completed with errors.
     *          Must have the following signature:
     *          <pre>public function (error:FaultEvent, token:Object = null):void;</pre>
     *  @param token Additional information to associate with
     *          this request.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function AsyncResponder(result:Function, fault:Function, token:Object = null)
    {
        super();

        _resultHandler = result;
        _faultHandler = fault;
        _token = token;
    }
    
    //--------------------------------------------------------------------------
    //
    //  Methods
    //
    //--------------------------------------------------------------------------

    /**
     *  This method is called by a service when the return value has been 
     *  received.
     *
     *  @param data Object containing the information returned from the request.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function result(data:Object):void
    {
        _resultHandler(data, _token);
    }
    
    /**
     *  This method is called by a service when an error has been received.
     *
     *  @param info Object containing the information about the error that 
     *          occured.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function fault(info:Object):void
    {
        _faultHandler(info, _token);
    }
    
    //--------------------------------------------------------------------------
    //
    //  Variables
    //
    //--------------------------------------------------------------------------

    private var _resultHandler:Function;
    private var _faultHandler:Function;
    private var _token:Object;
}

}