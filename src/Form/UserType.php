<?php

namespace App\Form;

use App\Entity\School;
use App\Entity\User;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Email;
use Symfony\Component\Validator\Constraints\NotBlank;

class UserType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('firstName', TextType::class, [
                'label' => 'Name',
                'attr' => [
                    'autocomplete' => 'off'
                ],
                'constraints' => [
                    new NotBlank([
                        'message' => 'PLease fill out this field',
                    ])
                ]
            ])
            ->add('lastName', TextType::class, [
                'label' => 'Surname',
                'attr' => [
                    'autocomplete' => 'off'
                ],
                'constraints' => [
                    new NotBlank([
                        'message' => 'PLease fill out this field',
                    ])
                ]
            ])
            // ->add('email', EmailType::class, [
            //     'label' => 'Email',
            //     'attr' => [
            //         'autocomplete' => 'off'
            //     ],
            //     'constraints' => [
            //         new NotBlank([
            //             'message' => 'PLease fill out this field',
            //         ]),
            //         new Email([
            //             'message' => 'Email address is not valid'
            //         ])
            //     ]
            // ])
            ->add('nickname', TextType::class,[
                'label' => 'Nickname',
                'attr' => [
                    'autocomplete' => 'off'
                ],
                'constraints' => new NotBlank([
                    'message' => 'PLease fill out this field',
                ]),

            ])
            // ->add('school', EntityType::class,[
            //     'placeholder' => 'Choose your school',
            //     'label' => 'School',
            //     'class' => School::class,
            //     'constraints' => new NotBlank([
            //         'message' => 'PLease fill out this field',
            //     ]),
            // ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
