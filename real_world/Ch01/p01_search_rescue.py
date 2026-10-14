# Create a search and rescue game that uses Bayes' rule to inform player choices on how to conduct a search.
from bayes import Search

app = Search('Cape Python')
app.draw_map(last_known=(160, 290))