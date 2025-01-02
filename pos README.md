# POS for efficient processing in system gastronomy
This app is a project for my enterprise class at uni. 
It mainly aims to help with high volume order processing by producing a queue wich groups ingredients together.
It also features a Notion based CMS, well to be percise it uses Notion as a CMS via the Notion API and Notion Integrations.

We have a Notion Database:
<img width="1067" alt="Screenshot 2024-12-30 at 12 02 28" src="https://github.com/user-attachments/assets/3ead3379-7db9-44fe-ae45-9bd489b1613c" />
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
![Untitled Dec 30 2024 (1)](https://github.com/user-attachments/assets/91bba486-bf62-46d7-a1e7-754731a84526)
![Untitled Dec 30 2024 (2)](https://github.com/user-attachments/assets/d1902968-a714-4d4a-a91f-1c48e62090d2)
![Unnamed Dec 30 2024](https://github.com/user-attachments/assets/e565920c-9b93-4466-b7a4-7396b63ac673)

And my personal highlight, this super satisfiying onClick animation.
<br>

https://github.com/user-attachments/assets/91bcf213-cd21-4954-b247-8b8c7c2e072f
