Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BA027763C
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Sep 2020 18:08:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C29AC3FADE;
	Thu, 24 Sep 2020 16:08:27 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58991C3FAD4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Sep 2020 16:08:25 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z1so4460988wrt.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Sep 2020 09:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vUxOaPDzycfpY0G7RZVivV4k4mhiO8HDv+ZVBvLQNKw=;
 b=gEit+Lm8B06iBX20VeEqEdqXQ4KvRzt6lkBqtCu2P3aJId6Wp0F5LQPd1lIrv/baJu
 xQLt8485LMnyIGjc0F8/mZkr4mjEL6R9iVF7/juvHgiDW8IITbXyZiruCFXX3A8ohkhJ
 PEUKF/j/TJh7ei8saClvQLH3eYGZx+yexgVUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vUxOaPDzycfpY0G7RZVivV4k4mhiO8HDv+ZVBvLQNKw=;
 b=trunr7zazfd0i8FwJQ+M7xlYe47MvjGSye0A8gVCh/S6TFdAcUN8tOCyTAEeYgX21+
 evF8+d01CyQxj2dxDPI8c7cRxNN+Vr/SAWBbnKTURNfrWAWjJQPyNj4LAWvhSjSzmxyq
 5AOaZ2qCZVnoL2sxA9UBtS7Vow6BHhkw0cxqGzV7QUY5lGRlPQcejhwHPESwdY+pPrMm
 0vhKZ2q6JYW1hNBBtRgk+6MREelYBq4zEbaNqnqDRA0du7vUjqZUDOBNTDTgY7icWZf3
 jUuoKeHY4WmgQPOpB3dMnjyPrKctDMswtW1AjIFSuiv7dWRNe2KunpMg9m5mmDBB60Zj
 XhMQ==
X-Gm-Message-State: AOAM530DYZzg7PSWTZQfsFElKAdlMTaKXN+XmdZG3eEtU01eg/sfx5A9
 hfEx7TKxEV0tvi1b9eTSva+Mm2UE8Vz/N9vvPxvEbQ==
X-Google-Smtp-Source: ABdhPJx4skkU3u0pd2q4qXiTtV/nbVWV4zZHummAaxo6b40wasaMY1phnrYcflpD72X1rmJFJqlJ35xvbLt9VorcR2k=
X-Received: by 2002:adf:81e6:: with SMTP id 93mr532348wra.412.1600963704530;
 Thu, 24 Sep 2020 09:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200910164341.29613-1-patrick.delaunay@st.com>
 <CAPnjgZ2SK0-a75tO6HwVwKtA7rTPCmqeL0M16YgO_=gx5MgGqg@mail.gmail.com>
 <8224663e5f6b43388fd36f155653a442@SFHDAG6NODE3.st.com>
In-Reply-To: <8224663e5f6b43388fd36f155653a442@SFHDAG6NODE3.st.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 24 Sep 2020 10:08:10 -0600
Message-ID: <CAPnjgZ2099wa6auCX7nck8vJCJGCFLgM9CY4Yv+wUPO3=-FFqg@mail.gmail.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Cc: Marek Vasut <marex@denx.de>, Vignesh Raghavendra <vigneshr@ti.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Weijie Gao <weijie.gao@mediatek.com>,
 Kever Yang <kever.yang@rock-chips.com>, Lukasz Majewski <lukma@denx.de>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
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

Hi Patrick,

On Wed, 23 Sep 2020 at 09:06, Patrick DELAUNAY <patrick.delaunay@st.com> wrote:
>
> Hi Simon,
>
> > From: Simon Glass <sjg@chromium.org>
> > Sent: mardi 22 septembre 2020 20:49
> >
> > On Thu, 10 Sep 2020 at 10:44, Patrick Delaunay <patrick.delaunay@st.com>
> > wrote:
> > >
> > > The cell_count argument is required when cells_name is NULL.
> > >
> > > This patch adds this parameter in live tree API
> > > - of_count_phandle_with_args
> > > - ofnode_count_phandle_with_args
> > > - dev_count_phandle_with_args
> > >
> > > This parameter solves issue when these API is used to count the number
> > > of element of a cell without cell name. This parameter allow to force
> > > the size cell.
> > >
> > > For example:
> > >   count = dev_count_phandle_with_args(dev, "array", NULL, 3);
> > >
> > > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > > ---
> > > I push today this RFC.
> > >
> > > It is linked to previous serie [1] but it is not a blocking point
> > > today as no user use this API with cells_name = NULL
> > > + dev_count_phandle_with_args
> > > + ofnode_count_phandle_with_args
> > >
> > > But I think it is the good time to modify these functions as they are
> > > not hugely used: it is the proposition in this RFC.
> > >
> > > It is just a RFC because I don't sure if I can modify the existing API
> > > even if parameters are aligned with *_parse_phandle_with_args.
> > >
> > > I can also to add new APIs to use when cells_name is NULL:
> > > + dev_count_phandle_with_cell_count(node, list_name, cell_count);
> > > + ofnode_count_phandle_with_cell_count(node, list_name, cell_count);
> > >
> > > and raise a error if cells_name == NULL in existing function
> > > + dev_count_phandle_with_args
> > > + ofnode_count_phandle_with_args
> > >
> > > [1] http://patchwork.ozlabs.org/project/uboot/list/?series=200899
> > >     "dm: add cells_count parameter in live DT APIs of_parse_phandle_with_args"
> > >
> > >
> > >  board/st/stm32mp1/stm32mp1.c    | 2 +-
> > >  drivers/clk/clk-uclass.c        | 4 ++--
> > >  drivers/core/of_access.c        | 7 ++++---
> > >  drivers/core/ofnode.c           | 6 +++---
> > >  drivers/core/read.c             | 5 +++--
> > >  drivers/phy/phy-uclass.c        | 2 +-
> > >  drivers/reset/reset-uclass.c    | 2 +-
> > >  drivers/usb/host/ehci-generic.c | 4 ++--
> > >  include/dm/of_access.h          | 4 +++-
> > >  include/dm/ofnode.h             | 3 ++-
> > >  include/dm/read.h               | 8 +++++---
> > >  11 files changed, 27 insertions(+), 20 deletions(-)'
> >
> > Reviewed-by: Simon Glass <sjg@chromium.org>
> >
> > A test would go a long way here.
>
> Sure, I will add a test in the real patch...
>
> I send RFC without test just to be sure that adding parameter in  *_count_phandle_with_args()
> is a better solution than adding a new API.
>
> Proposition 1 (it is the RFC content): add argument in current API

I think that is best. It's only one more parameter onto a call that
already has lots of parameters. It reduced the number of separate
functions.


>
> Example:
>
> of_count_phandle_with_args(node, "clocks", "#clock-cells", 0);
> ofnode_count_phandle_with_args(node, "resets", "#reset-cells", 0);
> dev_count_phandle_with_args(node, "phys", "#phy-cells", 0);
>
> dev_count_phandle_with_args(node, "test", NULL, 3);
> ofnode_count_phandle_with_args(node, "test", NULL, 3);
>
>
> Proposition 2: new API *count_phandle_with_cell_count
>
> of_count_phandle_with_args(node, "clocks", "#clock-cells");
> ofnode_count_phandle_with_args(node, "resets", "#reset-cells");
> dev_count_phandle_with_args(node, "phys", "#phy-cells");
>
> dev_count_phandle_with_fixed_args(node, "test", 3);
> ofnode_count_phandle_with_fixed_args(node, "test", 3);
>
> I think that Proposition 1 (this RFC) is more clear because parameters are aligned
> with other API *read_phandle_with_args
>
> But proposition 2 is align with Linux API
> - of_count_phandle_with_args
> - of_parse_phandle_with_fixed_args
> And avoid to change all the current users of *count_phandle_with_args
>
> Patrick
>

- Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
