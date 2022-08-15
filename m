Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA12C595395
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Aug 2022 09:18:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A20B5C640FA;
	Tue, 16 Aug 2022 07:18:17 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61D95C04003
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Aug 2022 13:15:42 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-11ba6e79dd1so2974406fac.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Aug 2022 06:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=3axLTtkT9m5w3wqvU1g6PLvRBW1/2tvRAV+8p+FyXT0=;
 b=XmkWJ4gAYzV6ASEMXTlh6gaFeR7kLFhP7U9zyb8PClDdccxphHyxY4+4VMnqin0+Y4
 bZ63Bf4LjFdnV5k3Je+vKbkSmGVcbdQpV97xHCYY32R9Y83In8AAWCNxlE+AhbTysWeW
 ZEPCh9LX5fuu+Rz13CGlBafgKDvd2TrmQOGmLOyNna+12uXhZd9lW5nssAnB6Vuc0Ony
 NsmDmOQk+MOBQFA1T2YOFZLhg7gwmjTZv+AtQ1/NiUH3z/3ymhwKLYd8dnh8j/tl7Ay4
 iNTD29h9Hxp9AfswcW5GF3Vf0sBLMYTIqYGFu/l1x3/5JylmNKza4i5WS282s78rqIEl
 ma0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=3axLTtkT9m5w3wqvU1g6PLvRBW1/2tvRAV+8p+FyXT0=;
 b=6aeTiuQTcyzLavQ4Wu9odYduHh5sMDAmV87B+64R6lHJAJ+Tu8UiStWGkckV6TLuE/
 7iX0VtJyIPaAOW8I9g7SLqhLnKicNpLAPqmqvfIYCh46gUYpE5BI/vmB/ZLbMnVbIFKf
 pAzszSlda2SQbzTOIT/51YtPX+yuKKzXGpCUlBIycOGGBjvwoYta7ybnYC2bI208/mhO
 1pM1yccoNrOoxZNsjOzJ53RZ3IlpIUKBDH5jXjsnSM5J8wVa8p17QKHyaZjQhVNMGeB7
 X+nHRYMoFtsIT2YRcYywox2th6eFMB0dJLLnjHh2yNUIg2B+TzVoxIdJI2UGSCZEuYCw
 IHjw==
X-Gm-Message-State: ACgBeo0RGQL+2N8JWeMXcD/ErdAtjjXPHbe/teEpMcz9N6/eLMaLmu4s
 +3td2mLvJ+Bw9iNzK1d4ZaumOUjQdBs/kvEq2nE=
X-Google-Smtp-Source: AA6agR73qjNY1sxQy7ZLK4OZdnnErg51ngpALBEmSrvhCI8Wgk3teg/J0jBO9sFGA4n2FvZDG6Onq9q1dTNJEOIYp80=
X-Received: by 2002:a05:6870:f146:b0:116:9a91:1a81 with SMTP id
 l6-20020a056870f14600b001169a911a81mr6722919oac.111.1660569341147; Mon, 15
 Aug 2022 06:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220815111905.4090289-1-jorge@foundries.io>
 <20220815111905.4090289-2-jorge@foundries.io>
In-Reply-To: <20220815111905.4090289-2-jorge@foundries.io>
From: Oleksandr Suvorov <cryosay@gmail.com>
Date: Mon, 15 Aug 2022 16:15:28 +0300
Message-ID: <CAGgjyvGpBe+UtZpu91e9Koo4-gRKE+G9Cqq+q=NKqkc8-efiYw@mail.gmail.com>
To: Jorge Ramirez-Ortiz <jorge@foundries.io>
X-Mailman-Approved-At: Tue, 16 Aug 2022 07:18:16 +0000
Cc: patrick.delaunay@foss.st.com, uboot-stm32@st-md-mailman.stormreply.com,
 hs@denx.de, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH 2/2] i2c: stm32f7: do not set the STOP
	condition on error
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Jorge,

On Mon, Aug 15, 2022 at 2:19 PM Jorge Ramirez-Ortiz <jorge@foundries.io> wrote:
>
> Sending the stop condition without waiting for TC has been
> found to lock the bus.
>
> Tested accessing the the NXP SE05X I2C device.

"the the" seems like a typo.

With this,
Reviewed-by: Oleksandr Suvorov <oleksandr.suvorov@foundries.io>

> Signed-off-by: Jorge Ramirez-Ortiz <jorge@foundries.io>
> ---
>  drivers/i2c/stm32f7_i2c.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
> index 3a727e68ac..14827e5cec 100644
> --- a/drivers/i2c/stm32f7_i2c.c
> +++ b/drivers/i2c/stm32f7_i2c.c
> @@ -485,9 +485,11 @@ static int stm32_i2c_message_xfer(struct stm32_i2c_priv *i2c_priv,
>                 }
>         }
>
> -       /* End of transfer, send stop condition */
> -       mask = STM32_I2C_CR2_STOP;
> -       setbits_le32(&regs->cr2, mask);
> +       if (!ret) {
> +               /* End of transfer, send stop condition */
> +               mask = STM32_I2C_CR2_STOP;
> +               setbits_le32(&regs->cr2, mask);
> +       }
>
>         return stm32_i2c_check_end_of_message(i2c_priv);
>  }
> --
> 2.34.1
>


-- 
Best regards
Oleksandr

Oleksandr Suvorov
cryosay@gmail.com
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
