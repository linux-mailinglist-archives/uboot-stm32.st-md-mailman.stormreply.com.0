Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E594F59D47
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Jun 2019 15:55:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1470C28E30
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Jun 2019 13:55:12 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC3CDC28E30
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2019 13:55:09 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id r21so5363839otq.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2019 06:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V31H7k8oKtmy99a8ijnlGsyPqx+Pnp4W9+/Wk/kcQWc=;
 b=amt6z2uwF3RoFwuZSsOVW3RwXAMCbJgmFQxnt9fv2At77Rds2AEHu00p3AjqyPjoAL
 2xH0syzKViX+f/fiw4vIkfQO9V6VcjwoOp+J1BbFjUHHFtYpJ5G/4x9nPQb0Ht01yF+d
 epmcyTpgcfymCAFu+hGJbhSLcmYGbRU45EEoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V31H7k8oKtmy99a8ijnlGsyPqx+Pnp4W9+/Wk/kcQWc=;
 b=gL0ieCa/n9X7/t8Oohlrp+szkf3LCLHjefOJyibjZVumXxxX/pyLh4DXYHlzsfMQNY
 OXcEwEy43F/ZE5ovEBYCvIAhnBXaOtnZa4XLwT+7Ag/DBpTm5rDxUZThppFvG6tN6Bcr
 2SMdWt+TpOVwQhfPLUA9ukpOMYsJNGER5XvLyDB54qZlpSL719KRXe6i6V3KWh0wOX+u
 6tluETa3fdVTXjNN5vAkXlv1Xh54wbwJui6JAIosTxK54Y/oMvO5Y3J1Bomrqub69u7x
 KlTO82ruTznXTI3KVJVjWaWGZQU/+xdFKYRNLM2SKbLoK02Zb4YUjC3v5skbnhawHZ+G
 YEMw==
X-Gm-Message-State: APjAAAXmcYhEfZ+LQeDDJzKYPy3sZHQPzhgw2+/D8NCisRU2z+zK8/Iu
 +CkprhjnEYy6UVq53ojsFZHLMdBlxnuUfo2IOxQxzg==
X-Google-Smtp-Source: APXvYqzlK++ZxSBAT5VMyxTEC6RecUdmap/yrAchmAvFP6XGaZAITsPMLh6YoiN8F3QoonaDnR3ERlLbA2A/1hnBi7I=
X-Received: by 2002:a05:6830:1249:: with SMTP id
 s9mr8378549otp.33.1561730108237; 
 Fri, 28 Jun 2019 06:55:08 -0700 (PDT)
MIME-Version: 1.0
References: <1558459153-14104-1-git-send-email-patrick.delaunay@st.com>
 <228acf4bb47c4124bf07e6e032647e04@SFHDAG6NODE3.st.com>
 <CAPnjgZ2Dw+bSHpPuaZGa1tLaNnL0OCwcPHKoB3icqhQe7wvuiA@mail.gmail.com>
In-Reply-To: <CAPnjgZ2Dw+bSHpPuaZGa1tLaNnL0OCwcPHKoB3icqhQe7wvuiA@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 28 Jun 2019 07:54:56 -0600
Message-ID: <CAPnjgZ1QjLoNyBDMPzJwPF28V7dAiDwZhyC0HehEqO37hz1=oQ@mail.gmail.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Cc: Tien Fong Chee <tien.fong.chee@intel.com>,
 Anatolij Gustschin <agust@denx.de>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Mario Six <mario.six@gdsys.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, Bin Meng <bmeng.cn@gmail.com>,
 Chris Packham <judge.packham@gmail.com>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v3 0/3] fdt: Allow indicating a node is
	for U-Boot proper only
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

On Thu, 13 Jun 2019 at 10:33, Simon Glass <sjg@chromium.org> wrote:
>
> Hi Patrick,
>
> On Thu, 13 Jun 2019 at 09:12, Patrick DELAUNAY <patrick.delaunay@st.com> wrote:
> >
> > Hi Simon,
> >
> > >
> > > Hi,
> > >
> > > I create this serie with:
> > >
> > > 1/ documentation update for previous patch
> > >    [U-Boot,v2] dm: remove pre reloc properties in SPL and TPL device tree
> > >    http://patchwork.ozlabs.org/patch/1081155/
> > >
> > >    PS: Code is already merged in commit commit c7a88dae997f ("dm: remove
> > >        pre reloc properties in SPL and TPL device tree")
> > >        but not the documentation.
> > >
> > > 2/ missing part for v1 serie (patch 1/2)
> > >    http://patchwork.ozlabs.org/project/uboot/list/?series=89846
> > >    => http://patchwork.ozlabs.org/patch/1035797
> > >
> > > 3/ new tests for pre-reloc propertie in SPL as suggested by Simon
> > >    (http://patchwork.ozlabs.org/patch/1081155/#2156621)
> > >
> > > Regards
> > > Patrick
> > >
> > >
> > > Changes in v3:
> > > - simplify test after Simon remarks by using fdtgrep on spl dtb
> > > - rebase on u-boot-dm/sandbox-working
> > >
> > > Changes in v2:
> > > - rebase on master
> > >
> > > Patrick Delaunay (3):
> > >   test: check u-boot properties in SPL device tree
> > >   fdt: Allow indicating a node is for U-Boot proper only
> > >   dm: doc: add documentation for pre-reloc properties in SPL and TPL
> > >
> > >  arch/sandbox/dts/sandbox.dtsi    | 18 ++++++++++++++++++
> > >  doc/README.SPL                   | 16 ++++++++++++++++
> > >  doc/README.TPL                   |  4 ++++
> > >  doc/driver-model/README.txt      |  4 ++++
> > >  drivers/core/util.c              |  2 ++
> > >  drivers/video/video-uclass.c     |  4 +++-
> > >  include/dm/ofnode.h              |  6 ++++--
> > >  include/dm/util.h                |  6 ++++--
> > >  test/py/tests/test_ofplatdata.py | 28 ++++++++++++++++++++++++++++
> > >  9 files changed, 83 insertions(+), 5 deletions(-)
> > >
> > > --
> > > 2.7.4
> >
> > Gentle reminder
> >
> > targeted for v2019.07 or for next release v2019.10 ?
> >
> > Not blocking for my board (as display is not yet supported).
>
> I'm planning to pull this in for the next release, and expect to have
> more time in a week.

Applied to u-boot-dm/next, thanks!
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
