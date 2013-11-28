require 'spec_helper'

describe Phone do
  it 'does not allow duplicate phone numbers per contact' do
    contact = Contact.create(firstname: 'Joe', lastname: 'Tester',
                            email: 'joetestes@example.com')
    home_phone   = contact.phones.create(phone_type: 'home',
                                      phone: '234345-5456-5464')
    mobile_phone = contact.phones.build(phone_type: 'mobile',
                                       phone:'234345-5456-5464')
    expect(mobile_phone).to have(1).errors_on(:phone)
  end

  it "allows two contacts to share a phone number" do
    contact = Contact.create(firstname: 'Joe', lastname: 'Tester',
                             email: 'joetester@example.com')
    contact.phones.create(phone_type: 'home',
                          phone: '785-555-1234')
    other_contact = Contact.create(firstname: 'John', lastname: 'Doe',
                                   email: 'johndoe@tester.com')
    other_phone = other_contact.phones.build(phone_type:'home',
                                             phone: '785-555-1234')
    expect(other_contact).to be_valid
  end
end
