<?php
$this->load->view('main/top-title-panel.php');
?>
    <div class="services-description">
        <?php
         $this->load->view('job/' . $this->cSingleJob . '.php');
        ?>
    </div>
<?php
$this->load->view('main/tabs-images.php');
$this->load->view('main/mail-panel.php');
?>