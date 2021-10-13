Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4752942C70B
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 Oct 2021 18:58:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02CDEC5C834;
	Wed, 13 Oct 2021 16:58:50 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 135FFC5C831
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Oct 2021 16:58:47 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id i15so5981741uap.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Oct 2021 09:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8Zv4xLIGOc4/nly6myS5sswINQEwDw3iDu3NlQapiuo=;
 b=Mq5lkIH3zAgAPbPRYotILo0xvywj67nmv89dsprWeN8iPdPd1RlzPPLuZsZN8M2r4L
 qT8Sc/Bey4U331A1Gtdyo4u62jYkSTYiXCOutMozz5Vcsqhn8gJunbOYUn450l6DTecF
 alTlitvuGHhmPIqFCcO7NgqYZaGTKdn7i1xLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Zv4xLIGOc4/nly6myS5sswINQEwDw3iDu3NlQapiuo=;
 b=r4ZROmnxDHOmig6WMRHzk+MTN4lxTVjXXl9wYQXSvsmj2W3+9kOndlNHcxCd/Kz5H1
 0rS08ysom4nLLWfREhlLN/7FaSBRf+MJ7C8u2fsQ+vRvSayTtxCI2+jjwVahv+ccKZow
 xWFblVioXzzC7Y2F4ffXxuPvmRCsK7q3AcxyjOFswDgJBOY/OPvgTYwLi1MXO3xOBeUd
 uxXxNazgux+1QWHWOykHPrfH4nG2H1YK4CNRA07rcG1cvXoujIvjB0i1kJL7AoC/fbEM
 CCi1Qhav3oVoatKwPn0u8lAK8Ot3w6dqzivT3hLRvXA/EqFl6a3+Zy9uZ860qIhUQtKw
 qpXA==
X-Gm-Message-State: AOAM530MvOamSzBs2MU724CL8hPsPGIRcdttcGyAP34ou7iA6bdAR+Lf
 Fs7i2PEOiF3Z7HvxVclWuz+dZYQFMbPCLwEC0oSUww==
X-Google-Smtp-Source: ABdhPJyubL1Rj3I+KhuTYX91kKChr2zKB8AR5Rq4QvutdfzQiPhweARUS/c5VgQF5Gr2xGKPSw5acGQMBqDiSPXDbbI=
X-Received: by 2002:a67:d498:: with SMTP id g24mr610171vsj.15.1634144326632;
 Wed, 13 Oct 2021 09:58:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211013151014.v2.1.I558b557c1bc3ca451e11dae245417c8bfecf33ad@changeid>
In-Reply-To: <20211013151014.v2.1.I558b557c1bc3ca451e11dae245417c8bfecf33ad@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 13 Oct 2021 10:58:35 -0600
Message-ID: <CAPnjgZ3ZVc94z6zgHwRU-iGcn40ibO__EiXPjDbzO2i8rHoT-w@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Marek Vasut <marex@denx.de>,
 Jean-Philippe ROMAIN <jean-philippe.romain@st.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, Rick Chen <rick@andestech.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>, Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH v2] stm32mp: add binman support for
	STM32MP15x
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

On Wed, 13 Oct 2021 at 07:11, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Use binman to add the stm32image header on SPL binary for basic boot
> or on U-Boot binary when it is required, i.e. for TF-A boot without FIP
> support, when CONFIG_STM32MP15x_STM32IMAGE is activated.
>
> The "binman" tool is the recommended tool for specific image generation.
> This patch allows to suppress the config.mk file and it is a preliminary
> step to manage FIT generation with binman.
>
> The init_r parsing of U-Boot device tree to search the binman
> information is not required for STM32MP15, so the binman library
> can be removed in U-Boot (CONFIG_BINMAN_FDT is deactivated).
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
> Changes in v2:
> - deactivate CONFIG_BINMAN_FDT
>
>  arch/arm/dts/stm32mp15-u-boot.dtsi            | 29 +++++++++++++++++++
>  arch/arm/mach-stm32mp/Kconfig                 |  1 +
>  arch/arm/mach-stm32mp/config.mk               | 29 -------------------
>  ...stm32mp15-icore-stm32mp1-ctouch2_defconfig |  1 +
>  ...tm32mp15-icore-stm32mp1-edimm2.2_defconfig |  1 +
>  ...-microgea-stm32mp1-microdev2-of7_defconfig |  1 +
>  ...mp15-microgea-stm32mp1-microdev2_defconfig |  1 +
>  configs/stm32mp15_basic_defconfig             |  1 +
>  configs/stm32mp15_defconfig                   |  1 +
>  configs/stm32mp15_dhcom_basic_defconfig       |  1 +
>  configs/stm32mp15_dhcor_basic_defconfig       |  1 +
>  configs/stm32mp15_trusted_defconfig           |  1 +
>  12 files changed, 39 insertions(+), 29 deletions(-)
>  delete mode 100644 arch/arm/mach-stm32mp/config.mk

Reviewed-by: Simon Glass <sjg@chromium.org>

Suggest lower-case hex for the addresses though.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
