Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0243C286A0B
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Oct 2020 23:26:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BEF89C32EA7;
	Wed,  7 Oct 2020 21:26:58 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F8B1C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Oct 2020 21:26:57 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n6so3683386wrm.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Oct 2020 14:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LZHcKHH07++nAPnzrgGakDVCiqKq7bRQk8HyuaJMZTI=;
 b=iivoOK3ubp06gMU0rBP6hlmKs2X1d7aVEuP2KB5i7tdTiUeZxCQXoGtwYc/CXeR2nP
 tnokDQyBNcKB81pHJgBOudVSTi6Kdt0nN9OzYHdvaakSaDJ7E05eyl1gqIy3mXePqOh7
 Qb+F66VbL82ns+qIKeeIn1zJhpzprQ4Yovhh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LZHcKHH07++nAPnzrgGakDVCiqKq7bRQk8HyuaJMZTI=;
 b=f3VNvAJFxWDOtA7d9UARI1xM02+SNvPVdMZ5FJuCuy3p9YH2lzbszelhxjBHug3Nx6
 kBqBgH4Ep9/syLaVuqe8Jht6VSowGcvI4N8CbXH4xj5fTx07LHP6d4qNmFj4z3To5pu9
 Z1xu8we6zG1s18Cgn2ZS5jodcKUUUszyMEs5FEDzMHpMSH5YPOTCxhaDj0cF/Oi+/7pF
 i01HkoPP+ZNDICB7LQGQL3KlA1q4z8rkC7bieWl+u2A6HRBPFwFNHbP3b1RT0YnlQx6Y
 ohxRWk5Xgwaf+bA8msUJzgbLnemiAgsmiGhe+4W19IZZ5lZ0N5jxS4AQ29Sv2g3GLp9b
 UiDQ==
X-Gm-Message-State: AOAM533qsn05ouq524RPyF+w1+CB+Sn9AoatX7cdUgZ6uAp74hmMzP+U
 VvefIpTHVYDdY35p0gXiPv+R6yOUzdta6Xs6TQO9Yg==
X-Google-Smtp-Source: ABdhPJxwTih7saSO7h0dGMCcH2B462i1ORsSBW0PqwAGUU3pjblb5N+BiaE+bhUlYmBDIxB/4xanlogAFtKkG9G4oRE=
X-Received: by 2002:adf:ec0e:: with SMTP id x14mr6057846wrn.204.1602106016773; 
 Wed, 07 Oct 2020 14:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <20201007161148.59389-1-xypron.glpk@gmx.de>
In-Reply-To: <20201007161148.59389-1-xypron.glpk@gmx.de>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 7 Oct 2020 15:26:45 -0600
Message-ID: <CAPnjgZ14rfibfVgbO9HxQC11n_HfMTti-CnywWrp_Og_0FNNPA@mail.gmail.com>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: Tom Rini <trini@konsulko.com>, Anatolij Gustschin <agust@denx.de>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Weijie Gao <weijie.gao@mediatek.com>,
 Sean Anderson <seanga2@gmail.com>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Alexander Graf <agraf@csgraf.de>,
 Thirupathaiah Annapureddy <thiruan@linux.microsoft.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Andreas Dannenberg <dannenberg@ti.com>
Subject: Re: [Uboot-stm32] [PATCH 1/1] common: rename getc() to getchar()
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

Hi Heinrich,

On Wed, 7 Oct 2020 at 10:12, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>
> The sandbox is built with the SDL2 library with invokes the X11 library
> which in turn calls getc(). But getc() in glibc is defined as
>
>     int getc(FILE *)
>
> This does not match our definition.
>
>     int getc(void)
>
> The sandbox crashes when called with parameter -l.

Just a nit here. I don't think the issue is that getc() has different
parameters. I believe it is the fact that we are overriding the getc()
in the C library. It wouldn't help if we changed the parameters, for
example, as it is still wrong for it to call the U-Boot version.

>
> Rename our library symbol getc() to getchar().
>
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---
>  api/api.c                                   |  2 +-
>  cmd/bootmenu.c                              |  4 +-
>  cmd/load.c                                  | 44 ++++++++++-----------
>  common/autoboot.c                           | 10 ++---
>  common/cli_readline.c                       |  4 +-
>  common/console.c                            | 12 +++---
>  common/spl/spl_ymodem.c                     |  2 +-
>  common/xyzModem.c                           |  2 +-
>  drivers/ddr/fsl/main.c                      |  2 +-
>  drivers/ram/stm32mp1/stm32mp1_interactive.c |  2 +-
>  drivers/serial/serial-uclass.c              |  2 +-
>  drivers/serial/serial.c                     |  2 +-
>  include/_exports.h                          |  2 +-
>  include/stdio.h                             |  2 +-
>  lib/charset.c                               |  2 +-
>  lib/efi_loader/efi_console.c                | 20 +++++-----
>  test/dm/usb.c                               |  2 +-
>  17 files changed, 58 insertions(+), 58 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
