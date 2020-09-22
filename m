Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC2727488C
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Sep 2020 20:48:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B57FC32EB1;
	Tue, 22 Sep 2020 18:48:50 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED624C32EA8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Sep 2020 18:48:48 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id s12so18229718wrw.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Sep 2020 11:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lcr33COcvt2T1XnT/+NTOSAkGUTnJFPF5toSrpfgo9c=;
 b=Nimh2j+5zcKloqR9sZe+y+0eWNtySeyy1TiFe5z45W8fmATLdzamCihqwC//P6AS8y
 rvDfqjRhnJ6tyGJMv4hdMMEL+nORz1Fp506GH0+SexL+kUhsHZZxZKG/rMwTO2K0NNGC
 quMJsSldlBThhYd71wHlRFZjbWbzWLKM9Jhyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lcr33COcvt2T1XnT/+NTOSAkGUTnJFPF5toSrpfgo9c=;
 b=lFVuso3WuRpM7RkVzrh4TWV4p17ZF/iygURzDmeB2njXrBNh0yTN9BiipUDUZqTxkX
 5J52auG8YaAu6MX/dBlDzujOiK1EV4rZeyuR9C5xzHxMxzJK0n7oTxLXNDjvXXsj/0NC
 VIeKKw+TA3qz5MVvcoK/WMbahoq3E81pJ9l4HaD1g2ws5TcWdPfb7McBZLGPYtwAAD3Z
 QKS8ig4b8txfAuNwW2i2iDcQCt+uFl0CsnwyDziFdmyRF89qGtRMO2ZE+6ZfkNNQOdDO
 7CV8T59GKLKYHcWnybHS2s2MSTDqTamLGPhC+Wl3ducnnidBZKAo0UfEmChyFWFlNV2P
 g7EA==
X-Gm-Message-State: AOAM531ChmmWc8ptgKNx3m9kcmVpQLCuC6lm2mdQVz3dPD1i4Wdrq6dE
 kiP4t9JqXInXXg2RXb0at4BOsObtDESFB0iOq8sfZA==
X-Google-Smtp-Source: ABdhPJxSKqI+zAErr/Cl1pqpagE95/zg/Fiay/DROCJJqf3ZiDZ3q020s+YfWrMQ8SLxlFOnl++YYJGQ5t6N+LilEEk=
X-Received: by 2002:a05:6000:151:: with SMTP id
 r17mr6755354wrx.311.1600800528155; 
 Tue, 22 Sep 2020 11:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200910164341.29613-1-patrick.delaunay@st.com>
In-Reply-To: <20200910164341.29613-1-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 22 Sep 2020 12:48:37 -0600
Message-ID: <CAPnjgZ2SK0-a75tO6HwVwKtA7rTPCmqeL0M16YgO_=gx5MgGqg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Marek Vasut <marex@denx.de>, Vignesh Raghavendra <vigneshr@ti.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Weijie Gao <weijie.gao@mediatek.com>,
 Kever Yang <kever.yang@rock-chips.com>, Lukasz Majewski <lukma@denx.de>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [RFC PATCH] dm: add cells_count parameter in
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

On Thu, 10 Sep 2020 at 10:44, Patrick Delaunay <patrick.delaunay@st.com> wrote:
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
> I push today this RFC.
>
> It is linked to previous serie [1] but it is not a blocking point today
> as no user use this API with cells_name = NULL
> + dev_count_phandle_with_args
> + ofnode_count_phandle_with_args
>
> But I think it is the good time to modify these functions as they are not
> hugely used: it is the proposition in this RFC.
>
> It is just a RFC because I don't sure if I can modify the existing API
> even if parameters are aligned with *_parse_phandle_with_args.
>
> I can also to add new APIs to use when cells_name is NULL:
> + dev_count_phandle_with_cell_count(node, list_name, cell_count);
> + ofnode_count_phandle_with_cell_count(node, list_name, cell_count);
>
> and raise a error if cells_name == NULL in existing function
> + dev_count_phandle_with_args
> + ofnode_count_phandle_with_args
>
> [1] http://patchwork.ozlabs.org/project/uboot/list/?series=200899
>     "dm: add cells_count parameter in live DT APIs of_parse_phandle_with_args"
>
>
>  board/st/stm32mp1/stm32mp1.c    | 2 +-
>  drivers/clk/clk-uclass.c        | 4 ++--
>  drivers/core/of_access.c        | 7 ++++---
>  drivers/core/ofnode.c           | 6 +++---
>  drivers/core/read.c             | 5 +++--
>  drivers/phy/phy-uclass.c        | 2 +-
>  drivers/reset/reset-uclass.c    | 2 +-
>  drivers/usb/host/ehci-generic.c | 4 ++--
>  include/dm/of_access.h          | 4 +++-
>  include/dm/ofnode.h             | 3 ++-
>  include/dm/read.h               | 8 +++++---
>  11 files changed, 27 insertions(+), 20 deletions(-)'

Reviewed-by: Simon Glass <sjg@chromium.org>

A test would go a long way here.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
