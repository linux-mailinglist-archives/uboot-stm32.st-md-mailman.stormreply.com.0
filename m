Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6566E42DD9C
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 Oct 2021 17:09:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29B7BC5C834;
	Thu, 14 Oct 2021 15:09:58 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49C87C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Oct 2021 15:09:55 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id
 r1-20020a4a9641000000b002b6b55007bfso1996145ooi.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Oct 2021 08:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1m1RtVAZ8QTds8F2eZwxhs11A0l1TZZhR0zFvf6Bt3Y=;
 b=CuHUPdltKnb/Nk7FM9w3FHF66Hzves6ggbjokwAJz+eQEFHy3+yaVe3zYSgvojO+Cf
 Mx1XAvLH1TxYq09X28VCk4Qy2VKQ+e3I9uhJkz+3LX7MPRDtU8lVAX7AopNUNSxEiefl
 +WUy7YxHoHp1YYq91hz/27a7DAqV1CZSqjlxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1m1RtVAZ8QTds8F2eZwxhs11A0l1TZZhR0zFvf6Bt3Y=;
 b=xd6JkLkRGaGTQElvXzNCQqTTYO1HxhNz4dibtn8sfSyL4LrnQk8Ru9/fTN1U4cqV6+
 bXrilMR87w1mHgOGqbUqN75TayGvbBfhCb33rFiGyHsRifq9spsLNlMFnCKiL2ocftNS
 GtikscyvafKzeyFq+P+1Sk/EsGgtrgUX0y8t1dVM60a79P1BHuEHH/Ss+vy/YQxj7ZjH
 go0uD4COUmSss6eSCY+OlPGbcQ1htqDE3114sZAQIDpAdof1X6R7I9hOAtyJn8rjRcLD
 cVV6s4qrxOTPDLJCqoUPgAuO6nFxKSxg2vabXpv3CEodAQo2GD3PizmgC4uZFdMNQreH
 xmmw==
X-Gm-Message-State: AOAM530UeSYNpUwYArtEo9S+5eyXtzuiokTvbpIbfll77k8HvwXGM0FJ
 qgCYpzvBpo9D9wv4KPH7IzemLk8LpO+1SPFHDpSiNQ==
X-Google-Smtp-Source: ABdhPJxsKd4mPXE2gUmq7Pt/kgo4ijLkl34Kn+p1L2KxNBHnUEduH7/1QIzAKKAkf21EG20L1G/XAV9lAetv3OcVSQY=
X-Received: by 2002:a4a:5549:: with SMTP id e70mr4545878oob.81.1634224193693; 
 Thu, 14 Oct 2021 08:09:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211004115942.1.Ic01b4a3063c0b09cac503a4dc8356f5ff64b5c6e@changeid>
 <20211004115942.2.Ie0f69e59ca3de9def2b0cf0a825c333bed4707fa@changeid>
In-Reply-To: <20211004115942.2.Ie0f69e59ca3de9def2b0cf0a825c333bed4707fa@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 14 Oct 2021 09:09:36 -0600
Message-ID: <CAPnjgZ0oZcA7WFyNmJq0Y-UjxFah5=No2vW5BN4Qxk-rOKB7yQ@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Stefan Roese <sr@denx.de>,
 Priyanka Jain <priyanka.jain@nxp.com>
Subject: Re: [Uboot-stm32] [PATCH 2/6] am33x: Remove unused define
	CONFIG_MUSB_HOST
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

On Mon, 4 Oct 2021 at 04:00, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> This define was left over from a previous revision, and was never used.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  include/configs/am335x_sl50.h | 7 -------
>  scripts/config_whitelist.txt  | 1 -

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
