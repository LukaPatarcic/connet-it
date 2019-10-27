<?php

namespace App\Repository;

use App\Entity\QuestionChoices;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method QuestionChoices|null find($id, $lockMode = null, $lockVersion = null)
 * @method QuestionChoices|null findOneBy(array $criteria, array $orderBy = null)
 * @method QuestionChoices[]    findAll()
 * @method QuestionChoices[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class QuestionChoicesRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, QuestionChoices::class);
    }

    //
    // @return QuestionChoices[] Returns an array of QuestionChoices objects
    //
    public function findByQuestionId($value)
    {
        return $this->createQueryBuilder('q')
            ->select('q.choice, q.isRightChoice')
            ->andWhere('q.id = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getResult()
        ;
    }

    /*
    public function findOneBySomeField($value): ?QuestionChoices
    {
        return $this->createQueryBuilder('q')
            ->andWhere('q.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
