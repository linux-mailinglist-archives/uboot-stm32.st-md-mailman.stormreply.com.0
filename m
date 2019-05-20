Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8185023C3B
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 17:36:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E9D5C5EC41
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 15:36:00 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98E3FC5E2DE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2019 15:35:58 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id n14so13403639otk.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2019 08:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bzgnIQHsdhfhxrUf3wt8mlxdVpYaNF/Corqc/0484YY=;
 b=XUx9m5Eh0g5bFtc81nmVXNb2x5RZuXAdpXns45+remJJ/dIRxGq121xeg8d9sTq6mE
 R1s41nuI+Md13n77/qcOm42TFWXcSm7QBOVyMGRj+3hzELfnXK/HiHkRho4ty402H0/B
 /M6MNFGi4PGhMMtNeAVs8EEEC6YiMRNfWmtdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bzgnIQHsdhfhxrUf3wt8mlxdVpYaNF/Corqc/0484YY=;
 b=ufWkySWOALmpRB+XIj5v93u6tEDyXJ1pdC2Ydtbw5cNjZf6SsJ5uoeV1FlDMfJJMvt
 aj6a8e+LJd5MUr46K0FOG+koR3Om1fzcppR9hr+/VrPhO5+OSOuHxJlUGQI211/ecKUO
 qJDqJka2yHO12KPFPc9weU+CumTpCsDF2NO3JBKD6i3NMRgbkLdylPWdUymoK8uw/RGp
 mIII9F0WW8v/D8aUQ1RLYfczOqWL0xd6/lb50h8VuzMSIm2+u1JdXfMkrTeQCtbwoJBp
 g8EFMH6YcZMJi9Wqc8G54IUz4gF26maI5dPrMsb+NblfLUE29cRtMNCQo7tTs1LRinJU
 POGg==
X-Gm-Message-State: APjAAAXqxB3PAS5pdkwiLaRwvQP2fjG4moyopfPuUx113x17yD9lMDzF
 oxnG1kus8o+/8v/mM3DUutYJOejJWxf5+vOWPdp4P6RZ
X-Google-Smtp-Source: APXvYqzW+AXb/JKehstkEGvLHmcCVHGAx+Rg50ArngNztKxVRKgGPaSOh8w3774htvH4Y2kOHjvW22HbjVS+mVIzo0M=
X-Received: by 2002:a9d:400d:: with SMTP id m13mr10205564ote.100.1558366557098; 
 Mon, 20 May 2019 08:35:57 -0700 (PDT)
MIME-Version: 1.0
References: <1558357207-7345-1-git-send-email-patrick.delaunay@st.com>
 <1558357207-7345-3-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1558357207-7345-3-git-send-email-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 20 May 2019 09:35:40 -0600
Message-ID: <CAPnjgZ27LrX1bM63mDn2z61JLp=YADx58bip2=cmvEJeWNYWxA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 2/8] fdt: Allow to use EMBEDDED device
	tree for SPL
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

On Mon, 20 May 2019 at 07:00, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> U-boot continue to use load DT from file system, this patch avoid

U-Boot

> an error when U-Boot "Error: Out of memory" when it try to map
> gd->fdt_blob (EMBEDDED pointer __dtb_dt_begin is not managed).

What is EMBEDDED? Do you mean CONFIG_OF_EMBED?

I don't think we should be using OF_EMBED for sandbox.

>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - solve issue for spl sandbox with dtb
>
>  lib/fdtdec.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
