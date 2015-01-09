<?php
/**
 * This page is used to add new urls to the database.  URLs can either have a random string
 * assigned to them, or a user-specified string, which is then used as the short url.
 *
 * Any errors are reported back to the user, as too is the short link, so that it can be easily used.
 */

require_once 'Shortener.php';
$s = new Shortener();

//This section will insert the data into the database if data has been provided.  If no data has already been submitted, no action is taken.
if (isset($_POST['url'])) {
    $s->addLink(filter_input(INPUT_POST, 'url'), filter_input(INPUT_POST, 'shorturl'));
}
?>

<!doctype html>
<html>
    <head>
        <title>Stretch Projects URL Shortener</title>
        <!--
            This could arguably be seperated out into a seperate css file, but with such a small amount of styling,
            it is probably better to combine it and save connections to the server.
        -->
        <style>
            main { text-align: center; }
            * { font-family: Verdana; }
            body { margin: 0;}
            section { background: lightgray; padding: 1.25em; }
            input { font-size: 1.5em; margin: 0.25em;}
            #url { font-size: 2em; width: 30em; }
            .error { background: red; }
            .errorfree { background: lime; }
        </style>
    </head>
    <body>
        <main>
            <h1>Stretch Projects URL Shortener</h1>
            <?php
            /**
             * Checking whether any feedback has been provided by the server.  If so, display
             * the feedback in either an error format, or an error-free format.
             * If no feedbacvk has been provided (eg, on first visit), no action is taken
             */
            if (isset($_SESSION['response']) && isset($_SESSION['state'])) {
                if ($_SESSION['state'] == 'error') {
                    echo '<section class="error">' . $_SESSION['response'] . '</section>';
                } else {
                    echo '<section class="errorfree">Link created: <input type="text" value="' . $_SESSION['response'] . '" readonly></section>';
                }
            }
            ?>
            <section>
                <article>
                    <form action="<?php echo getenv("SCRIPT_NAME"); ?>" method="POST">
                        <input type="url" name="url" id="url" placeholder="Paste the URL here" required><br/>
                        <input type="text" name="shorturl" id="shorturl" placeholder="The short code" value="<?php echo $s->generateCode(); ?>">
                        <input type="submit" id="submit" value="Shorten">
                    </form>
                </article>
            </section>
        </main>
    </body>
</html>