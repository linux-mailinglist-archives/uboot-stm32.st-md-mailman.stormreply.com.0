Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E63236F0CF
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Apr 2021 22:08:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33661C58D59;
	Thu, 29 Apr 2021 20:08:01 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 075FFC57B74
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 20:08:00 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 v23-20020a9d60570000b02902a53bac99a3so7721872otj.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 13:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fhMJqZsW9Fy8QSfdXWBTjHfnKeETJfQIdLfY3le/W58=;
 b=od4guATjhWMrqcven/dWhLjyq0YMyMEamJDUwGIfbjXAt7TBZKnKz4VcNs48yhUQAS
 lJQnrbzU4kQIgZ5sFwRoeqvUBhPrMsiUVeVverX4XFXZYLc0NzQ0lolwbcRWXL/2hiGV
 LNbgMu9CHOtk2TPUdF/5MiSLRwvtxL1mY2zr0th3GTWBM3q/JpIFCBh3OHeAh2dkKukx
 ezlTLKnGureR5hIii5Iz7/4zGBhqxZ6XKise4jbuj+VoqYtYLPWJ5B/KVicK/UHuUyDk
 92xa167yuLh6Bm9WZbZPVQWPtlOLlrCMaItyhB+6gFZPhKkYX9GbHCfeH6wnNpjxjdQk
 suuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fhMJqZsW9Fy8QSfdXWBTjHfnKeETJfQIdLfY3le/W58=;
 b=k467AdyiPFD0tavvSMUhPz28mQQxPpJ71LTh5BmVnOP2VhjRwD/iqx4aXiK8SMwwQ9
 QMLiWksqV771VvrFklUBv1TU/E4EarsG33aYu6n820wu8XGxysS+gSeLhsPsdG35Iv9f
 NTV+EumG3DAnfrRR99ui0/Atyar4l0MSKS7okJZ+Ce65cF4jCeEkTDOiS+Y2rvUshy1j
 1HFiW2T4pL0hSlzp0Q8TtIKrAoiBAJjFNjEb8Q8NzUzdNPHAY8xtZucHPWTiSB/JiYAQ
 SyU/Zd+W+nCVgRDN/mhNnnmOo06DQ1zsfXUmQqqe3KgnNGEYe39uKeQ5d1k48e7LPs6V
 q3Iw==
X-Gm-Message-State: AOAM533237prd7C1iSWRQM9BiLiCrAmSparPemT3w/ZmGfFbwGaNr91n
 7nwr02qVrODMdiJNsbMge+HhuG4yHTX85S0FSeI=
X-Google-Smtp-Source: ABdhPJyrzLej4/2LMSvZFjrJrea18n7kvcCTAVct/VUpc+ypRoGjna8vDDQDwMb+ZpR964Zy6Sm0AxBY5CXBuBwqhgs=
X-Received: by 2002:a9d:65c4:: with SMTP id z4mr939292oth.14.1619726878908;
 Thu, 29 Apr 2021 13:07:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210426172459.1.I3fde47925951f917dbd08b6e826d91669f62b221@changeid>
 <20210426172459.2.I3fde47925951f917dbd08b6e826d91669f62b221@changeid>
In-Reply-To: <20210426172459.2.I3fde47925951f917dbd08b6e826d91669f62b221@changeid>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Thu, 29 Apr 2021 23:07:47 +0300
Message-ID: <CAGi-RULVnWVf+3FcSE4ps=6gYd0_nCGe1Pzo5qzShubqNyykag@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH 2/3] net: dwc_eth_qos: define LOG_CATEGORY
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
>  drivers/net/dwc_eth_qos.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
> index e8242ca4e1..e423c31753 100644
> --- a/drivers/net/dwc_eth_qos.c
> +++ b/drivers/net/dwc_eth_qos.c
> @@ -27,6 +27,8 @@
>   *    all clock and reset signals to the HW block.
>   */
>
> +#define LOG_CATEGORY UCLASS_ETH
> +
>  #include <common.h>
>  #include <clk.h>
>  #include <cpu_func.h>
> --
> 2.17.1
>
Reviewed-by: Ramon Fried <rfried.dev@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
