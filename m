Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD8734FC85
	for <lists+uboot-stm32@lfdr.de>; Wed, 31 Mar 2021 11:20:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2664AC5662E;
	Wed, 31 Mar 2021 09:20:43 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FFA0C32EA7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Mar 2021 09:20:41 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id 19so16614513ilj.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Mar 2021 02:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uQWCgEAuRUwnAF7O5EncR1HFeegIc7W++tSQgUmy9Jg=;
 b=tsRrI8+nN1BAw4syfvMUatVZnHXTTj1yaDfrZDjRMYdie+lc8UZ/a6cgo90dVbrJ6n
 voT74EcjqC7YXHSSyvI+h3ENJDo9NSqHFoi7OhSgZgXOHoat8DfpIPk2g/hP450LC6ip
 0MDwRBfVn+utbJtn+K2jgITRZ9NWGZUGGvJHsT5+ldgXYXQMocf4LRMlpK3vud7ace7W
 53MaWtQbRW4wFvAEwYpPg005ZrVZV/A0c1n6g0LZpPSPCL1qWM15P5LUs/bu8GM2M3vp
 Q5mXSWAZt891lJtu03LvE98lg4eVY6XgiggxhhDeUwofDvdayi4jm1U4O5KM721Rorrw
 7zCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uQWCgEAuRUwnAF7O5EncR1HFeegIc7W++tSQgUmy9Jg=;
 b=eQ3IFlVOm9AXbcTQJQU0OWO+8dYvXDBHhy/6Q5FEja2nGyz+bqi0vbojPLt+RxDRgs
 4oU+D7N5JMhBoNnfnFZZYbF6287x7Rvrj4WT2U55rNe8IVV0GFBHUh9beeVBbPZ3kmHu
 NPH5AV/bDWCkvZhU72MBf4ypwcQuJKfdkJWC5R54qj3BoXuk5pdhceub+CZihIasvjEv
 zWU8tJYRPe8tzOc8sxBA6WZkqJjYnzocLAF1uDzyJsF2a0Y9Tl7y2xwaQLD1yF2m/8A+
 +GX3CZljkJ+LNO56e27Y4IM9qfgZFm15uxowdGQbNQeVlnrPMy+5srub+cOf79GUnQ6W
 VDfw==
X-Gm-Message-State: AOAM533zJdvIAEKCH36FN0a6OAbCEfmAYykYXZ3JX3tPqgluNNPSRWfs
 uzPPeKklywc9tkVVj2ZheKIplRmWYA347PqxyiI=
X-Google-Smtp-Source: ABdhPJzl5yjMHyO/CYodipxU1P6z65va07vVmfEieXcP962D0SSnHxnJ2byuo1HzuutRslWnxJ1icGXQ+w9ji54GjTw=
X-Received: by 2002:a05:6e02:dc5:: with SMTP id
 l5mr1932768ilj.218.1617182440096; 
 Wed, 31 Mar 2021 02:20:40 -0700 (PDT)
MIME-Version: 1.0
References: <1616987091-3432-1-git-send-email-dillon.minfei@gmail.com>
 <1616987091-3432-5-git-send-email-dillon.minfei@gmail.com>
 <8858913b-8255-0461-4bb7-cc650054dc27@foss.st.com>
In-Reply-To: <8858913b-8255-0461-4bb7-cc650054dc27@foss.st.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Wed, 31 Mar 2021 17:20:04 +0800
Message-ID: <CAL9mu0+_j1Z1krRCqmQ9X_XVtad+7OLrX8Cm5WF7M410C_zQCw@mail.gmail.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc: marex@denx.de, heiko.stuebner@theobroma-systems.com,
 josip.kelecic@sartura.hr, narmstrong@baylibre.com, andre.przywara@arm.com,
 ioana.ciornei@nxp.com, kever.yang@rock-chips.com, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>, festevam@gmail.com,
 priyanka.jain@nxp.com, patrick.delaunay@foss.st.com, hs@denx.de,
 aford173@gmail.com
Subject: Re: [Uboot-stm32] [PATCH v3 4/6] ram: stm32: fix strsep failed on
	read only memory
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

On Wed, Mar 31, 2021 at 5:09 PM Patrice CHOTARD
<patrice.chotard@foss.st.com> wrote:
>
> one remark below
>
> On 3/29/21 5:04 AM, dillon.minfei@gmail.com wrote:
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > strsep will change data from original memory address,
> > in case the memory is in non-sdram/sram place, will
> > run into a bug(hang at SDRAM: )
> >
> > just add a temporary array to store bank_name[] to fix this
> > bug.
> >
> > Fixes: f303aaf ("ram: stm32: add second SDRAM bank management")
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> > ---
> > v3: no changes
> >
> >  drivers/ram/stm32_sdram.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/ram/stm32_sdram.c b/drivers/ram/stm32_sdram.c
> > index 540ad85..da27677 100644
> > --- a/drivers/ram/stm32_sdram.c
> > +++ b/drivers/ram/stm32_sdram.c
> > @@ -268,6 +268,7 @@ static int stm32_fmc_of_to_plat(struct udevice *dev)
> >       u32 swp_fmc;
> >       ofnode bank_node;
> >       char *bank_name;
> > +     char _bank_name[128] = {0};
> >       u8 bank = 0;
> >       int ret;
> >
> > @@ -300,6 +301,8 @@ static int stm32_fmc_of_to_plat(struct udevice *dev)
> >       dev_for_each_subnode(bank_node, dev) {
> >               /* extract the bank index from DT */
> >               bank_name = (char *)ofnode_get_name(bank_node);
> > +             strcpy(_bank_name, bank_name);
>
> strcpy/strncpy usage is to be avoided. Instead use strlcpy()
Agree, will add to next submission.
thanks.
>
> Thanks
>
> > +             bank_name = _bank_name;
> >               strsep(&bank_name, "@");
> >               if (!bank_name) {
> >                       pr_err("missing sdram bank index");
> >
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
