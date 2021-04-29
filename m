Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FA436EDE7
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Apr 2021 18:11:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FF3DC58D5A;
	Thu, 29 Apr 2021 16:11:10 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1D42C58D59
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 16:11:08 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 z25-20020a9d65d90000b02902a560806ca7so3129543oth.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 09:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NowQBCgSgjllpf604G6oySaLFOWuX9lySkn6y32FY6w=;
 b=LmtQb3rQAOFp2OgL7fTSev8HTLMgdRZlR9yBNP+GJV4F3GWZZe9hzdaLByI9o6JMr6
 IieGyEZqedRekZahj/0DGuYxurY1fZ/736wpa9jgZHDqI37CYi2tAzLFT9F1XeWDwPUP
 WwikHdhWFDjnSCAKysHPfIolCvU66l9avAYnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NowQBCgSgjllpf604G6oySaLFOWuX9lySkn6y32FY6w=;
 b=owNI0hhulYW7GB0TUaXXvyA8/CPPIdJorPNvpN4vmGoxg6C3ABG5EgZ65psPQiy7i6
 +pTq2dveE8v0B6zB+vWltAmOc3fRBAirAcAJ1kjknhEkxks8M/vnGCh/eGTjGTXzRiuw
 b7hZGwdBHhjajJJvxKtr/Y94pC9MpvHeAg5X2XpulW1f1Uic3Z7FlFU8ML5C2vnlNYAJ
 A7rcP4n99gyBoYJKp+pBH0vQZYbEcgkSz51e6yJ5h/YLzzYkYm/ubb/zUVN/UK4TGIPc
 pDfejo0deUb1/isIwe8BHQX8mNKOOW/jbL6mFp4eSJM6PM739lWNGsdgTWT935xC+mzW
 JlqA==
X-Gm-Message-State: AOAM533f580JYyojkQQ25lx75FfwW8JJi/DgtUFbKNMkN+yKN3KPPm/e
 ENMLaSaJx3cv7ENf9jLd2nQfqBz07OAjNkvTw8tLlQ==
X-Google-Smtp-Source: ABdhPJxxdADivfekU+GFjnXLMQjd9zXCtd3rMjG9nfz3JMlOCQyMn8EX6I/0rwV5LjCCRqbgF5wFnruwOEBxhVBzfwM=
X-Received: by 2002:a9d:7401:: with SMTP id n1mr158554otk.28.1619712667315;
 Thu, 29 Apr 2021 09:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210428102345.3192-1-patrick.delaunay@foss.st.com>
 <20210428122109.v3.5.Id906966934e591cb691481197488ae2cfa31ffa1@changeid>
In-Reply-To: <20210428122109.v3.5.Id906966934e591cb691481197488ae2cfa31ffa1@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 29 Apr 2021 09:10:51 -0700
Message-ID: <CAPnjgZ2KvAKjxK=2N36G5TM3L1GuF1aK0Ftj=jgjjg=Y+WWYFw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, chenshuo <chenshuo@eswin.com>,
 =?UTF-8?B?RnLDqWTDqXJpYyBEYW5pcw==?= <frederic.danis@collabora.com>,
 Ard Biesheuvel <ardb@kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>,
 Wasim Khan <wasim.khan@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Bykowski <marek.bykowski@gmail.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v3 5/7] image-fdt: save no-map parameter
	of reserve-memory
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

Hi Patrick,

On Wed, 28 Apr 2021 at 03:23, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Save the no-map information present in 'reserved-memory' node to allow
> correct handling when the MMU is configured in board to avoid
> speculative access.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
> (no changes since v1)
>
>  common/image-fdt.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)

Where is no-map documented?

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
