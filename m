Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 650CD1739D1
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Feb 2020 15:27:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DD32C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Feb 2020 14:27:12 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6419BC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Feb 2020 14:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1582900026;
 bh=R2zun27YR1qMpyfvQFOzS4jnov/x+4bLNHjbHQKYEKc=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=PXqavBECVwcArQ/PveUcQWCBvWHP4/1XbEsvj6jB4fLfP3iKK+WlrbTmQkprMNJXk
 A/iBghWZLqMLLfvU+IPol5K+Anyuk9OU42XVfEWe3hhn1WlzbGFwElyMovi2cZ4z1S
 SKBoIAcZ6IKa8YEwL3S/tXcR1tzyMU/NjtgXSifY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.43.155] ([89.204.154.104]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MuDbx-1jO83j1o4L-00uVqm; Fri, 28
 Feb 2020 15:27:06 +0100
To: Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de
References: <20200228141816.1644-1-patrick.delaunay@st.com>
 <20200228141816.1644-2-patrick.delaunay@st.com>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-ID: <fe3c7a44-70ed-551d-b63c-4d131e9ee85e@gmx.de>
Date: Fri, 28 Feb 2020 15:27:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200228141816.1644-2-patrick.delaunay@st.com>
Content-Language: en-US
X-Provags-ID: V03:K1:DeyNUfy7nUqIsFaUxbZ76z2Rh0bc7mHmkgLAT0NW0F1F/KoWj5U
 Sv5n0gbAjX34S/fHCVpybFpTx0Ajv4mxsXnp6zog2c5TcR7pxVIzsucllROR5SFj7g5OGbV
 kTpL5YdR6HW83pGZxW1IBhYZbVTnHFieqry6uyu9tf0HPXOqUbIxV4bcYuk53dHp7ZWBulK
 VYLfENp7mVZRXLR/SE/ow==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cQ7QBvGjrAY=:9O4ragMT7rPIiUb7D2xXwe
 j26umpRj7NfbHY1kqRNx7b97+XtTDwkITOyF8uehDLu3vKZtSnNO8J7wYZGBZVNl5TwPYbfAQ
 DkQ24gxEagUQKeuhmZuZ6DrPm7/4haVS4alHL98WVD8U12Y6Nh/pC6N/5mmfFEfhnvG0127ep
 Gv09g/RHUks91G2s3wHzMafCigt+eJ20MjU/Ol3XBZsjZZmO7jrInCvQi1PL0KRLta6+jEdOn
 wnyTNsazFYMy8VLdwGaR24dQ5cY1n90wEvcY53U45KaiEo1qjk8BDQmBTpx8drMkFk1mcDHEt
 sofQAoggGaldyXCbZyq9zR0TcSUiXVEwv/NDBjH3kpnorGFH3Xr+kxE6n1YhTIjDGtoucLHhK
 yfncXOBiDBXiHwaWAvkwFkrmgNxk4xINQel5h2gooOfpbg7IX1+yV5gXDP/FpNtXXfEbpEBtg
 uezqyi73D1O6dRkcBcE1LW7Zt8cAFZ71OfSGVchsUIapOepoc7o/PqYqjQfatp3ImguatvAoL
 ROXbB19j0fZsGD1d7qDwF/RC+z5zMqdW+cVgobkVuw8cgrcaVAL4c5ddZ6wJ77NB2suJu7lde
 trW7QdfoZHe5honoXG4KlaoIt71z6D5XhZYmc5r/6U/PgU0j1y0DpzTVhn+6BMIrsrVzTFHLE
 mCrEQsPYfFMZCXJPNqfP5zAx6IBb+8iW4q7Pi1m0N42m3KOJ5o+dF4tZOUcwDRPp8QmCOQvlB
 IdD84BlUeQQN/VvmtfTmngStK9JkHH8E0IvUTNBC5DySgyVdnCGll9e1jqE68vMUibIKzGYA3
 vJUyaoj7w3ld+oUdxqaGWjv2X0UCLkKvNTZjoUwgWVWxyL9lGJ2mTvFE5RFcJWSNVL5a9SySn
 ewUbHTuknf7mrldgvtIWUl3OblsB8TWWl/51txjexrCoJcnxzyGYuHvmroTp71dOfadS0EquW
 j1rIfpCWEUhel+gW7vp9wMBLpukUQwW8r3Dl6G8eU18gHXFgLOjWvzZfQnGTpmvP+RdR62VaK
 sBmSvJUzr/GVIcXcdspKxxZzs8ld3zPk+D4ES0pLSwrTe2DUukk57DaMqD17Eza3cFy4FK3/t
 xCtqHDTROimmbW7Iojr3Qy2hGaNTwnQNNR+I2DAIoVdwTWMA4hUHDl4fmgH4opHQu04bOotJ+
 Ntr9z/ZZqw+LPsxRYWatzg47h5GnJimzNi67w1wOzMtBz3kqyxty7l28J/MSoUFygzmAGAT6D
 xSg053BD/fs+XqP3o
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Thomas Hebb <tommyhebb@gmail.com>, Andreas Dannenberg <dannenberg@ti.com>
Subject: Re: [Uboot-stm32] [PATCH 1/7] README: update reference to *.README
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>



On 2/28/20 3:18 PM, Patrick Delaunay wrote:
> Update some reference in README file detected by
> scripts/documentation-file-ref-check
>
> *.README => README.*
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Reviewed-by: Heinrich Schuchardt <xypron.glpk@gmx.de>

> ---
>
>   README | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/README b/README
> index 8cfa92fac9..4a0f8cbeef 100644
> --- a/README
> +++ b/README
> @@ -4639,7 +4639,7 @@ int main(int argc, char *argv[])
>   	while (learning) {
>   		Read the README file in the top level directory;
>   		Read http://www.denx.de/twiki/bin/view/DULG/Manual;
> -		Read applicable doc/*.README;
> +		Read applicable doc/README.*;
>   		Read the source, Luke;
>   		/* find . -name "*.[chS]" | xargs grep -i <keyword> */
>   	}
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
