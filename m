Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFE5412A2C
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Sep 2021 03:11:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DAC79C5A4CD;
	Tue, 21 Sep 2021 01:11:42 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4EBD4C5A4CC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Sep 2021 01:11:41 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id 42so5263172uar.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Sep 2021 18:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iOsOmx/vmdjdCk9T7ixhQnDk28dJyA7wyH97MnhqGm0=;
 b=aGoXVeYw3GUuau34zlfXh3I6o0+LMCVu8+4eCJFDi/47BqtMXGLaRaHt0F85MBF4Bz
 40uDBbvu90O4oJnDrzdJcVwvQdLdFnR8FOM0VdFZ5f7SJQL2jNGM9/IW+Tf5b0MwGP2i
 v96qHxl4Ruxy3/TSXpxSGyWQPUqKvgmi7ZobA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iOsOmx/vmdjdCk9T7ixhQnDk28dJyA7wyH97MnhqGm0=;
 b=DK7JGGajRuy60FjiKKnEEgZqAndAWgfQd4OOommkr2ZHMEWt9zk0WpGCgdnvsakstM
 u9jw1a3Ln6Z2Mc2fxQIWpouQ9wBAjAI4ORxsYTBAyPExVxXSHRIKHisY/PzgXxrTrKDU
 JklVSWT4gQZfQf+uj+ROxigfnTGHthx4/OAc2sHvZYplxglAAGKLlyujtkD/R7ulc/aX
 7dDNt3k8fnnJmdVm9InkF4BoHNVWGAbW7EVNp2ofLvHcV53w+Qm1HGXzLh86e1JV5xAb
 2ybcD8FVmsemU453pVyy+El/gKytkJX0r07Lk3nFWm1fDn6l02b5WNfyDF49raPUVWlp
 AYOA==
X-Gm-Message-State: AOAM5327Nmn2ZXF0j3ost0QogUWG/PX/rcCDDrmM7rqzHLZxxbQyM5WD
 5Wso9mj/BRe8Vq2m+X8UfjCdtRmITahcMGetu4Fymw==
X-Google-Smtp-Source: ABdhPJxVZs3C6aF/2q4icKVT++oQU3qYPk0XV3PBKIlm2mevv864UI9PQc3XkzRrQ03pEIsBxDKmnS7LclsrhsyQMGo=
X-Received: by 2002:ab0:136c:: with SMTP id h41mr13860654uae.47.1632186699945; 
 Mon, 20 Sep 2021 18:11:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210920175831.1.I218b17a86b820ee611e9dd643c1fb40e2b480257@changeid>
In-Reply-To: <20210920175831.1.I218b17a86b820ee611e9dd643c1fb40e2b480257@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 20 Sep 2021 19:11:28 -0600
Message-ID: <CAPnjgZ2FtPkUG4XDvFH110pL9B5yPNRDgjkt=2Kr_ZP9TVWBTQ@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH] demo: migrate uclass to livetree
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

On Mon, 20 Sept 2021 at 09:58, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Use dev_ function to read the sides and colour to support a live tree.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  drivers/demo/demo-uclass.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
