Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B50697BB020
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Oct 2023 03:42:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F236C6C836;
	Fri,  6 Oct 2023 01:42:10 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD4E3C6C835
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Oct 2023 01:42:08 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-533df112914so2771423a12.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Oct 2023 18:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1696556528; x=1697161328;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=X1sUoMumseEtkE3EjAfLloBfRgOle4lFU37Z3Jp+xck=;
 b=lzbSbkdgOudcuehbiQq+R72H5NnL/GFpkVyE4G+YXQn0hxeDQqyjwt6HSHDyG5RMA0
 CC3Kcw1ouzTpbRmWSEtbJiAuYmGkPgwlSCm3WIUz8t5BTsd1pMILX/IoWqfUdr7z3kG2
 59FAoykOcPa4HQavhh/6w2cqu5IOBiVkS+wyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696556528; x=1697161328;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X1sUoMumseEtkE3EjAfLloBfRgOle4lFU37Z3Jp+xck=;
 b=u/ppl2WRW8ShiqNk+J56Lk23dQuUJtmqtQkwiTAd3I8DBxm0nFjhVrGZEjcfb7fEt5
 gBid2wlKrID8FaRbNfvuWnma/Bw/vE1F7RkRQFqKfojV0oPT8c181moTUOKhkz0KIaR9
 N06T4r7+I0pYz000xC3A5pwR3UYJ3sDIODVvBkxnDDZUbqghU7ChAUT+/GFFgWIwruCv
 R5ihx54edb7TkQAxt20kDPlvdJLnkP9Fb4q1b5BM5QH2lfw2KcPuPrD6K02tca3ScKw7
 aB2+3fDvqc9nTRTaU/iE/FrOAn9bc2uFxnPIYsPxg/g/xIAPOWkPQiAicFLPVBKl2sW/
 QKVA==
X-Gm-Message-State: AOJu0Yz60f0XadVBOi4vMyCjmXVX7cW4XiT5XLmMCQYzh4mOTz1o3xQN
 KC2nEW4NIw7Yzw7VDU/0GlqMagajQBiR8VabyFVQPg==
X-Google-Smtp-Source: AGHT+IGa7Z8H1wkSldewzIjU31JO29AoHZO9XuRkVnWqZG4Twq/98I2ddlwY1nm7+Od4HcI5YrUxPN4g+A97qIwd9yU=
X-Received: by 2002:a17:907:75f4:b0:9ae:6d0:84ec with SMTP id
 jz20-20020a17090775f400b009ae06d084ecmr5975730ejc.25.1696556528056; Thu, 05
 Oct 2023 18:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230924203953.1829820-1-sjg@chromium.org>
 <20230924203953.1829820-6-sjg@chromium.org>
 <20230924232658.GM305624@bill-the-cat>
 <CAPnjgZ2-ORog-+Onh1McptpMDrzccVc+BfByCMjp93wLqAms6w@mail.gmail.com>
 <20231005145350.GQ8465@bill-the-cat>
In-Reply-To: <20231005145350.GQ8465@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 5 Oct 2023 19:41:49 -0600
Message-ID: <CAPnjgZ2Mbx9H_ve_F_gq_eqt2hvwmYF455-0PHB31fV5m9HN2A@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Peng Fan <peng.fan@nxp.com>, Michal Suchanek <msuchanek@suse.de>,
 Leo <ycliang@andestech.com>, Stefan Roese <sr@denx.de>,
 Rick Chen <rick@andestech.com>, uboot-stm32@st-md-mailman.stormreply.com,
 U-Boot Mailing List <u-boot@lists.denx.de>, Michael Walle <michael@walle.cc>,
 Stefano Babic <sbabic@denx.de>, "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 05/25] treewide: Correct use of long help
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

Hi Tom,

On Thu, 5 Oct 2023 at 08:53, Tom Rini <trini@konsulko.com> wrote:
>
> On Wed, Oct 04, 2023 at 07:23:47PM -0600, Simon Glass wrote:
> > Hi Tom,
> >
> > On Sun, 24 Sept 2023 at 17:27, Tom Rini <trini@konsulko.com> wrote:
> > >
> > > On Sun, Sep 24, 2023 at 02:39:23PM -0600, Simon Glass wrote:
> > > > Some commands assume that CONFIG_SYS_LONGHELP is always defined.
> > > > Declaration of long help should be bracketed by an #ifdef to avoid an
> > > > 'unused variable' warning.
> > > >
> > > > Fix this treewide.
> > > >
> > > > Signed-off-by: Simon Glass <sjg@chromium.org>
> > > [snip]
> > > > diff --git a/arch/arm/mach-imx/cmd_dek.c b/arch/arm/mach-imx/cmd_dek.c
> > > > index 6fa5b41fcd38..25ea7d3b37da 100644
> > > > --- a/arch/arm/mach-imx/cmd_dek.c
> > > > +++ b/arch/arm/mach-imx/cmd_dek.c
> > > > @@ -393,11 +393,12 @@ static int do_dek_blob(struct cmd_tbl *cmdtp, int flag, int argc,
> > > >       return blob_encap_dek(src_addr, dst_addr, len);
> > > >  }
> > > >
> > > > -/***************************************************/
> > > > +#if IS_ENABLED(CONFIG_SYS_LONGHELP)
> > > >  static char dek_blob_help_text[] =
> > > >       "src dst len            - Encapsulate and create blob of data\n"
> > > >       "                         $len bits long at address $src and\n"
> > > >       "                         store the result at address $dst.\n";
> > > > +#endif
> > > >
> > > >  U_BOOT_CMD(
> > > >       dek_blob, 4, 1, do_dek_blob,
> > >
> > > This really doesn't read nicely.  I would rather (globally and fix
> > > existing users) __maybe_unused this instead.  I think there's just one
> > > example today that isn't "foo_help_text".
> >
> > Hmm, what do you think about adding a __longhelp symbol to cause the
> > linker to discard it when not needed?
>
> Well, I don't think we need linker list magic when __maybe_unused will
> just have them be discarded normally.

Yes, perhaps things are in a better state than they used to be, but
there is a linker discard for commands at present.

SECTIONS
{
#ifndef CONFIG_CMDLINE
        /DISCARD/ : { *(__u_boot_list_2_cmd_*) }
#endif
...

from:

c1352119fd0 arm: x86: Drop command-line code when CONFIG_CMDLINE is disabled

I wonder if we can remove it? I suppose once this series is sorted out
we could have a test to make sure no command is making it into the
image when ~CMDLINE

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
