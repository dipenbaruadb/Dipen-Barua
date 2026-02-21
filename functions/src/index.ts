import * as admin from 'firebase-admin';
import {onSchedule} from 'firebase-functions/v2/scheduler';
import {onDocumentCreated} from 'firebase-functions/v2/firestore';

admin.initializeApp();
const db = admin.firestore();

export const generateRecurringTransactions = onSchedule('every day 00:10', async () => {
  const recurring = await db.collection('transactions').where('isRecurring', '==', true).get();
  const batch = db.batch();
  recurring.docs.forEach((doc) => {
    const t = doc.data();
    const newRef = db.collection('transactions').doc();
    batch.set(newRef, {
      ...t,
      id: newRef.id,
      date: admin.firestore.Timestamp.now(),
      createdAt: admin.firestore.Timestamp.now(),
      updatedAt: admin.firestore.Timestamp.now(),
    });
  });
  await batch.commit();
});

export const calculateMonthlySummary = onSchedule('0 1 1 * *', async () => {
  const users = await db.collection('users').get();
  for (const user of users.docs) {
    const uid = user.id;
    const tx = await db.collection('transactions').where('userId', '==', uid).get();
    let income = 0;
    let expense = 0;
    tx.docs.forEach((d) => {
      const data = d.data();
      if (data.type === 'income') income += data.amount;
      if (data.type === 'expense') expense += data.amount;
    });
    await db.collection('users').doc(uid).collection('summaries').doc('latest').set({income, expense, balance: income - expense, updatedAt: admin.firestore.FieldValue.serverTimestamp()});
  }
});

export const sendReminderNotifications = onDocumentCreated('loans/{loanId}', async (event) => {
  const data = event.data?.data();
  if (!data) return;
  await admin.messaging().send({
    topic: `user_${data.userId}`,
    notification: {title: 'Loan Reminder', body: `Loan due for ${data.personName}`},
  });
});
