Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD64136EDE1
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Apr 2021 18:10:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C98FC58D59;
	Thu, 29 Apr 2021 16:10:18 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78CC5C57B74
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 16:10:17 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id k14so17560623wrv.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 09:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q36n4yyekEPRyLm/fbHQcVIfPGAYRHw3JafADpBP2JE=;
 b=XgAw/C2cDkjUGxvocgs48iTrsqGDfIQdWOLPVQH0kItjjni3l0EPYoFHYmEsSpptTq
 q+KSimFKNFW3viRYHClb+PdIe4wabSUj9vy/64NfX5/xLFrkrU4aadfnN7brTpRvlyy7
 IE4R4hLPhWisujnLFZki5UEqTWaZdEH4fhzEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q36n4yyekEPRyLm/fbHQcVIfPGAYRHw3JafADpBP2JE=;
 b=pO+mcKucd87gkKDA3Y/REgtwtt+x3qso8ZGpVWRS/P+nY6AcasAFBMxzK/MhNlLhl4
 Q/LhYKaFVakI1S5D2ETcJzyeeBoZ/2ElNLDvyBrCKZB5U9SvD0ao4Zcr9BBv6xESMiah
 wulHMZLDBaUg96xM/O8Y3IGCGMEV0/P52dHdohwTyrbq72+iRXDfp7aCVv8pXjSW1T93
 ct1+/QhNiHa0zByDW9cuvR8p+BcmJCIbmxZrtNtgZfsOiYETf8ovd3vkm6No6rB+JrAG
 OlE3ST8SqPcJnRHdOZHr1uFjkiRX1C7Z7NLzrlEVVMd+WoQctuvbqrzzmfunJvqnoIOo
 KffA==
X-Gm-Message-State: AOAM531HhvrRBRxffq0Cafuvg4i716o7Ibnyl7cWIFly4XOeYkuWiB2u
 qmw10BwDpYYbvuqpdVeo1b9VDAbKaWteJEmNTsBsxg==
X-Google-Smtp-Source: ABdhPJy4pScX+jhZOB2zlmhf+ijlFnsHZ2GV/2AAohDuM60U9907yj5P8fpKTy0Rk3pVLQSrg5RFdSfHJtpv0yQTfdM=
X-Received: by 2002:a5d:6d41:: with SMTP id k1mr699751wri.66.1619712616814;
 Thu, 29 Apr 2021 09:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210419094534.9748-1-patrice.chotard@foss.st.com>
 <20210419094534.9748-5-patrice.chotard@foss.st.com>
In-Reply-To: <20210419094534.9748-5-patrice.chotard@foss.st.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 29 Apr 2021 09:10:03 -0700
Message-ID: <CAPnjgZ2wJdJH1-bKr13MvHswbeBuE7a0yRq7g5knNKFc02hHTg@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: [Uboot-stm32] [PATCH v2 4/5] configs: sandbox: add USB_ETHER
 and GADGET_DOWNLOAD gadget support
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

On Mon, 19 Apr 2021 at 02:49, Patrice Chotard
<patrice.chotard@foss.st.com> wrote:
>

> This is needed for new gadget binding test.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Herbert Poetzl <herbert@13thfloor.at>
> ---
>
> (no changes since v1)
>
>  configs/sandbox_defconfig | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
