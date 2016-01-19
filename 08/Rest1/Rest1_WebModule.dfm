object WebModule3: TWebModule3
  OldCreateOrder = False
  OnCreate = WebModuleCreate
  Actions = <
    item
      Default = True
      Name = 'actionEcho'
      PathInfo = '/Echo'
      OnAction = actionEchoAction
    end
    item
      Name = 'actionCustomers'
      PathInfo = '/Customers'
      OnAction = actionCustomersAction
    end
    item
      Name = 'actionCustData'
      PathInfo = '/CustData'
      OnAction = actionCustDataAction
    end
    item
      Name = 'actionCustomer'
      PathInfo = '/Customer/*'
      OnAction = actionCustomerAction
    end>
  Height = 245
  Width = 328
  object cdsCustomers: TClientDataSet
    Aggregates = <>
    FileName = 'customer.cds'
    Params = <>
    Left = 152
    Top = 104
  end
end
