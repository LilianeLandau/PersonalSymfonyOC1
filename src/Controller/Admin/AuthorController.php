<?php

namespace App\Controller\Admin;

use App\Entity\Author;
use App\Form\AuthorType;
use App\Repository\AuthorRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;


#[Route('/admin/author')]
final class AuthorController extends AbstractController
{

    //afficher tous les auteurs & les auteurs vivants
    #[Route('', name: 'app_admin_author_index', methods: ['GET'])]
    public function index(AuthorRepository $repository): Response
    {
        //afficher tous les auteurs
        $authors = $repository->findAll();
        //afficher les auteurs vivants
        $livingAuthors = $repository->findLivingAuthors();
        //afficher les auteurs morts
        $deadAuthors = $repository->findDeadAuthors();

        return $this->render('admin/author/index.html.twig', [
            'controller_name' => 'AuthorController',
            'authors' => $authors,
            'livingAuthors' => $livingAuthors,
            'deadAuthors' => $deadAuthors,
        ]);
    }

    //ajouter un auteur
    #[Route('/new', name: 'app_admin_author_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $manager): Response
    {
        $author = new Author();
        $form = $this->createForm(AuthorType::class, $author);

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $manager->persist($author);
            $manager->flush();

            return $this->redirectToRoute('app_admin_author_index');
        }

        return $this->render('admin/author/new.html.twig', [
            'form' => $form,
        ]);
    }

    //voir les détails d'un auteur
    #[Route('/{id}', name: 'app_admin_author_show', requirements: ['id' => '\d+'], methods: ['GET'])]
    public function show(?Author $author): Response
    {
        return $this->render('admin/author/show.html.twig', [
            'author' => $author,
        ]);
    }
}
