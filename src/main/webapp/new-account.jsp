<!DOCTYPE html>
<html>
    <head>
        <title>IBanking - New Account</title>
    </head>
    <body>
        <h2>iBanking - Open Account</h2>
        <form action="newAccount" method="POST">
            Account No: <input type="text" name="accountNo"/><br/>
            Account Holder Name: <input type="text" name="accountHolderName"/><br/>
            Account Type: 
            <select name="accountType">
                <option value="savings">savings</option>
                <option value="current">current</option>
            </select><br/>
            Balance: <input type="text" name="balance"/><br/>
            <input type="submit" value="Open-Account"/>
        </form>
    </body>
</html>