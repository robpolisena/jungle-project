# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 with any future expiry date and security code for seeing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Screen Shots

!["Screenshot of home page"](https://github.com/robpolisena/jungle-project/blob/master/docs/Screen%20Shot%20home-page.png)
!["Screenshot of cart page"](https://github.com/robpolisena/jungle-project/blob/master/docs/Screen%20Shot%20my-cart.png)
!["Screenshot of order page"](https://github.com/robpolisena/jungle-project/blob/master/docs/Screen%20Shot%20order-total.png)
!["Screenshot of product detail"](https://github.com/robpolisena/jungle-project/blob/master/docs/Screen%20Shot%20product-detail.png)