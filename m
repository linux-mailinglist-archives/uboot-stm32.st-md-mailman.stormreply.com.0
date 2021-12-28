Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FDA48076D
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Dec 2021 09:34:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DD45C5F1EF;
	Tue, 28 Dec 2021 08:34:03 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A99ADC57183
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Dec 2021 08:34:01 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 r18-20020a4a7252000000b002c5f52d1834so5858471ooe.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Dec 2021 00:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hDbAMNoeqjBet/SA/4KS5wk/RIPtKXJw8cMS/PBZ2+M=;
 b=RbnZQkNgxOv7qGmz8UTLN6wwqYAGVzQvY+3DHNC9TmMIPhrYgjlV8IwNshNm+kR0NT
 zB9n/vgPmOn7j3k5AIGqS75xQMITMrZuCFhhOKs/A/6bTpr8E3jzJYBuLm+47A4KWuEt
 YSr9sgizYhndFXsNjf/BB2PiyLJbNX/IZSG8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hDbAMNoeqjBet/SA/4KS5wk/RIPtKXJw8cMS/PBZ2+M=;
 b=w7zch0uduj5/CE6NzZrk2j4NxqozKDNgny75J/a1SW4HTfMlKqRFRoEB2w+wuJF1PU
 zhrPXRR4Z//JD8iRQOUp4WZ8fnX+DzXl9gJC46gyV9tfH8K0Cf3cHdb3PDb2I4ENL1Vx
 yEi84MX/KVW/i0RWOGNGtXCipWrpd0H90p9WxosXUa0l5wYbEWaF5VC5h38IZX2BB3O7
 zGe0+1r/Ud/cu0hSmb/APnQHbVED0+pnjmwWQzSSpFl+h5VU0uPBdfcVOYwXVbQbVQcz
 f2IkXNJjnM/Z2I6hqZzjgagv1XDKKYo98aQTKG3LXYCyICzoy+PG+iThqj7uyJL7zcnc
 f8Pg==
X-Gm-Message-State: AOAM532+ygb2anOJEEW5nSygEld3cHAkLmFswhcz8YMG1LncdC+YUs/Z
 Eabyl0S0azrPs9fXCc8yWMDvKCWBN8SPOjxI2ndCBg==
X-Google-Smtp-Source: ABdhPJzdM8vKlSZCp7P1xBK3x7ZisZmxvAy+0EM2GFWK6DSUGjIMNwIN7K+sFvZaJW9uADVaqpQI+caN26rY8H8FS1U=
X-Received: by 2002:a4a:49d6:: with SMTP id z205mr12818157ooa.13.1640680440391; 
 Tue, 28 Dec 2021 00:34:00 -0800 (PST)
MIME-Version: 1.0
References: <20211214165704.479015-1-patrick.delaunay@foss.st.com>
 <20211214175652.RFC.5.I5fc8065d06afb12c358588f9078ba15b1cbbe94c@changeid>
In-Reply-To: <20211214175652.RFC.5.I5fc8065d06afb12c358588f9078ba15b1cbbe94c@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 28 Dec 2021 01:32:59 -0700
Message-ID: <CAPnjgZ3hrh4S7XC3xKEHaCmC67-FZe9BwP7H0M80Zqz+S+pPug@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, Priyanka Jain <priyanka.jain@nxp.com>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
 U-Boot Mailing List <u-boot@lists.denx.de>, egnite GmbH <info@egnite.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, Stefan Roese <sr@denx.de>
Subject: Re: [Uboot-stm32] [RFC PATCH 5/5] Convert CONFIG_AT91_EFLASH to
	Kconfig
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

On Tue, 14 Dec 2021 at 09:57, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> This converts the following to Kconfig:
>    CONFIG_AT91_EFLASH
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  arch/arm/mach-at91/Kconfig   | 8 ++++++++
>  configs/ethernut5_defconfig  | 2 +-
>  include/configs/ethernut5.h  | 1 -
>  scripts/config_whitelist.txt | 1 -
>  4 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
> index 4448ca1592..5267a7d15d 100644
> --- a/arch/arm/mach-at91/Kconfig
> +++ b/arch/arm/mach-at91/Kconfig
> @@ -302,6 +302,14 @@ config ATMEL_SFR
>  config SYS_SOC
>         default "at91"
>
> +config AT91_EFLASH
> +       bool "Support AT91 flash driver"
> +       depends on AT91SAM9XE
> +       select USE_SYS_MAX_FLASH_BANKS
> +       help
> +         Enable the driver for the enhanced embedded flash in the Atmel
> +         AT91SAM9XE devices.

Reviewed-by: Simon Glass <sjg@chromium.org>

Please describe what it actually means. Enhanced in what way?

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
