# Table Structure

## Model_name: User
| column_name | Data_type |
| :---: | :---: |
| email | string |
| password_digest | string |
| permition | boolean |

## Model_name: Task
| column_name | Data_type |
| :---: | :---: |
| name | string |
| content | string |
| deadline | date |
| priority | integer |
| status | string |

## Model_name: Label_master
| column_name | Data_type |
| :---: | :---: |
| name | string |

## Model_name: Label_child
| column_name | Data_type |
| :---: | :---: |
| Label_master_id | integer |
| Task_id | integer |
