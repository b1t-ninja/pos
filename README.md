# POS for efficient processing in system gastronomy
This app is a project for my enterprise class at uni. 
It mainly aims to help with high volume order processing by producing a queue wich groups ingredients together.
It also features a Notion based CMS, well to be percise it uses Notion as a CMS via the Notion API and Notion Integrations.

We have a Notion Database:
<img width="1042" alt="Screenshot 2025-01-02 at 11 37 25" src="https://github.com/user-attachments/assets/a80884e4-cce1-41a7-9ce9-87e3c1cf9f18" />
Which allows the user a convenient way of managing their products, while also optimizing storange cost and architectural complexity, as all data is stored and managed by Notion.
This comes with a price, namely a Notion subscription fee if you were planning to store a whole bunch of products. As the Notion free plan has its limitations. 
As a student tho, we have access to theroretical infinite cloud storage via Notions student plan. So why not make use of it. 

Another drawback is that this service stands and falls with Notion, **if** Notion decides to chnage something about their API, well this too needs to change. 

## Architecture
**Frontend**: SwiftUI <br>
**Backend**: Golang + Gin

Originally planned as a BFF architecture, I've quickly scaled down to a single client server architecture as I did not have the numbers to also create a web interface and a possible mobile one as well. Tho a analtics web client for the application is in planning.

The backend repo might be added later, if I find the time to clean it up.

## Usage
- Build the app
- Build the server (if uploaded)
- Process orders faster 🏎️

## Some Images
<img width="996" alt="Screenshot 2025-01-02 at 11 39 56" src="https://github.com/user-attachments/assets/570eddbe-565d-40e4-8f1e-cd70c85c568f" />
<img width="996" alt="Screenshot 2025-01-02 at 11 40 07" src="https://github.com/user-attachments/assets/b670a583-bf18-475f-b1df-77ccbc3ea737" />
<img width="995" alt="Screenshot 2025-01-02 at 11 40 16" src="https://github.com/user-attachments/assets/1c11fd09-04a9-4a8d-8d03-915ffd04548e" />
