<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\UserType;
use App\Repository\QuestionRepository;
use App\Repository\UserRepository;
use App\Security\LoginFormAuthenticator;
use Doctrine\ORM\EntityManagerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use Symfony\Component\Security\Guard\GuardAuthenticatorHandler;

class HomeController extends AbstractController
{
    /**
     * @Route("/", name="app_register")
     */
    public function register(Request $request, GuardAuthenticatorHandler $guardHandler, LoginFormAuthenticator $authenticator)
    {
        $user = new User();
        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($user);
            $entityManager->flush();

            // do anything else you need here, like send an email

            return $guardHandler->authenticateUserAndHandleSuccess(
                $user,
                $request,
                $authenticator,
                'main' // firewall name in security.yaml
            );
        }

        return $this->render('home/register.html.twig', [
            'registrationForm' => $form->createView(),
        ]);
    }

    /**
     * @Route("/game", name="app_game")
     */
    public function game(QuestionRepository $repository)
    {
//        $questions = $repository->findRandomQuestions();
        $questions = $repository->findRandomQuestions();
//        dd($questions);
        return $this->render('home/game.html.twig',[
            'questions' => $questions
        ]);
    }

    /**
     * @Route("/result", name="app_result")
     */
    public function results()
    {
        return $this->render('home/result.html.twig');
    }

    /**
     * @Route("/result/fetch", name="app_result_fetch", methods={"POST"})
     */
    public function fetchResults(UserRepository $userRepository)
    {
        $scores = $userRepository->findOrderByScore();
        // TODO : ako su neka polja iz nekog razloga null (score ili time sto se meni desavalo), da njih ne ispise
        return $this->json($scores);
    }

    /**
     * @Route("/result/fetch/one", name="app_result_fetch_one", methods={"POST"})
     */
    public function fetchLastUser(UserRepository $userRepository)
    {
        $scores = $userRepository->findLastPlayedUser();
        // TODO : ako su neka polja iz nekog razloga null (score ili time sto se meni desavalo), da njih ne ispise
        return $this->json($scores);
    }

    /**
     * @Route("/result/process", name="app_result_process")
     */
    public function resultProcess(Request $request, QuestionRepository $repository, UserRepository $userRepository, EntityManagerInterface $em)
    {
        $data = json_decode($request->getContent(),true);
        $points = 0;
            foreach ($data as $key => $value) {
                if ($key != 'time') {
                    $question = $repository->findOneBy(['id' => $key]);
                    $rightAnswers = [];
                    foreach ($question->getQuestionChoices() as $k => $v) {
                        if ($v->getIsRightChoice()) {
                            $rightAnswers[] = $v->getId();

                        }
                    }
                    sort($rightAnswers);
                    sort($value);
                    if($rightAnswers == $value) {
                        $points += 10;
                    }
                }
            }
        $user = $this->getUser();
        if(!$user) {
            $user = $userRepository->findOneBy([],['id' => 'DESC']);
        }
        $user->setScore($points);
        $user->setTime($data['time']);
        $em->persist($user);
        $em->flush();

        return $this->json(['points' => $points]);
    }

}
