<?php

namespace App\Repository;

use App\Entity\User;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method User|null find($id, $lockMode = null, $lockVersion = null)
 * @method User|null findOneBy(array $criteria, array $orderBy = null)
 * @method User[]    findAll()
 * @method User[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class UserRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, User::class);
    }

    /**
     * @return User[] Returns an array of User objects
     */
    public function findOrderByScore(): array
    {
        return $this->createQueryBuilder('u')
            ->select('u.firstName, u.lastName, u.time, u.score, u.nickname, u.email')
            ->andWhere('u.score IS NOT NULL')
            ->addorderBy('u.score','DESC')
            ->addOrderBy('u.time','ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }

    /**
     * @return User[] Returns an array of User objects
     * @throws \Doctrine\ORM\NonUniqueResultException
     */
    public function findLastPlayedUser(): array
    {
        return $this->createQueryBuilder('u')
            ->select('u.firstName, u.lastName, u.time, u.score, u.nickname, u.email')
            ->andWhere('u.score IS NOT NULL')
            ->orderBy('u.id', 'DESC')
            ->setMaxResults(1)
            ->getQuery()
            ->getOneOrNullResult()
            ;
    }


    /*
    public function findOneBySomeField($value): ?User
    {
        return $this->createQueryBuilder('u')
            ->andWhere('u.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
