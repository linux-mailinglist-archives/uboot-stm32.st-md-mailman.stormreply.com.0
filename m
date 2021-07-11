Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F10A3C399F
	for <lists+uboot-stm32@lfdr.de>; Sun, 11 Jul 2021 02:01:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 478C3C57B5F;
	Sun, 11 Jul 2021 00:01:22 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7AF2C57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Jul 2021 00:01:16 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id a13so18340155wrf.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Jul 2021 17:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m09omELpcuMoFpsnR6YRR1oHXvTLdcjPkrjjkQ+jYtI=;
 b=MD9FBsLmSBFb0xv7xpJvzWTjOzAJrbqW0ID36Y3VwdIe6eFbtnkylsjpLJtLSMTSMV
 7F8uOJLOtGzgzm7e9Z8Rzdn8DmskiwxrOWhb7fsT8YXKut9oqg8eUlwEg5qC88DJJRYC
 et1nX0UcFhgvpKBwj+LsWJmKkgUoiNiHkr+Y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m09omELpcuMoFpsnR6YRR1oHXvTLdcjPkrjjkQ+jYtI=;
 b=RuF9RRfcwEgnAuvOcj5TRmXUHghRpw3hs3F7O06bZ772A5TlTl6e5daGnklNCGPA3M
 TvB1IkMCa8xxdCoiSZ+AjPZxkDbE3OfKZXHAi2v1X5LDSCcQGngNrQVxTJd+mOovVSJl
 wmIlDq62tNDMku3nS4myWCHi5fgwr7LfHxZZxoijANS7bS/f+KJiWKDrREVopcC5mFnM
 2tVufJwaAFXjL+G2OYHCvvZNf2AAmQWzGZDBn51kb7bZHLLAZOV6uRIp75c8hGhe5N/0
 oZqIr5ZC/xrpepL8N41fCItGAh5amxsAUVJbH3jqgZFgqvtGTOLnm2rYzDTnaQiSnSfL
 kbqQ==
X-Gm-Message-State: AOAM530uptfd4g87ZWOU0aE9/81UgXyssUUTog3FV8erhIqYQLmrj6aR
 bifEayxaPBZslKkoTY+jGLRYvGWKt2pMnhy7vNGS2g==
X-Google-Smtp-Source: ABdhPJyuTr83ymS15Q4nRKV73sJiu6Uo9yEF+OcTchj05D5HF0xGXNzcytA+09bgN3D+ml3aoeT3WwKAV1phmkEcTGY=
X-Received: by 2002:adf:8069:: with SMTP id 96mr6188795wrk.56.1625961675937;
 Sat, 10 Jul 2021 17:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210708091747.317500-1-patrick.delaunay@foss.st.com>
In-Reply-To: <20210708091747.317500-1-patrick.delaunay@foss.st.com>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 10 Jul 2021 18:01:03 -0600
Message-ID: <CAPnjgZ3XX_Z9kyFcerS9_GvjzkKzHmdfWOjAtC16k7NN=ReR_g@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 0/5] stm32mp1: handle TF-A boot with FIP
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

On Thu, 8 Jul 2021 at 03:17, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
>
> In next TF-A version the stm32mp1 platform will support the Firmware
> Image Package (FIP) [1], a container filled with:
> - the U-Boot binary = u-boot-nodtb.bin
> - the U-Boot device tree = u-boot.dtb
> - the Secure OS (OP-TEE) or the secure monitor (SP_MIN)

That sounds like a job for FIT?

>
> Upstream is in progress on TF-A side.
>
> Each part of the FIP is loaded by TF-A BL2 and U-Boot
> is executed with its device tree address as parameter (nt_fw_dtb = r2
> introduced by commit 4ac345220afa ("board: stm32mp1: use FDT address
> provided by TF-A at boot time")
>
> This FIP container simplifies the OP-TEE management (same number of partition
> with or without OP-TEE, OP-TEE dynamically updates the U-Boot device tree
> to add the required OP-TEE nodes) and allow support of generic TF-A
> features as PKI [2].
>
> This serie allows to generate U-Boot configured for the TF-A BL2 image
> types:
> - STM32IMAGE: stm32mp15_trusted_defconfig (current behavior)
> - FIP: stm32mp15_defconfig (NEW)
>
> The FIP will be the STMicroelectronics recommended image type for
> STM32MP15x and the STM32IMAGE support should be marked deprecated in a
> future TF-A release or even removed.
>
> To prepare this migration, the serie move all the specific code or
> device tree nodes for TF-A load of STM32IMAGE under compilation
> flag CONFIG_STM32MP15x_STM32IMAGE.
>
> [1] 4.11. Firmware Image Package (FIP)
> fiphttps://trustedfirmware-a.readthedocs.io/en/latest/design/firmware-design.html
>
> [2] Authentication Framework & Chain of Trust
> https://trustedfirmware-a.readthedocs.io/en/latest/design/auth-framework.html
>
>


Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
