"""
Install the Google AI Python SDK

$ pip install google-generativeai

See the getting started guide for more information:
https://ai.google.dev/gemini-api/docs/get-started/python
"""

import os
import google.generativeai as genai
# from main import text_to_speech

from dotenv import load_dotenv
load_dotenv()


genai.configure(api_key=os.getenv("GEMINI_API_KEY"))

# Create the model
# See https://ai.google.dev/api/python/google/generativeai/GenerativeModel
generation_config = {
  "temperature": 0,
  "top_p": 0.95,
  "top_k": 64,
  "max_output_tokens": 8192,
  "response_mime_type": "text/plain",
}


model = genai.GenerativeModel(
  model_name="gemini-1.5-flash",
#   safety_settings=safety_settings,
  generation_config=generation_config,
 system_instruction = "You are a helpful recipe recommender. Based on the ingredients provided by the user, suggest suitable recipes, including preparation time and any dietary precautions. Ensure that recommendations align with dietary restrictions, cooking preferences, and nutritional balance.",
)



chat_session = model.start_chat(
    history=[]
)

print("Bot: Hello, how can I help you?")
print()

# importing the MeTTa class from hyperon module
from hyperon import MeTTa
metta = MeTTa()
with open("task2.metta") as file:
    metta.run(file.read())

while True:
    user_input = input("You: ")
    if user_input.lower() == "exit" or user_input.lower()== "quit" or user_input.lower() == "stop" or user_input.lower() == "bye":
        print("Bot: Goodbye! Have a great day!")
        break
    print()

    # Extract only the ingredients
    response = chat_session.send_message(
        f'Extract only ingredients from this sentence and format them as: ("ingredient1" "ingredient2" "ingredient3").make sure that each string should start with Upper case'
        f'Do not include anything else.User input: {user_input}'
         f' check and correct the spelling error.'
    )

    model_response1 = response.text
    print(f'Bot: {model_response1}')


    # Use extracted ingredients to find a recipe
    user_input2 = metta.run(f'!(find-recipe {model_response1})')
    # print(user_input2)

    # Get recipe details with optimized prompt
    response2 = chat_session.send_message(
    f'Extract the recipe name and its ingredients from this touple or touples: {user_input2} it may be only one or many (if is is more than 6 use only the first 4 touple elements).note that in the touples only the first element is recipe name others are ingredients'
     f'prioritize a touples with many elements'
    f'Format the response as: "You can make recipe_name with ingredients" you found from the  the touples (use all touples not only one touple).additionally add a cooking time in minutes and deitry restriction  which are  found on the last two element of the touple respectively.'
    
    f'Avoid  redundant recipe names and ingredients. Only provide unique recipes. from this {user_input2} this is a big mistake if you do not do this.'
    f'User input: {user_input2}'
    f'don\'t write the same recipe name (if it is the same) in the response just include the unique recipe name and ingredients.'
    f'prioritize a touples with many elements'


    
)

    model_response2 = response2.text

    print(f'Bot: {model_response2}')
    print()
