<?php

namespace AppBundle\Controller;

use AppBundle\Data\CategoryMaster;
use AppBundle\Entity\Area;
use AppBundle\Entity\MainArea;
use AppBundle\Form\AreaType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

class AreaController extends Controller
{
    // This is Basically a ZONE AREA
    /**
     The root of area routes.
     */
    public function indexAction(EntityManagerInterface $em, $_route,$ar)
    {
        $activeFarmId = $this->get('session')->get('activeFarm');

        $areas = $em->getRepository('AppBundle:Area')->findBy(array('mainarea' => $ar));

        $growingMethodNames = array_map(function ($item) {
            $growingMethodName = CategoryMaster::growingMethods();

            return $growingMethodName[$item->getGrowingMethod()];
        }, $areas);

        $measurementUnits = array_map(function ($item) {
            $unit = CategoryMaster::areaUnits();

            return $unit[$item->getMeasurementUnit()];
        }, $areas);

        // for the right bar menu
        $fields = $em->getRepository('AppBundle:Field')->findAll();

        return $this->render('area/index.html.twig', array(
            'areas' => $areas,
            'growingMethods' => $growingMethodNames,
            'measurementUnits' => $measurementUnits,
            'classActive' => $_route,
            'farms' => $fields,
            'ar' => $ar
        ));
    }

    /**
     The detail of single area.
     */
    public function showAction($id, EntityManagerInterface $em, Request $request, $_route,$ar)
    {
        $area = $em->getRepository('AppBundle:Area')->find($id);
        if (!$area) {
            throw new NotFoundHttpException(sprintf('Area with id %s is not found.', $id));
        }

        $plants = $this->container->get('app.repository.plant_repository')->findPlantByArea($area);

        // get growing method name from the master or categories
        $growingMethodName = CategoryMaster::growingMethods()[$area->getGrowingMethod()];

        // for the right bar menu
        $fields = $em->getRepository('AppBundle:Field')->findAll();

        return $this->render('area/show.html.twig', array(
            'area' => $area,
            'growingMethod' => $growingMethodName,
            'plants' => $plants,
            'total_varieties' => count($plants),
            'current_capacities' => array_reduce($plants, function ($carry, $item) {
                return $carry += $item['area_capacity'];
            }),
            'classActive' => $_route,
            'farms' => $fields,
            'ar' => $ar
        ));
    }

    /**
     Show the form to add new area and persist it to the database.
     */
    public function createAction(EntityManagerInterface $em, Request $request, $_route,$ar)
    {
        $activeFarmId = $this->get('session')->get('activeFarm');
        $fields = $em->getRepository('AppBundle:Field')->findAll();

        $area = new Area();

        $form = $this->createForm(AreaType::class, $area);
        $form->handleRequest($request);
        $mainarea = $em->getRepository(MainArea::class)->find($ar);
        $unit = $mainarea->getUnit();
        if ($form->isSubmitted() && $form->isValid()) {
            $area = $form->getData();

            // save to database here
            $ars = $em->getRepository('AppBundle:MainArea')->find($ar);
            $area->setMainArea($ars);
            $field = $em->getRepository('AppBundle:Field')->findOneById((int) $activeFarmId);
            $area->setField($field);
            $area->setCreatedAt(new \DateTime('now'));







            $area->setHeight($request->get('height'));
            $area->setWidth($request->get('width'));
            $area->setUnit($request->get('unit'));
            $em->persist($area);
            $em->flush();

            return $this->redirectToRoute('areas',['ar' => $ar]);
        }

        $total= $mainarea->getHeight() * $mainarea->getWidth();
        $remaining = 0;
        $zones = $em->getRepository(Area::class)->findBy(['mainarea' => $mainarea->getId()]);
        foreach ($zones as $item){
            $remaining += ($item->getHeight() * $item->getWidth());
        }
        $remaining = $total - $remaining;


        return $this->render('area/create.html.twig', array(
            'farms' => $fields,
            'form' => $form->createView(),
            'classActive' => $_route,
            'unit' => $unit,
            'ar' => $ar,
            'total' => $total,
            'remaining'=> $remaining
        ));
    }

    /**
     Editing the detail of the area
     */
    public function editAction($id, $_route, EntityManagerInterface $em, Request $request,$ar)
    {
        $area = $em->getRepository('AppBundle:Area')->find($id);

        $form = $this->createForm(AreaType::class, $area);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $area = $form->getData();

            // save to database here
            $area->setUpdatedAt(new \DateTime('now'));
            $area->setHeight($request->get('height'));
            $area->setWidth($request->get('width'));
            $area->setUnit($request->get('unit'));
            $em->persist($area);
            $em->flush();

            return $this->redirectToRoute('areas_show', array('id' => $id,'ar' => $ar));
        }

        // for the right bar menu
        $fields = $em->getRepository('AppBundle:Field')->findAll();
        $mainarea = $em->getRepository(MainArea::class)->find($ar);
        $unit = $mainarea->getUnit();

        $total= $mainarea->getHeight() * $mainarea->getWidth();
        $remaining = 0;
        $zones = $em->getRepository(Area::class)->findBy(['mainarea' => $mainarea->getId()]);
        $temp = [];
        foreach ($zones as $zone) {
            if ($zone->getId() != $area->getId()){
                array_push($temp,$zone);
            }
        }
        $zones = $temp;
        foreach ($zones as $item){
            $remaining += ($item->getHeight() * $item->getWidth());
        }
        $remaining = $total - $remaining;



        return $this->render('area/edit.html.twig', array(
            'form' => $form->createView(),
            'area' => $area,
            'classActive' => $_route,
            'farms' => $fields,
            'unit' => $unit,
            'ar' => $ar,
            'total' => $total,
            'remaining'=> $remaining
        ));
    }
}
