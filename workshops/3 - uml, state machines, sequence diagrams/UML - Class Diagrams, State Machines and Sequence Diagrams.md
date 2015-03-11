#UML - Class Diagrams, State Machines and Sequence Diagrams
### Part 1
The aim of this workshop is threefold. The first is to practise design by practising our Universal Modelling Language (UML) class modelling. In doing this we will be concentrating mostly on functional requirements.

The second aim is to develop good guidelines for the creation of sequence diagrams. Thirdly we will be looking at the creation of state machines and modelling state-based programs.

Over both weeks our exercises will focus on one problem domain, a point of sale system for a small hardware store

### The Point of Sale (POS) System
A timber and hardware store sells different kinds of timber, paints and painting products, lights and household electrical products, plumbing and bathroom products and gardening products.

A project is underway with the aim of equipping staff with mobile service terminals that they can use to advise customers, get the latest prices if not displayed and inform customers about the latest discounts and sales in the store. Once sales are made the aim is to automatically adjust the level of stock through a stock monitoring system and to release the items sold so that they can pass through the exits monitored by a security system without raising an alarm.

Your task is to design a Mobile Service Terminal (MST) and inventory monitoring but not the security subsystem. You need to assume that you have an Interface to the security subsystem that registers the bar-codes of released items.

### Rules of POS Operation
- Store staff can walk around the store with mobile MST terminals. A staff member can complete sales of items without the need to go to a register or sales station provided that customers have credit cards or store cards.
- To complete a sale with a **credit card** the following sequence of steps must occur:
    * The item’s bar code is scanned.
    * The credit card is inserted into the machine and the card is validated against the credit agency for the card.
    * If the card is valid then the price of the item is charged to the card if enough credit remains in the card. If not the the sale will be **declined** and no further action is possible for this sale.
    * If the amount is accepted then the item’ is ‘released’ from the store by sending its bar code to the central monitoring system. Released items do not raise alarms when they pass through  an exit monitored by the security system.
- Store cards are discounted debit cards, that is, the card acts as a debit card but applies a 10% discount to all non-sale and non-discounted items.  The following sequence of steps must occur for a sale with a store card:
    * The item’s bar code is scanned.
    * The store card is inserted into the machine and the card is validated against the customer’s debit balance.
    * If the card balance is sufficient for the the item then the sale is made and the customer’s balance is adjusted according to the price of the item. If the customer’s balance is not sufficient then the sale will be declined and they can be directed to a cash register for combined case/card sales.
    * If the sale proceeds then item’ is ‘released’ from the store.
- The staff can also perform stock taking activities by using their MST’s. They do this by scanning bar-codes or stock numbers of items. Once an item is scanned the inventory is checked and updated automatically.
- If no bar-code or stock-number exists on the item then they can look up the item’s stock-numbers from a description of the item. The staff member must select the correct item in this case and once selected the number of item is automatically recorded and the inventory adjusted as in 4. above.
- Supervisors can used the mobile data terminals to check sales for a specific sales consultant, or to determine the price of an item if there is a discounting period.
- Card sales must be done reliably, that is, that there is a 99.9999% chance that the sale goes through without a failure.

#### Exercise One - Core
Working in teams of 2 or 3, lets start small. The aim is to create a domain model of the MST store sales and inventory monitoring system.!
Think of a single staff member making a sale. Create an object model (objects and the relationships between them) of the objects involved in:

1. making a credit card sale;
2. making a store card sale;
3. looking up the inventory.

#### Exercise Two - Core
Now develop a class domain model from your object models. Look for where you can perform generalisation and use inheritance and aggregations. Look for where you can simplify.

Step through each of the requirements in the bullet points above and build in any classes that are missing from your class model.

> You may well need to iterate and adjust the models as you go adding classes and deleting attributes or methods - but this is all part of the **fun**!

### Use Cases
Below we present a single use case for the point of sale system.

**Use Case POS-1  Credit Card Sale**

|      Use Case     |        POS-1 Credit Card Sale                      |
|:-----------------:|:---------------------------------------------------|
|       Actors      |    Customer, Staff Member, Credit Card Agency      |
|  External Trigger | Staff member initiates a sale using the Mobile Service Terminal (MTS).  |
|  Internal Trigger |    N/A                                             |
| Brief Description | The use-case describes how the customer,  staff member,  credit card agency and MST system interact to achieve a store-card sale. |

**Flow of Events**

1. The staff member holding the MTS initiates a sale.
2. The staff member reads the barcodes of all the items in the sale.
3. The MTS calculates a total sale price applying any customer discounts or sale policies that are in place.
4. The credit card details are read by the MTS .
5. The MTS system validates the card details against the credit agency. The validation procedure is as follows:
    * The card details are read by the MTS.
    * The customer types in their PIN.
    * The card number, the sale amount and the pin are sent to the credit agency.
    * The credit agency sends a message saying a card is valid and that the sale is approved.
6. **If** the card is valid **and** enough credit remains in the account linked to the card then the  total price of the items is charged to the card account.
7. The MTS system records the transaction and stores the transaction for accounting and later data analysis.
8. All of the purchased items are ‘released’ from the store by sending a list of barcodes to the security system.
    * Released items do not raise alarms when they pass through an exit monitored by the security system.

**Alternative Flows**

* **6a)** If the card is not valid or the account does not have enough credit for the item then the sale will be declined and no further action is possible for this sale. The use-case ends.

#### Exercise Three - Core
Using your class diagram that you have created in exercise two, along with the use case presented above, you task is to develop a sequence diagram that shows the flow of interaction throughout the above use case.

To develop the sequence diagram you will need to think carefully about the ‘methods’ in each of the classes. The trick to modelling is to think of the ‘methods’ as something that an object (of a class) must do as part of the use case. Thus, each action by an actor, and each response by the system can be modelled by a method in the appropriate class.

Of course this could also mean that you will need to add new attributes to store the state of the new methods that you have added.

Each step in the flow of events in the use case should contain objects and actions that can be modelled objects and methods. Consider each step of the flow in turn and add its effects to the sequence diagram.

> Take care to ensure you are using proper UML syntax to describe loops and control flow as these are techniques that will be usefull in your Project 3 design submission.

#### Exercise Four - Core
We now have a much better idea about how information will flow through the system, thanks to our sequence diagram. We also have a much better idea of which methods will be required on which classes.

Using this information, complete your class diagram so that it contains all methods needed to implement the system. Be sure to include arguments along with return types.

#### Exercise Five - Core
We may view a transaction as being in specific states as the transaction progresses through the Credit Card Sale use-case.

- Determine a list of possible states for a transaction to be in as it progresses through the Credit Card Sale use case.
- Determine a list of events that cause the transaction to transition from one state to another.
- Develop a state chart for the transaction.

## Workshop Submission
You are required to submit your answers to all of the exercises marked 'core' in this weeks workshop. You should submit one zip file, named 'workshop 3 - STUDENTNO.zip' where STUDENTNO is replaced by your student number. For example, if your student number was 12345, your file should be called `workshop 3 - 12345.zip`.

In this file you should include:

- Pdf documents, one for each exercise.

The submission for this workshop is due at **11:59 pm, Sunday the 26th of April**.


