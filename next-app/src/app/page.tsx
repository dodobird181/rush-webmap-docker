import { prisma } from '@/lib/prisma'

export default async function Page() {

  const questions = await prisma.question.findMany();

  return (
    <div>
      {questions.map((question) => {
        return <div key={question.id}>
          <h1>{question.title}</h1>
          <h2>{question.subtitle}</h2>
          <p>{question.content}</p>
          <p>Make you're move: {question.make_your_move}</p>
          <p>Down the rabbit hole: {question.down_the_rabbit_hole}</p>
          <img src={question.image}></img>
        </div>
      })}
    </div>
  );
}