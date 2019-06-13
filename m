Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D5E443C3
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Jun 2019 18:34:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 975ACCBA4C7
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Jun 2019 16:34:08 +0000 (UTC)
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E62CECBA4C5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jun 2019 16:34:06 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id t76so14906671oih.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jun 2019 09:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pP5JzFeKTISDyovde7PyRak5Dj8oV+0q959Z+93HeKI=;
 b=RBinEJOl7a/PDP+jO5K9Jco/uU8zc6ZKioDNWX055CWgaql79sH0QIN9APRKvjHs8A
 m3474aNSOTf7qot9oI4/GJMEauDF9VQoVqeolmhcuX2OBEqYVau2gj1v66ei3nckkORB
 Mjlquv7YzxoinMWNoLWIZ+WNgaz8s/yip5UKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pP5JzFeKTISDyovde7PyRak5Dj8oV+0q959Z+93HeKI=;
 b=dF2KyIjIjvXMshhRmTSLmkcWqdYXqDnad8zbP6StVVkcVhry+AqCUxyl8Ag8ChrqfF
 ozEbg+3bU4elslyRtCTXCjdLlm7MXSjzpxNWP8VRIxuGMGJ1J4zu9cXLscmj4iVc6v1F
 Su8jf1glydZF2QD9VNTNurlh7EWNEqLCnl+eEAEmvx8S5J777WtpCwUAHG8BciUSdPIj
 ZcDbY6yh+XhXoloRTS1jx36GtrF1CxvnrqDkow1veJ7VByVqwwg3C6xZQzxZqYk4OQMN
 jNwpbma7Km4X7anRpDvow6yaEGC+IGLMqaSU5sDNirSm65YhWMZV0bk59nhhkMDpkI0L
 vGGg==
X-Gm-Message-State: APjAAAWbFqc9MGq9cf4n2aZ60Vb+aXDX24/28rP84/rIZIxRg6WzCxNQ
 Mjzy29jnTInhKWGIVaXgQsQUuuljZXWK/l3hSGuUwA==
X-Google-Smtp-Source: APXvYqwyf+BTmODAM5yUmQJFrgIphX+jX+tEyEiZL6OHVqTcHgMNfZ2qEzn+W0v0cbGbSxC5pjiRESvzcVF1cgmy28I=
X-Received: by 2002:aca:6c1:: with SMTP id 184mr3411119oig.122.1560443644935; 
 Thu, 13 Jun 2019 09:34:04 -0700 (PDT)
MIME-Version: 1.0
References: <1558459153-14104-1-git-send-email-patrick.delaunay@st.com>
 <228acf4bb47c4124bf07e6e032647e04@SFHDAG6NODE3.st.com>
In-Reply-To: <228acf4bb47c4124bf07e6e032647e04@SFHDAG6NODE3.st.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 13 Jun 2019 10:33:51 -0600
Message-ID: <CAPnjgZ2Dw+bSHpPuaZGa1tLaNnL0OCwcPHKoB3icqhQe7wvuiA@mail.gmail.com>
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

Hi Patrick,

On Thu, 13 Jun 2019 at 09:12, Patrick DELAUNAY <patrick.delaunay@st.com> wrote:
>
> Hi Simon,
>
> >
> > Hi,
> >
> > I create this serie with:
> >
> > 1/ documentation update for previous patch
> >    [U-Boot,v2] dm: remove pre reloc properties in SPL and TPL device tree
> >    http://patchwork.ozlabs.org/patch/1081155/
> >
> >    PS: Code is already merged in commit commit c7a88dae997f ("dm: remove
> >        pre reloc properties in SPL and TPL device tree")
> >        but not the documentation.
> >
> > 2/ missing part for v1 serie (patch 1/2)
> >    http://patchwork.ozlabs.org/project/uboot/list/?series=89846
> >    => http://patchwork.ozlabs.org/patch/1035797
> >
> > 3/ new tests for pre-reloc propertie in SPL as suggested by Simon
> >    (http://patchwork.ozlabs.org/patch/1081155/#2156621)
> >
> > Regards
> > Patrick
> >
> >
> > Changes in v3:
> > - simplify test after Simon remarks by using fdtgrep on spl dtb
> > - rebase on u-boot-dm/sandbox-working
> >
> > Changes in v2:
> > - rebase on master
> >
> > Patrick Delaunay (3):
> >   test: check u-boot properties in SPL device tree
> >   fdt: Allow indicating a node is for U-Boot proper only
> >   dm: doc: add documentation for pre-reloc properties in SPL and TPL
> >
> >  arch/sandbox/dts/sandbox.dtsi    | 18 ++++++++++++++++++
> >  doc/README.SPL                   | 16 ++++++++++++++++
> >  doc/README.TPL                   |  4 ++++
> >  doc/driver-model/README.txt      |  4 ++++
> >  drivers/core/util.c              |  2 ++
> >  drivers/video/video-uclass.c     |  4 +++-
> >  include/dm/ofnode.h              |  6 ++++--
> >  include/dm/util.h                |  6 ++++--
> >  test/py/tests/test_ofplatdata.py | 28 ++++++++++++++++++++++++++++
> >  9 files changed, 83 insertions(+), 5 deletions(-)
> >
> > --
> > 2.7.4
>
> Gentle reminder
>
> targeted for v2019.07 or for next release v2019.10 ?
>
> Not blocking for my board (as display is not yet supported).

I'm planning to pull this in for the next release, and expect to have
more time in a week.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
