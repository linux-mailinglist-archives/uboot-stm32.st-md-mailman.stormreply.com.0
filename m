Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C64042DD9B
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 Oct 2021 17:09:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 208A9C5C834;
	Thu, 14 Oct 2021 15:09:53 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59687C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Oct 2021 15:09:50 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id e10so7316622uab.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Oct 2021 08:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dmcKjDmGHfnxdR1OrXzoNXAYHrkWzLxUjzJeld1prRU=;
 b=I8wCXDe1zJYWlh5vKEKIEhZPz1mPIPTcP4nLO7egCKmukwdjMWsY6lpSTUK+ZO1v/F
 unMan49wMHcQSvPHgZHMYCqO1Sw/j4Gh9sweiIPMbqT9Ug3P3ZJxixMrDSKeI1CIS8yc
 Kuap5WGx7uWV0BUTguoAm6jd5NrVaVSoiR3BQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dmcKjDmGHfnxdR1OrXzoNXAYHrkWzLxUjzJeld1prRU=;
 b=jYn9Om96QXtvBc09bRzwiyShqgT7Z/vHD/uCVdOXR4OMUCRQM33LJ8EPBbHCcCBMf4
 17MhkkC0nWS7zyVYa4Ggutz1TC3BBjiui6MiyHPvyyp/BsspP8qtLk/dX2gjT+qNvgOx
 vHpxbS7UDHKfZeFMnzeNbWv8lPDig8eHqIfuU6ZbjaheEE0fx2vhz+fJI465tzT3rYne
 fxmAT/uKk9fwMGSbS1f4hhVdHZg4fH3Zu3CE5V+anp1d/vouiYQh44ktjGQGdA7J9bIK
 GL0DT1LlqWB6iXxrVFF/KkKRvpuzNi/5bSb2mFF/h/k+Or8LCbCDOR/o+PGgvx03xckp
 Zfjw==
X-Gm-Message-State: AOAM532+FxJhP7E4rlhlgJxZQHuA0vBBxRir+VJp5G4txHdmJC1ZsuwL
 8a4EDZg0prxlITRa6DuLQX1wsnzAzn75tJ2nDOcTNQ==
X-Google-Smtp-Source: ABdhPJwYP+6cM8MMDuPpN0jG3naqQmxukLm5LFF1GWvkGGYmG9vBtd8VNevPi86y6RwgEps2PozYL0sJj7TQvOCwmX0=
X-Received: by 2002:a67:d498:: with SMTP id g24mr7614706vsj.15.1634224189094; 
 Thu, 14 Oct 2021 08:09:49 -0700 (PDT)
MIME-Version: 1.0
References: <20211004115942.1.Ic01b4a3063c0b09cac503a4dc8356f5ff64b5c6e@changeid>
In-Reply-To: <20211004115942.1.Ic01b4a3063c0b09cac503a4dc8356f5ff64b5c6e@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 14 Oct 2021 09:09:35 -0600
Message-ID: <CAPnjgZ1y3rWe6aR9iq42qNFrLBc8xOXNjWOa9yPODsCQs+Dj-w@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Heiko Schocher <hs@denx.de>, Priyanka Jain <priyanka.jain@nxp.com>,
 Rick Chen <rick@andestech.com>, Sean Anderson <seanga2@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/6] scripts: remove some configs in
	config_whitelist.txt
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

On Mon, 4 Oct 2021 at 04:00, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Remove some config finishing by _ badly added by
> scripts/build-whitelist.sh when joker is used in comments.
>
> for example:
>   doc/uImage.FIT/command_syntax_extensions.txt:
>      ... #ifdef CONFIG_OF_*  |  ...
>
>   cmd/nvedit.c:# error Define one of CONFIG_ENV_IS_IN_{EEPROM| \
>      FLASH|MMC|FAT|EXT4|\
>
> Remove also configs only used in comments:
> - CONFIG_BOOGER in include/linux/kconfig.h
> - CONFIG_COMMANDS
> - CONFIG_INIT_IGNORE_ERROR
> - CONFIG_REG_*
> - CONFIG_HOTPLUG : drivers/watchdog/omap_wdt.c:18
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  arch/arm/include/asm/arch-omap5/dra7xx_iodelay.h |  8 ++++----
>  include/configs/M5235EVB.h                       |  2 +-
>  include/configs/dra7xx_evm.h                     |  1 -
>  scripts/config_whitelist.txt                     | 14 --------------
>  4 files changed, 5 insertions(+), 20 deletions(-)
>

Reviewed-by: Simon Glass <sjg@chromium.org>
Tested on: sandbox
Tested-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
