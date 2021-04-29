Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F318436F0CD
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Apr 2021 22:07:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4278C58D59;
	Thu, 29 Apr 2021 20:07:36 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6D58C57B74
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 20:07:34 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 d3-20020a9d29030000b029027e8019067fso60603558otb.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 13:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dNfKkjx4DR+Lk/fp2pqCaCdRlUGoFXGdGxZd1aUW8I0=;
 b=nSMNgPDUZC+hd3UHyU/zqBdFzO3tNcV88dlOcGBXxbspmzk58c5m7PxhwLJRzKEv+9
 vx4N/b9ETXoYG/6onHGe0MQjfFtvTW64ehmhTAhF+eQaL1M/oJsIPGHGwRHqkyotaQxs
 MPxqBA4w6UcOLYgdX8bwHuXB8G2HcfHXHskpsMEAY+z+pNrHiYxQk73Fj9M4xr/Ji68a
 vRtnF7rWhg675NkZrK4Smpv7RgzGXpVLlz/Kp6oYqy684xlbw7aOQnyxQ53UQNDCwDtY
 PO914lbelYvZVCrMVXp7QwJOGFBU6ttque7fHvnMqBZmoOBTZQPcCoGv47byigzJ2o+u
 79Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dNfKkjx4DR+Lk/fp2pqCaCdRlUGoFXGdGxZd1aUW8I0=;
 b=JGvEXQB2MHbE2/0pkd39lsRvqGrL375PxL53g1UiCRnYsKMASxXQcWkcG1vBj2daT/
 rHo0LFGkMXhrQrTp31p18v7DdSWaGh9TESL1j5qL2F9OiNkcKqaZJmdV6MtlOgvo7NyR
 MqWlfOAid+V39KS0JPRJyf2dyLt4sxf7Xp6Eas59UAp1Vabcarlm2Oudd7lSdUrqcj5A
 JBpZayuJpbNCH+yQTvNqQMKzxJFNHTYkJkPikrT0IRdv/OkXF22hsOEUtOLd9/O0853C
 lsEPl1LLn0SWt8OiFVlgymPmu8NSjyvSRlYJeSGRoJ5Nw5CX1jQhlsBTfwwiE668gvRL
 jZHQ==
X-Gm-Message-State: AOAM533ZcXlUl+1VnkNpdhlWbiKz6vpHIFcoapwPPvAVB+Y/m5KGRNVL
 UDxEkpAl6DJcLJaepXLJx43SyzkLD53F2TuCPsc=
X-Google-Smtp-Source: ABdhPJxAp/91GQuP68jSx98MAG5xmTi/cae2tl8NcBDkjXG5AEySsF2AzGQWEX6w8noOUWnyRccj3oF1K9RSM+7u6QU=
X-Received: by 2002:a05:6830:1543:: with SMTP id
 l3mr925954otp.31.1619726853489; 
 Thu, 29 Apr 2021 13:07:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210426172459.1.I3fde47925951f917dbd08b6e826d91669f62b221@changeid>
In-Reply-To: <20210426172459.1.I3fde47925951f917dbd08b6e826d91669f62b221@changeid>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Thu, 29 Apr 2021 23:07:22 +0300
Message-ID: <CAGi-RU+qHhH1KmJY2yE8r851JMw0w01xSoQPpjL0D8SCEQSZ+Q@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] net: eth-phy: define LOG_CATEGORY
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
>  drivers/net/eth-phy-uclass.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/net/eth-phy-uclass.c b/drivers/net/eth-phy-uclass.c
> index 07aebd935e..abb658bf21 100644
> --- a/drivers/net/eth-phy-uclass.c
> +++ b/drivers/net/eth-phy-uclass.c
> @@ -3,6 +3,8 @@
>   * Copyright 2020 NXP
>   */
>
> +#define LOG_CATEGORY UCLASS_ETH_PHY
> +
>  #include <common.h>
>  #include <dm.h>
>  #include <net.h>
> --
> 2.17.1
>
Reviewed-by: Ramon Fried <rfried.dev@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
