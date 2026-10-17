## Problem
Find users who did not confirm their account on the first day after
signing up, but confirmed via text message on the second day.

### Step-by-step thinking
1. Sign-up dates are stored in the `emails` table and confirmation
   data in the `texts` table. We cannot compare the sign-up date with
   the confirmation date without joining the two.
2. The tables are joined with an INNER JOIN on the shared `email_id`
   column, so each user's sign-up date and text confirmation record
   appear on the same row.
3. Only confirmed records are needed, so the filter
   `signup_action = 'Confirmed'` is applied.
4. The key condition is the date: `action_date` must equal
   `signup_date + 1 day`. This shows the confirmation happened exactly
   on the second day.

### Why is there no separate condition for "did not confirm on day one"?
Because the confirmation record is dated one day after sign-up, the
user had not confirmed the account before that date. If the
confirmation had happened on the first day, `action_date` would equal
the sign-up date and the row would be filtered out.

### Example
| signup_date | action_date | Result |
|-------------|-------------|--------|
| 2022-06-14  | 2022-06-14  | Excluded (confirmed on day one) |
| 2022-06-14  | 2022-06-15  | Included (confirmed on day two) |
| 2022-06-14  | 2022-06-20  | Excluded (confirmed too late) |

### Assumption
Each confirmation action is stored as a separate row in the `texts`
table. If a user has confirmation rows on both the first and the
second day, this query would return that user as well. To prevent
this, users with a first-day confirmation can be excluded using
NOT EXISTS.

# NOTE: This query was written entirely through my own effort, without
# any help from artificial intelligence.
# Best regards,
# Azat Hallyyev

Istanbul Gelisim University student, Turkey, Istanbul

2nd-year Management Information Systems student

Data analyst and software developer
