<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\QuestionChoicesRepository")
 */
class QuestionChoices
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Question", inversedBy="questionChoices")
     */
    private $question;

    /**
     * @ORM\Column(type="boolean")
     */
    private $isRightChoice;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $choice;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getQuestion(): ?Question
    {
        return $this->question;
    }

    public function setQuestion(?Question $question): self
    {
        $this->question = $question;

        return $this;
    }

    public function getIsRightChoice(): ?bool
    {
        return $this->isRightChoice;
    }

    public function setIsRightChoice(bool $isRightChoice): self
    {
        $this->isRightChoice = $isRightChoice;

        return $this;
    }

    public function getChoice(): ?string
    {
        return $this->choice;
    }

    public function setChoice(string $choice): self
    {
        $this->choice = $choice;

        return $this;
    }
}
