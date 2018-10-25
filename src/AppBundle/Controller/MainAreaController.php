<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Area;
use AppBundle\Entity\MainArea;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Doctrine\ORM\EntityManagerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class MainAreaController extends Controller
{
    /**
     * @Route("/area" , name="mainarea")
     */
    public function indexAction(EntityManagerInterface $em,$_route)
    {
        $activeFarmId = $this->get('session')->get('activeFarm');
        $areas = $em->getRepository(MainArea::class)->findBy(array('fieldId' => (int) $activeFarmId));

        // FOR SIDE BAR
        $fields = $em->getRepository('AppBundle:Field')->findAll();
        return $this->render('AppBundle:MainArea:index.html.twig', array(
            'classActive' => $_route,
            'farms' => $fields,
            'areas' => $areas
        ));
    }
    /**
     * @Route("/area/create" , name="mainarea_create")
     */
    public function createAction(EntityManagerInterface $em,$_route,Request $request)
    {
        $activeFarmId = $this->get('session')->get('activeFarm');
//        $areas = $em->getRepository(MainArea::class)->findBy(array('fieldId' => (int) $activeFarmId));

        if ($request->getMethod() == "POST"){
               $area = new MainArea();
               $area->setFieldId($activeFarmId);
               $area->setHeight($request->get('height'));
               $area->setWidth($request->get('width'));
               $area->setUnit($request->get('unit'));
               $area->setName($request->get('name'));

            if($_FILES['image']['name'] != ""){
                $info = pathinfo($_FILES['image']['name']);
                $ext = $info['extension'];
                $date = date('mdYhisms', time());
                $newname = $date . '.' . $ext;
                $target = 'uploads/mainareas/'.$newname;
                move_uploaded_file( $_FILES['image']['tmp_name'], "./".$target);
                $area->setImage($target);
            }
            $em->persist($area);
            $em->flush();

            return $this->redirectToRoute('mainarea');

        }

        // FOR SIDE BAR
        $fields = $em->getRepository('AppBundle:Field')->findAll();
        return $this->render('AppBundle:MainArea:create.html.twig', array(
            'classActive' => $_route,
            'farms' => $fields,
        ));
    }
    /**
     * @Route("/area/edit/{id}" , name="mainarea_edit")
     */
    public function editAction(EntityManagerInterface $em,$_route,Request $request,$id)
    {
        $activeFarmId = $this->get('session')->get('activeFarm');
//        $areas = $em->getRepository(MainArea::class)->findBy(array('fieldId' => (int) $activeFarmId));
        $area = $em->getRepository(MainArea::class)->find($id);
        if ($request->getMethod() == "POST"){
               $area->setFieldId($activeFarmId);
               $area->setHeight($request->get('height'));
               $area->setWidth($request->get('width'));
               $area->setUnit($request->get('unit'));
               $area->setName($request->get('name'));

            if($_FILES['image']['name'] != ""){
                $info = pathinfo($_FILES['image']['name']);
                $ext = $info['extension'];
                $date = date('mdYhisms', time());
                $newname = $date . '.' . $ext;
                $target = 'uploads/mainareas/'.$newname;
                move_uploaded_file( $_FILES['image']['tmp_name'], "./".$target);
                $area->setImage($target);
            }
            $em->flush();

            return $this->redirectToRoute('mainarea');

        }
        // FOR SIDE BAR
        $fields = $em->getRepository('AppBundle:Field')->findAll();
        return $this->render('AppBundle:MainArea:edit.html.twig', array(
            'classActive' => $_route,
            'farms' => $fields,
            'area' => $area
        ));
    }
    /**
     * @Route("/area/checkarea/" , name="mainarea_checkarea")
     */
    public function checkareaAction(EntityManagerInterface $em,$_route,Request $request)
    {
        $activeFarmId = $this->get('session')->get('activeFarm');
        $mainarea = $em->getRepository(MainArea::class)->find($request->get('ar'));

        $y = $mainarea->getHeight();
        $x = $mainarea->getWidth();
        $sqMeter = $x * $y;
        echo "$x x $y = Total: " . $sqMeter;
        $ny = $request->get('height');
        $nx = $request->get('width');
        $nsqMeter = $nx * $ny;
        echo "<br>$nx x $ny = Total To Add: " . $nsqMeter;
        $zones = $em->getRepository(Area::class)->findBy(['mainarea' => $request->get('ar')]);
        if (count($zones) == 0){
            if ($mainarea->getWidth() > $x && $mainarea->getHeight() > $y){
                echo "OK";
            }else{
                echo "Error";
            }
        }else{
            $areas = [];
            echo "<br>You Have More other zones <br>";
            foreach ($zones as $item){
                array_push($areas,[$item->getWidth(),$item->getHeight()]);
            }
            $havingblocks = [];
            foreach ($areas as $area) {
                echo $area[0] . ' x ' . $area[1] . ' = ' . $area[0]*$area[1];
                $width= $x - $area[0];
                if ($width > 0){
//                    array_push()
                }
            }

        }

        return new Response("");
    }


}
