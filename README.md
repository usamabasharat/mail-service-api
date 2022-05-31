# Mail sending service test project

## System dependencies

- `ruby 3.0.0`
- `PostgreSQL 12`
- `redis`

## Setup and execution

- `bundle install`
- `rails db:create db:migrate db:seed`
- `rails s`
- In a new terminal window: `sidekiq`

## Scenario coverage

### Train Operator

- Tell the system
  - Current capacity of the train is calculated based on the difference between the weight and the parcel

```
POST Request api/v1/trains

{
  name: string | required,
  maximum_weight: float | required,
  maximum_volume: float | required,
  cost: float | required,
  user_id: operator.id  | required,
  train_lines_attributes: [
    {
      line_id: integer | referential
    }
  ]
}
```

- Ask the system
  - For all trains
  ```
    GET Request api/v1/trains
  ```
  - For specific train
  ```
    GET Request api/v1/train/:train_id
  ```

### Parcel Owners

- Tell the system

  - A parcel for shipping

  ```
  POST Request api/v1/parcels

  {
    weight: float | required,
    volume: float | required,
    shipping_address: string | required,
    user_id: parcel_owner_id | required | referential
  }
  ```

  - Withdraw a package: Assuming this means to delete the object

  ```
  DELETE Request api/v1/parcels/:parcel_id
  ```

### Post Master

- Book `+` fill `+` send train

Series of steps are executed to verify this procedure:

1. `Operator` creates a `TrainBid` for a specific train
2. `Post Master` books the train by updating the status to `accepted` using PUT API end point
3. `Post Master` adds `Parcels` to the train using `TrainParcel` POST API end point
4. `Post Master` can start the departure by setting the status of the train to booked.
5. This would assign the line to the booked train, update the parcel status to `in_progress`
6. After 3 hours the parcels would be delivered and the train would be deleted
