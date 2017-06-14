# Account Manager

## Overview

Account Manager allows users to add various accounts with balance on them.  Users must create an account to use Account Manager, and users can only view their own accounts.  Furthermore, if a user is not logged in, only main index page, sign up page, and login page are accessible.  If a user attempts to read, edit, or delete an account that does not belong to them, they will be redirected to their /accounts page with an error message.

## Installation

All that is required to use this ap is to clone, run `rake db:migrate` and then run `shotgun` on your terminal.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/JKCodes/tech_dev_news. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
