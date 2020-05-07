<!DOCTYPE html>
<html lang="en">
        <?php
            include "function.php";
            $idposts = $_GET['id'];
            $category = $_GET['category'];    

            $sql = "SELECT posts.id_posts, posts.title_posts, posts.body_posts, posts.date_posts, posts.image_posts, authors.name_authors, category.category_name FROM posts, authors, category  WHERE posts.username = authors.username AND category.id_category = posts.id_category AND posts.id_posts = $idposts";

            $data_artikel = query($sql);

            $sql = "SELECT title_posts FROM posts ORDER BY posts.date_posts DESC LIMIT 4";
            $artikel_terbaru = query($sql);

            $sql = "SELECT name_coments, body, comments_date FROM comments WHERE id_posts = '$idposts' ORDER BY comments_date DESC";
            $komentar = query($sql);

        ?>

<head>
    <!-- CSS -->
    <link rel="stylesheet" href="assets/css/stylekuh.css">
    <link rel="icon" href="assets/image/logo.png">

    <!-- Responsif -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title><?php echo $category?></title>
</head>

<body>
    <div class="kolom">

        <!-- Nav -->
        <div class="nav">
            
            <ul>
                <li class="blog"><a href="https://abdulqoheng.github.io">Abdul Qohar</a></li>
                <?php 
                if($category=='JAVA'){
                    ?>
                    <li><a href="index.php">Home</a></li>
                    <li class="aktif"><a href="index.php?categry=JAVA">JAVA</a></li>
                    <li><a href="index.php?categry=PHP">PHP</a></li>
                    <li><a href="index.php?categry=MySQL">MySQL</a></li>
                    <?php

                }else if($category=='PHP'){
                    ?>
                    <li><a href="index.php">Home</a></li>
                    <li><a href="index.php?categry=JAVA">JAVA</a></li>
                    <li class="aktif"><a href="index.php?categry=PHP">PHP</a></li>
                    <li><a href="index.php?categry=MySQL">MySQL</a></li>
                    <?php
                }else if($category=='MySQL'){
                    ?>
                    <li><a href="index.php">Home</a></li>
                    <li><a href="index.php?categry=JAVA">JAVA</a></li>
                    <li><a href="index.php?categry=PHP">PHP</a></li>
                    <li class="aktif"><a href="index.php?categry=MySQL">MySQL</a></li>
                    <?php
                }else {
                    ?>
                    <li class="aktif"><a href="index.php">Home</a></li>
                    <li><a href="index.php?categry=JAVA">JAVA</a></li>
                    <li><a href="index.php?categry=PHP">PHP</a></li>
                    <li><a href="index.php?categry=MySQL">MySQL</a></li>
                    <?php
                }

                ?>
                
            </ul>
        </div>
        <!-- End Nav -->

        <!-- Benner-->
        <div class="benner">
            <img src="assets/image/banner.jpg" alt="">
        </div>
        <!-- End Benner -->

        <!-- Conten -->
        <div class="konten cf">
            <div class="artikel">
            <?php foreach($data_artikel as $item_artikel) { ?>
                <div class="subartikel">
                    <h2><?php echo $item_artikel['title_posts']?></h2>
                    <h3><?php echo date('l, d-m-y | h:i:s', strtotime($item_artikel['date_posts'])) ?></h3>
                    <h3><?php echo "| Kategori :".$item_artikel['category_name']." " ?></h3>
                    <h3><?php echo "| Penulis : ".$item_artikel['name_authors']." " ?></h3>
                    <?php echo "<img src='$item_artikel[image_posts]' alt='<?php echo $item_artikel[title_posts]?>' >" ?>

                    <p><?php echo $item_artikel['body_posts'] ?></p>
                    <br>
                    <br>
            <?php } ?>

                </div>
                    <h2>Komentar</h2>
                    <?php foreach($komentar as $comment) { ?>
                    <div class="komentar">
                    <h3><?php echo date('l, d-m-y | h:i:s', strtotime($comment['comments_date'])) ?></h3>
                    <h3>Dari : <?php echo $comment['name_coments'] ?></h3>
                    <p>Komentar : <?php echo $comment['body']?></p>
                    </div>
                    <?php } ?>
                

            </div>
            <div class="sidebar">
                <div class="About">
                    <h1>About</h1>
                    <p>Website belajar pemrograman yang sangat cocok mulai dari cara belajar coding untuk pemula sampai dengan tingkatan yang lebih expert. Tidak hanya bahan pembelajaran disini juga akan di kenalkan dengan berbagai bahasa pemrograman.</p>

                </div>
                <div class="terbaru">
                    <h1>Artikel Terbaru</h1>
                    <ul>   
                    <?php foreach($artikel_terbaru as $terbaru) { ?>
                        <li><a href="artikel_lengkap.php?id=<?php echo $item_artikel['id_posts']?>&category=<?php echo $item_artikel['category_name']?>"><?php echo $terbaru['title_posts']?></a></li>
                    <?php }?>
                    </ul>
                </div>

            </div>

        </div>
        <!-- End Conten -->

        <div class="footer">
            <p>Copyright &copy; 2020 Abdul Qohar</p>
        </div>
    </div>
</body>

</html>