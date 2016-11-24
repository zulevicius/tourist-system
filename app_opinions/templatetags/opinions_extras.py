import datetime
import pytz
from django import template


register = template.Library()


@register.filter('opinion_votes')
def opinion_votes(opinion, votes):

    opinion_votes_arr = []
    for vote in votes:
        if vote.opinion == opinion:
            opinion_votes_arr.append(vote)

    return opinion_votes_arr


# mark = 0 -> downvotes
# mark = 1 -> upvotes
@register.filter('get_votes')
def get_upvotes(votes, mark):

    votes_counter = 0
    for vote in votes:
        if vote.vote == mark:
            votes_counter += 1

    return votes_counter


@register.filter('i_did_not_vote')
def i_did_not_vote(votes, user_pk):

    if user_pk == None:
        return None

    for vote in votes:
        if vote.user.pk == user_pk:
            return None

    return True


@register.filter('by_paragraphs')
def by_paragraphs(text):
    arr = []
    for line in text.splitlines():
        line = line.strip()
        if not line: continue
        arr.append(line)
    return arr
