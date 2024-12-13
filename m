Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAD59F0F1E
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Dec 2024 15:31:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C033C78015;
	Fri, 13 Dec 2024 14:31:22 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E4D5C57194
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2024 14:31:15 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5d3e6274015so3114821a12.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2024 06:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734100275; x=1734705075;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a8OdqOVUrnRO0M+eyymuEifvO/5SwQPJmPjaXRkypDM=;
 b=VhXnvqkMCQSC/GuxU9okFMPZmXqtrkRLIFobv3lKGVvj6jKK7ayWWkYX9QIaSB6QC4
 8ny23MCTOLhso9G958Iqc+VC0uJCBzP1l2742Y1j/8zqRsdc/QET7hoNQGB6ePyCIWo7
 pW50vXZpU4lsm2s5W/HEgWrW0jmoOH+pINKtttMuGnoObjNyhXvdGbGwitMBBc+/Rkat
 OM5Vou7nr1iIHsBJHhdHRtlMRdEtnvGTxpE33ztne4/q+FeprLGJUUgt3MXWkxczKzHM
 5UkYemL1XJ/DuEZNM3pOP3LLYaU/dtoKbok5CV0JdJwRnJ3mlO6/HWuFYQMyvKb2WXyr
 aY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734100275; x=1734705075;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a8OdqOVUrnRO0M+eyymuEifvO/5SwQPJmPjaXRkypDM=;
 b=iEA4ty5Ce56h0+F1qGQ9HcM/Vi+wg9Ui16SCPNSnn72MYCVOlSncW6XoUrhJFaAfEN
 nR6GLE9UaD35ZVopAxqeYOQykoLDmTdoD9coV1WdBaWAfgNqifdrXU0iBAhCjoHzYzm/
 IRd5SZVfbmXOC6vf/WPpKpkwylXcvRKQmLat+nlNgGq3PVeKgYLnl9e2zV7T7ckkTyeH
 iWpJVK7w0R2W1Om229MM8E/f+pfxC0ZGCm5lHSebr+YyVayr8FV34ETJT758wM9fdgi4
 PH+GHMiXVEDv3bHWo6v6fHdHzkrm4h2j95LisOm9zKjv+OIP09zYn1zNdEZoSWWf3wl6
 Zlxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/IrBXzMn9OMwgNhHqg/+NXO/sbSPKjA9xRP/QgygZvfV4ZozEPPnFN5CvjTErGEOdhVB7dpfypE1H9g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YymOy8C2jDZz1dxpdXF98vBQr3bMKLuW/LGVoah6kBHvgsEmLI6
 bAyT9r7D7xs+YCaHWZi12gXvt4p1hffCQ9zlLQCkYNY8RjyjZ4kcp0hbOLV14yw8PriOEj8/SKG
 NypZ9uyfPq2pY72h5QjdlckJm/goueikEvN2jNg==
X-Gm-Gg: ASbGncvmzGsRzbBDahgbFOzxwN4NuBvT/0EK1TJOSDiuqB3KIBmFkxX+mDMo3eF1J5t
 1j2JnMp8PWw2P7IdWu4YfaRFtvfDb9+Kp0KSNbQ==
X-Google-Smtp-Source: AGHT+IHRl4htuJVgS14ECqteZzX4zrvmCBcnQL53L6rijF7j34vQQ5UqCttuRTtHP3sJ5ToyOMe9qByAWYt8jcRFkcI=
X-Received: by 2002:a05:6402:40d4:b0:5d0:ed71:3ce4 with SMTP id
 4fb4d7f45d1cf-5d63c2e9060mr2404326a12.6.1734100274596; Fri, 13 Dec 2024
 06:31:14 -0800 (PST)
MIME-Version: 1.0
References: <20241213132655.670837-1-patrice.chotard@foss.st.com>
In-Reply-To: <20241213132655.670837-1-patrice.chotard@foss.st.com>
From: Sughosh Ganu <sughosh.ganu@linaro.org>
Date: Fri, 13 Dec 2024 20:01:03 +0530
Message-ID: <CADg8p977UDbohn7M7UdfMbq8qB7qEc1NzvFxDnYV9krdaJpuiA@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>, Igor Opaniuk <igor.opaniuk@foundries.io>,
 Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32mp: Fix dram_bank_mmu_setup()
 for LMB located above ram_top
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

On Fri, 13 Dec 2024 at 18:59, Patrice Chotard
<patrice.chotard@foss.st.com> wrote:
>
> Previously, all LMB marked with LMB_NOMAP (above and below ram_top)
> are considered as invalid entry in TLB.
>
> Since commit 1a48b0be93d4 ("lmb: prohibit allocations above ram_top
>  even from same bank") all LMB located above ram_top are now marked
> LMB_NOOVERWRITE and no more LMB_MAP.
>
> This area above ram_top is reserved for OPTEE and must not be cacheable,
> otherwise this leads to a Panic on some boards (Issue on STM32MP135F-DK).
>
> Restore previous behavior by marking invalid entry all TLB above ram_top.
>
> Fixes: 1a48b0be93d4 ("lmb: prohibit allocations above ram_top even from same bank")
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> cc: Sughosh Ganu <sughosh.ganu@linaro.org>
> ---

Acked-by: Sughosh Ganu <sughosh.ganu@linaro.org>

-sughosh

>
>  arch/arm/mach-stm32mp/stm32mp1/cpu.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-stm32mp/stm32mp1/cpu.c b/arch/arm/mach-stm32mp/stm32mp1/cpu.c
> index 62cc98910a7..cb1b84c9af9 100644
> --- a/arch/arm/mach-stm32mp/stm32mp1/cpu.c
> +++ b/arch/arm/mach-stm32mp/stm32mp1/cpu.c
> @@ -53,6 +53,7 @@ void dram_bank_mmu_setup(int bank)
>         struct bd_info *bd = gd->bd;
>         int     i;
>         phys_addr_t start;
> +       phys_addr_t addr;
>         phys_size_t size;
>         bool use_lmb = false;
>         enum dcache_option option;
> @@ -77,8 +78,12 @@ void dram_bank_mmu_setup(int bank)
>         for (i = start >> MMU_SECTION_SHIFT;
>              i < (start >> MMU_SECTION_SHIFT) + (size >> MMU_SECTION_SHIFT);
>              i++) {
> +               addr = i << MMU_SECTION_SHIFT;
>                 option = DCACHE_DEFAULT_OPTION;
> -               if (use_lmb && lmb_is_reserved_flags(i << MMU_SECTION_SHIFT, LMB_NOMAP))
> +               if (use_lmb &&
> +                   (lmb_is_reserved_flags(i << MMU_SECTION_SHIFT, LMB_NOMAP) ||
> +                   addr >= gd->ram_top)
> +                  )
>                         option = 0; /* INVALID ENTRY in TLB */
>                 set_section_dcache(i, option);
>         }
> --
> 2.25.1
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
