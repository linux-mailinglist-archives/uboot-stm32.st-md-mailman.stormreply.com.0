Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C013624C11
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Nov 2022 21:40:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0038C6505C;
	Thu, 10 Nov 2022 20:40:46 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D745C65042
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Nov 2022 20:40:45 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id f27so8171246eje.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Nov 2022 12:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IBwRShUytm/TvGdKZHAsrMPnjaaLwdYbk9JdHeH1Qp0=;
 b=lSkuE+UrquNPHXoBC6sMl3f4wrR10zTvKxW5z1TkPzhX7Q8w8n0h47FEba9VZqOF8E
 cCh4KV2uhVcfdXW8BDruq/EWpWQ8KEFRWqwohAWescI4PNV98uYa6UD+V6tbSf9o0U/3
 /WbKzK2Zd+PvaUupH3MQJsJHBXZryRwJbU29I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IBwRShUytm/TvGdKZHAsrMPnjaaLwdYbk9JdHeH1Qp0=;
 b=ZONY4B0dWyjGJ6LEm0xWBS9AYlqsQjfqe+812Pyi3cum4xkeNA4iJzDaQUDNd4yRFb
 VMEQg39S+pIcqgsey77oW7u4SeKMvbOGo3uy4orhRKd2Zf7qgVHhQR4m18BLLd7l+8AU
 CXMebpXdvntdMxVpIkeXQr3mLq5LfRJW9lpyisAudnGDGwJ7BTgEqaXJeo/6tCkKpewm
 MO5aackDFJgLD0pk4D7tRA2HiEoFM2gzgSAzIvdAUe+Rcw4HSe37lObEhVhHMbEGmii2
 su97fFPrOyV5rVtz9RL8nW1tz6MxTNRRN1Cn6rSsplyCvhAlQWO/Clse+fGbuEbG3C3R
 dHow==
X-Gm-Message-State: ACrzQf0jXyGXPK5jZuztcDRh3US9iSVUMK5oeuadbNHL9/UKtm5vAYvv
 erYnUMrYhdSPK6yYd9pDPkxH+KhoXC45NxVxxnPvMA==
X-Google-Smtp-Source: AMsMyM5pev4YEfSo9QhbTnzznWSNlQCg2T0z5rIKeVlDgfO58aecUXK5u92EeqErIRW81o+sFBhIKdAc9NVZKRY9A4k=
X-Received: by 2002:a17:906:168a:b0:7aa:97c7:2c04 with SMTP id
 s10-20020a170906168a00b007aa97c72c04mr3889712ejd.191.1668112844254; Thu, 10
 Nov 2022 12:40:44 -0800 (PST)
MIME-Version: 1.0
References: <20221110104905.3076915-1-patrick.delaunay@foss.st.com>
In-Reply-To: <20221110104905.3076915-1-patrick.delaunay@foss.st.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 10 Nov 2022 13:40:32 -0700
Message-ID: <CAPnjgZ2TKaQZJk4bGnLVZ9uqFLEfMQt+qm=q5FBn-sJKhaOKPw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Peng Fan <peng.fan@nxp.com>, Wolfgang Denk <wd@denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 0/8] env: mmc: improvements and corrections
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

On Thu, 10 Nov 2022 at 03:49, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
>
> Update in U-Boot env mmc backend with several cosmetic changes or
> corrections and 2 new features:
>
> 1/ CONFIG_ENV_MMC_USE_DT = no more use CONFIG_ENV_OFFSET
>    in the mmc ENV backend when this config is activated.
>
>    Requested by the STM32MP STMicroelectronics boards which activate
>    several ENV_IS_IN_XXX; the value of CONFIG_ENV_OFFSET is invalid for
>    SD-Card / eMMC boot; this offset should only used in SPIFlash backend
>    (sf.c) for SPI-NOR boot.
>
>    If this offset is used on mmc backend, when partition name in GPT is
>    not aligned with  U-Boot DT: "u-boot,mmc-env-partition", the behavior
>    is difficult to debug: a partition is corrupted on 'env save' command.
>
> 2/ selects the GPT env partition by the "u-boot-env" type GUID introduced
>    by the commit c0364ce1c695 ("doc/README.gpt: define partition
>    type GUID for U-Boot environment")
>
>    This feature can also avoid issue when 'u-boot-env' partition name
>    change in GPT partitioning but not in the U-Boot DT with
>    "u-boot,mmc-env-partition"
>
> Few check patch warnings remained in the series,
> but after check I can't remove them :
>
> - IS_ENABLED(ENV_MMC_HWPART_REDUND) is normally used as
>   IS_ENABLED(CONFIG_ENV_MMC_HWPART_REDUND)
>   => ENV_MMC_HWPART_REDUND is locally defined in this file it is not
>      a real CONFIG but I can use the IS_ENABLED() macro as it is defined
>      to 1
>
> - Use 'if (IS_ENABLED(CONFIG...))' instead of '#if or #ifdef' where
>   possible
>   + CONFIG_PARTITION_TYPE_GUID => info.type_guid existence
>   + CONFIG_ENV_OFFSET_REDUND and CONFIG_ENV_MMC_USE_DT => only for define
>
> As I miss the merge window, not targeted for v2023.01 but for next
> v2023.04.

Shouldn't this all move to device tree? Using CONFIG options is such a
mess. We have the devices in DT so can indicate which ones have an
environment and what the parameters are for each.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
