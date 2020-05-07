<!DOCTYPE html>
<html lang="en">
        <?php
            include "function.php";

            if(isset($_GET['category'])){
                $category = $_GET['category'];
                $sql = "SELECT posts.id_posts, posts.title_posts, posts.body_posts, posts.date_posts, posts.image_posts, authors.name_authors, category.category_name FROM posts, authors, category  WHERE posts.username = authors.username AND category.id_category = posts.id_category AND category.category_name ='$category' ORDER BY posts.date_posts DESC LIMIT 10";
            }else{
                $category = 'Beranda';
                $sql = "SELECT posts.id_posts, posts.title_posts, posts.body_posts, posts.date_posts, posts.image_posts, authors.name_authors, category.category_name FROM posts, authors, category  WHERE posts.username = authors.username AND category.id_category = posts.id_category ORDER BY posts.date_posts DESC LIMIT 10";
            }

            $data_artikel = query($sql);

            $sql = "SELECT posts.id_Posts, posts.title_posts, category.category_name FROM posts, category WHERE category.id_category = posts.id_category ORDER BY posts.date_posts DESC LIMIT 4";
            $artikel_terbaru = query($sql);

        ?>

<head>
    <!-- CSS -->
    <link rel="stylesheet" href="assets/css/stylemu.css">
    <link rel="icon" href="assets/image/logo.png">

    <!-- Responsif -->
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <title><?php echo $category ?></title>
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
                    <li class="aktif"><a href="index.php?category=JAVA">JAVA</a></li>
                    <li><a href="index.php?category=PHP">PHP</a></li>
                    <li><a href="index.php?category=MySQL">MySQL</a></li>
                    <?php

                }else if($category=='PHP'){
                    ?>
                    <li><a href="index.php">Home</a></li>
                    <li><a href="index.php?category=JAVA">JAVA</a></li>
                    <li class="aktif"><a href="index.php?category=PHP">PHP</a></li>
                    <li><a href="index.php?category=MySQL">MySQL</a></li>
                    <?php
                }else if($category=='MySQL'){
                    ?>
                    <li><a href="index.php">Home</a></li>
                    <li><a href="index.php?category=JAVA">JAVA</a></li>
                    <li><a href="index.php?category=PHP">PHP</a></li>
                    <li class="aktif"><a href="index.php?categry=MySQL">MySQL</a></li>
                    <?php
                }else {
                    ?>
                    <li class="aktif"><a href="index.php">Home</a></li>
                    <li><a href="index.php?category=JAVA">JAVA</a></li>
                    <li><a href="index.php?category=PHP">PHP</a></li>
                    <li><a href="index.php?category=MySQL">MySQL</a></li>
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
                    <p><?php echo potongteks($item_artikel['body_posts'], 400) ?>..... <a href="artikel_lengkap.php?id=<?php echo $item_artikel['id_posts']?>&category=<?php echo $item_artikel['category_name']?>">Lanjut Membaca</a></p>
                    
                </div>
                <?php }?>
            </div>
            <!-- End Conten -->

            <!-- Sidebar-->
            <div class="sidebar">
                <div class="About">
                    <h1>About</h1>
                    <p>Website belajar pemrograman yang sangat cocok mulai dari cara belajar coding untuk pemula sampai dengan tingkatan yang lebih expert. Tidak hanya bahan pembelajaran disini juga akan di kenalkan dengan berbagai bahasa pemrograman.</p>
                    
                </div>
                <div class="terbaru">
                    <h1>Artikel Terbaru</h1>
                    <ul>   
                    <?php foreach($artikel_terbaru as $terbaru) { ?>
                        
                        <li><a href="artikel_lengkap.php?id=<?php echo $terbaru['id_Posts']; ?>&category=<?php echo $terbaru['category_name']; ?>"><?php echo $terbaru['title_posts']?></a></li>
                    <?php }?>
                    </ul>
                </div>
                
            </div>
            
            <!-- End Sidebar-->
        </div>

        <div class="footer">
            <p>Copyright &copy; 2020 Abdul Qohar</p>
        </div>
    </div>
</body>

</html>