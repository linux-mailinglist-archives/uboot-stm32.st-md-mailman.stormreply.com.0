Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E60BE282EAA
	for <lists+uboot-stm32@lfdr.de>; Mon,  5 Oct 2020 03:42:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E04FC32EA6;
	Mon,  5 Oct 2020 01:42:19 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37391C32EA4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Oct 2020 01:42:16 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id u17so1140341oie.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 04 Oct 2020 18:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LpDoKDtg3kits1TyOZocmu07sgrSq7b4Tr/S1rNAHZQ=;
 b=GY5DPEHhNTF2JkPyAlW5GDgBaLCLmbQzFjaowr/OF2GO52YADLTb+CDqERIteJ2oRd
 xdiUBS2WQ397rxt7fssp3mkiSinTuOrAyGvYqObmrLnCcWZcp4sor1VyFOuTYC1h+OTn
 jVKrJZDGXoZXND+b50wdM6Af0/Wuwbnu805sU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LpDoKDtg3kits1TyOZocmu07sgrSq7b4Tr/S1rNAHZQ=;
 b=Pqy+YNV1WRu4XEC8yUJoxBaJauoRrTn9xS6lK9BCrtv+ZuoFyGyJvd7lZ3xshLGR1m
 bmejGX7eE50JxKPthS3fgkLw7RUGfJD+wPn2Tp4y1dJ5iwu+SAXO5LMwMCzYRjfA1ysu
 7G/KyrbQ2QZSp/ppjnLWT2YIpxlj+eIPkjkRlIvfVoGD2Lscd3i37rYdRznVqLXxV59c
 zmI1TkwiNqtWbJTTiIaS5RDvt0Z5sSggyvbyQmFwrry/njNVr0qIEd9Ff7fJU6h3h3xj
 0I0aJbfjTpAR/NPs40m/i8QaL+EZzQ1T7Y6T1wdnHI9vDISr9luJuQxcLCizKrr0BtC4
 VgkA==
X-Gm-Message-State: AOAM533Az7gqcK0nhszTVbrxmhJs9puLkQ6bBp0EtQwlyQznd3d8hPEA
 78VOGQYlMWRQMJ9b87vZjdeo3XaY4q1YzC9AEdcWTQ==
X-Google-Smtp-Source: ABdhPJwMj0JNqjyL811SbECEMfA/caHqwR2+JDnzW5OmSoerDP58fH+3cesUqeipGaKHS0IHuKHGM/zEjXdfsQZECOU=
X-Received: by 2002:a05:6808:69a:: with SMTP id
 k26mr7266898oig.127.1601862134524; 
 Sun, 04 Oct 2020 18:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200925074116.16068-1-patrick.delaunay@st.com>
In-Reply-To: <20200925074116.16068-1-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 4 Oct 2020 19:42:01 -0600
Message-ID: <CAPnjgZ02X_Z8sbxtjj3v8AcDaskjBpONVRxRfigJ4vQOW7ykiQ@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Lukasz Majewski <lukma@denx.de>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/3] dm: add cells_count parameter in
	*_count_phandle_with_args
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

On Fri, 25 Sep 2020 at 01:41, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> The cell_count argument is required when cells_name is NULL.
>
> This patch adds this parameter in live tree API
> - of_count_phandle_with_args
> - ofnode_count_phandle_with_args
> - dev_count_phandle_with_args
>
> This parameter solves issue when these API is used to count
> the number of element of a cell without cell name. This parameter
> allow to force the size cell.
>
> For example:
>   count = dev_count_phandle_with_args(dev, "array", NULL, 3);
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> It is linked to previous serie [1] but it is not a blocking point today
> as no user use this API with cells_name = NULL
> + dev_count_phandle_with_args
> + ofnode_count_phandle_with_args
>
> [1/3] was Previously sent in RFC [2] + missing impacts in:
>   drivers/net/designware.c
>   drivers/power/domain/power-domain-uclass.c
>   drivers/usb/host/ohci-da8xx.c
>   drivers/usb/host/ohci-generic.c
>
> I also add test in [3/3] for modified API.
>
> But I think it is the good time to modify these functions as they are not
> hugely used.
>
> [1] http://patchwork.ozlabs.org/project/uboot/list/?series=200899
>     "dm: add cells_count parameter in live DT APIs of_parse_phandle_with_args"
> [2] http://patchwork.ozlabs.org/project/uboot/list/?series=200906&state=*
>
>
>  board/st/stm32mp1/stm32mp1.c               | 2 +-
>  drivers/clk/clk-uclass.c                   | 4 ++--
>  drivers/core/of_access.c                   | 7 ++++---
>  drivers/core/ofnode.c                      | 6 +++---
>  drivers/core/read.c                        | 5 +++--
>  drivers/net/designware.c                   | 3 ++-
>  drivers/phy/phy-uclass.c                   | 2 +-
>  drivers/power/domain/power-domain-uclass.c | 2 +-
>  drivers/reset/reset-uclass.c               | 2 +-
>  drivers/usb/host/ehci-generic.c            | 4 ++--
>  drivers/usb/host/ohci-da8xx.c              | 3 ++-
>  drivers/usb/host/ohci-generic.c            | 6 ++++--
>  include/dm/of_access.h                     | 4 +++-
>  include/dm/ofnode.h                        | 3 ++-
>  include/dm/read.h                          | 8 +++++---
>  15 files changed, 36 insertions(+), 25 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
