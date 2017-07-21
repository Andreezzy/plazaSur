# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

================================ hoy jueves ===============================

customer(solo lectura acabemos esto):
get:

respuesta: 
{
              status: '200',
              msg: 'ok',
              result: {
                customers: [
                  {
                    id: '01',
                    first_name: 'Cliente offline',
                    last_name: 'Apellidos'
                  }
                ],
                pagination: {
                  totalPages: 1,
                  currentPage: 1,
                  totalRecords: 1 ,
                  from: 1,
                  to: 1
                }
              }
            }


proveedores(solo lectura tambien nomas hagamos)
get:

quero de respuesta:
{
              status: '200',
              msg: 'ok',
              result: {
                suppliers: [
                  {
                    id: '01',
                    name: 'Proveedor offline',
                    ruc: '132456879'
                  }
                ],
                pagination: {
                  totalPages: 1,
                  currentPage: 1,
                  totalRecords: 1 ,
                  from: 1,
                  to: 1
                }
              }
            }

