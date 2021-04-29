Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 627BB36F0CE
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Apr 2021 22:07:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28B48C58D59;
	Thu, 29 Apr 2021 20:07:46 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5E1BC57B74
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 20:07:43 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 d3-20020a9d29030000b029027e8019067fso60604125otb.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 13:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DY6ZnunTsD9NEo4vz70I5QacDHuIVHIrcKmSTIfc0vY=;
 b=XqmA3+jZ4sUCR5HfSf+kvKSC5RRRERjgfcYR+mTSrMDOTtJZfpfY+7WzS8ooSNVPmv
 VwcYKIYpfbOKCt2j6o5ghK+ldKEbZcqolxY4yarKf1zQ4nHw6PhugJMt7OAV9f1fgQLJ
 f1OqyOwK16Pvbgey9t/8Pl23793cUJnxssxkbPuKtqWbSMH2nwXSsufsWksL0708KK7G
 /u3smYDp1PUK6eNvbBJnfVmkj2FPeIoJO0U8KMCu5WxRzJWx8Y2J4o7xrrb41yCWwGSr
 lDHzNdCeB4Jzze5xCLW3H+nI5vSVNtKxKUGvoyJFp6AttuhxYb34bP1oRNJ5Z+ll9d5r
 mUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DY6ZnunTsD9NEo4vz70I5QacDHuIVHIrcKmSTIfc0vY=;
 b=CB+EQpjjOKbJMio6Bh3BNJAgKHVh3ABGb7Jr0BQXySRC4LPm1GFGS5bJHKsFc5hStI
 wirZ9wigNzXah1f/t4nlszxnsWaaP/M1OTC6qiLnub3ub7ENPqfIhcLQRxCO2lgfREVw
 ueew2AvvYwVB15Bgitt3mJkhNYRPP5Dbcx2O2QOAxchUce54+iSIOVi7MLj+/qlWYjVA
 DFWlzJ3CdCgaO7VDY3bEsupFiJjj3Bk2+vHvtgHPV6Il5b1yO9YFLM+I09C2DrRoIS83
 S7mvCZyEk/c+Lv6pOlB04jJvmRf49f26wei28ckhN0RFOCjzesdR2JzhfVwiXPJQTsYE
 hySA==
X-Gm-Message-State: AOAM533o84SMrU4SK7jJNSFnGi+lyxifP7sObZtHmbXUuDdJYpwsfvos
 3vP6YT806dv/kUVP9IFg3ieY7ch4HBS5B0Jvems=
X-Google-Smtp-Source: ABdhPJwA7tWXCOOslLDlJuWs3/5UkmI0+AJIuGiPzQ2xUBLJFTRNpBMtcQyUZ1ls2iJBODN6SG207FV7qQ3OHsbzYdI=
X-Received: by 2002:a9d:65c4:: with SMTP id z4mr938426oth.14.1619726862581;
 Thu, 29 Apr 2021 13:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210426172459.1.I3fde47925951f917dbd08b6e826d91669f62b221@changeid>
 <20210426172459.3.I13f978db3e44ff22e6974a026a3021cd401a9dbb@changeid>
In-Reply-To: <20210426172459.3.I13f978db3e44ff22e6974a026a3021cd401a9dbb@changeid>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Thu, 29 Apr 2021 23:07:31 +0300
Message-ID: <CAGi-RULP37iceksfkAAgY9SsoymF3prOA_eoq=cNy0ci+tvTCg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] net: define LOG_CATEGORY
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

On Mon, Apr 26, 2021 at 6:25 PM Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Define LOG_CATEGORY to allow filtering with log command.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  net/eth-uclass.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/net/eth-uclass.c b/net/eth-uclass.c
> index 34ca731d1e..63ad0908d9 100644
> --- a/net/eth-uclass.c
> +++ b/net/eth-uclass.c
> @@ -5,6 +5,8 @@
>   * Joe Hershberger, National Instruments
>   */
>
> +#define LOG_CATEGORY UCLASS_ETH
> +
>  #include <common.h>
>  #include <bootstage.h>
>  #include <dm.h>
> --
> 2.17.1
>
Reviewed-by: Ramon Fried <rfried.dev@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
