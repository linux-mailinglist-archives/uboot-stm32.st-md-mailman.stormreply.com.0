Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA86995D7A
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Oct 2024 03:55:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6088C7128A;
	Wed,  9 Oct 2024 01:55:54 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E24CFC6C841
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Oct 2024 01:55:46 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-7cd8803fe0aso4309577a12.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Oct 2024 18:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1728438945; x=1729043745;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VLaTh7jOM3JKspE7a/n+hb/l5+aep67p/dSLDIsP70s=;
 b=oRNfPtZq8yvMwG3eQ2GGgW/x/i7NcynMp933oWOawWldKleRtEW1NDJWYoRUteLrc8
 lk++s+72juFCDkVVI+wIPnsc9cq4f24Ljt7QNSK5u9yqGH0v2uQH3K9eFkFfXh8V8Isa
 FNeLoI0Tgo6vggLMZhABfr4JiwJrjkBzV5pvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728438945; x=1729043745;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VLaTh7jOM3JKspE7a/n+hb/l5+aep67p/dSLDIsP70s=;
 b=dwkJ9oncNCNpPnBt/zQn3ELXepAlBIZeLZ1pG4dONM+iJDl1setC9b1zPbTewIUzVr
 S4TM8EXAmxBuPnhQ7AxFLVRQVcHehu4fCnmILFqgVvMRfKouk2aqIdPHp9SRgUMkX+r1
 YCk8yHdGw2qzlEw+XoNk+aJv1VM7raOcuo+zG/HRXpmHPUvSvXdsAVifilob0Xog26mk
 eg9QhD3tlS0LGdd0uDGZUKF54n8qZkb+rk7xrng+IKU8oo59cvsloR1sjo0O0jhKISnF
 rWsyHzw9ve6xquHvrQWSP2JmeHmsMTn4qrlRCP34gG38NdZxUvgs+1ltF1HSvwp5vVCQ
 ACsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX21O8QAh7FuXuVSRBrzwMBsBr9Bzm67A2tl6qFPyPRzLn30pP39E8Nqq7lom7dZ+5MPTRkMDzWVc7JIQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx4toSgG8K5+Y6b++nolManSIkObP51TDqoqz6FXoGF47S+vjjd
 UKioBodZ0+F5Qypa2s+pXxdHnTQ1qJvDmJwk4Pi3LsqnLhnZNMiJ0WHW0p48uf3TtJSVWQ+e/Ox
 8Nx/NKA8PiAiwz1ka63/xmWnzQtdTo3e85EeY
X-Google-Smtp-Source: AGHT+IF9v4wyLC0oR8kHSj1/XkUmrRscuY0qsSDxacPez23tdgPqMdYT5BiVV4SyLIN2U0y3KCKLlzWSe69lMsGuWFQ=
X-Received: by 2002:a05:6a20:d046:b0:1cf:e5e4:d225 with SMTP id
 adf61e73a8af0-1d8a3c3b55bmr1156253637.37.1728438945554; Tue, 08 Oct 2024
 18:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <20241004225916.361000-1-marex@denx.de>
 <20241004225916.361000-3-marex@denx.de>
In-Reply-To: <20241004225916.361000-3-marex@denx.de>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 8 Oct 2024 19:55:29 -0600
Message-ID: <CAFLszTgyKe1penWB-TYm8y73=OWw6BuZdxJ4maRobgz37EF=3g@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com,
 Sean Anderson <seanga2@gmail.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] ARM: dts: stm32: Generate u-boot.itb
 using binman on DH STM32 DHSOM
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

On Fri, 4 Oct 2024 at 16:59, Marek Vasut <marex@denx.de> wrote:
>
> Describe the u-boot.its generation in stm32mp15xx-dhsom-u-boot.dtsi
> binman {} DT node as a replacement for current CONFIG_SPL_FIT_SOURCE
> use, dispose of both u-boot-dhcom.its and u-boot-dhcor.its.
>
> Use fdt-SEQ/config-SEQ to generate a list of fdt-N fitImage images {} and
> matching configuration {} node entries. The configuration node entry names
> no longer encode _somrevN_boardrevN suffix, which was never really used, so
> drop this functionality by default. Rework board_fit_config_name_match() to
> match on the new configuration node entry names.
>
> Users who do need the match on _somrevN_boardrevN can either replace the
> fdt-SEQ/config-SEQ with fixed fdt-N/config-N nodes which each encode the
> matching 'description = "NAME_somrevN_boardrevN"' to restore the old
> behavior verbatim, or better use SPL DT overlays for U-Boot control DT
> the same way e.g. i.MX8MP DHCOM does to support multiple SoM and board
> variants.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Sean Anderson <seanga2@gmail.com>
> Cc: Simon Glass <sjg@chromium.org>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi    |  1 +
>  arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi    |  1 +
>  arch/arm/dts/stm32mp15xx-dhsom-u-boot.dtsi    | 53 +++++++++++
>  board/dhelectronics/dh_stm32mp1/board.c       | 19 +++-
>  .../dh_stm32mp1/u-boot-dhcom.its              | 91 -------------------
>  .../dh_stm32mp1/u-boot-dhcor.its              | 70 --------------
>  configs/stm32mp15_dhcom_basic_defconfig       |  2 -
>  configs/stm32mp15_dhcor_basic_defconfig       |  2 -
>  8 files changed, 70 insertions(+), 169 deletions(-)
>  create mode 100644 arch/arm/dts/stm32mp15xx-dhsom-u-boot.dtsi
>  delete mode 100644 board/dhelectronics/dh_stm32mp1/u-boot-dhcom.its
>  delete mode 100644 board/dhelectronics/dh_stm32mp1/u-boot-dhcor.its

For the use of Binman:

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
