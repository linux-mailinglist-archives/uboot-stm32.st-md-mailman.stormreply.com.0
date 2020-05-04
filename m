Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DFE1C3CB7
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 May 2020 16:18:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2149C36B0B
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 May 2020 14:18:00 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BD6AC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 May 2020 14:17:58 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id m10so6732287oie.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 May 2020 07:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=htOwKDDPb6HzOisbsgsjyyjl33DolUagNIsBO9gfSCw=;
 b=fdJqcUzngVpSmBY6lRfRrUyzcNyXfL0I6jdFyqiFTc6C3dIvtk6qxCP9X3x7SQp8UG
 jGWtlXo5pWUWSVmUGGlSvdx/SgRqW8fbk85PLG+vpc9cMUuzbiSAzcK5ah8T89C9xTwC
 h2oEb1CAfafI5c3iVz+oCKTrX+sjRbHHE4l1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=htOwKDDPb6HzOisbsgsjyyjl33DolUagNIsBO9gfSCw=;
 b=LDQWuzyVc9o1Y2uFtCJWvmg6QN8tkcajEP9FTBO9xa3UAcXFgyI7W02TfSREVlo7jP
 PvwYBzGvq9lZpRaSiWqkSdEHvSUqhXxmDx6wV9HDQxxfCzTCijC5rNLUMHM+MzDHlIPV
 zRIbMOP58MT3qWOq6GUrxjF7vny1UoJbQbebklLzeQ+n4K8bdZP7r5rJwTfe5lEB9Txz
 eoBKwEaAdUKQg4lZHGub9vrMcBh28NAwH37CLvXBeOIPA6R1HIzlb0il4DcpM/1zGXiO
 C4m1M8q3GfBS4rT4W+nw1GcY0r9t9A0EKk+mZr9pyQIPUU3890fKi2WiVKmQQ3HKEpxP
 sooQ==
X-Gm-Message-State: AGi0Pub982l5mAEFWic87M8gfQQT1iGq36sSfulNdm7O5sv+jk4TY4lE
 Ay6vwI1iBVvQOXaUQ2H5hNTs6jRkjCJHRF5KOcJ1sg==
X-Google-Smtp-Source: APiQypL33hjrSVB9HIVwIdDlTwL7hehinNja0R5sDYv3lytGQhpePnxsoxLwMmFupQXV5/gYjf1aeotATmVXLfa9qDQ=
X-Received: by 2002:aca:bb83:: with SMTP id l125mr8710761oif.122.1588601876583; 
 Mon, 04 May 2020 07:17:56 -0700 (PDT)
MIME-Version: 1.0
References: <f5214e0dd5f7a2c713f18d75727cc112d2d5e88b.1588593276.git.michal.simek@xilinx.com>
In-Reply-To: <f5214e0dd5f7a2c713f18d75727cc112d2d5e88b.1588593276.git.michal.simek@xilinx.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 4 May 2020 08:17:44 -0600
Message-ID: <CAPnjgZ1Ex+zqRf_yzB4fNuo10iF0TrjqoVsWsQZW+9WpGiSSkA@mail.gmail.com>
To: Michal Simek <michal.simek@xilinx.com>
Cc: Joel Johnson <mrjoel@lixil.net>,
 Hannes Schmelzer <hannes.schmelzer@br-automation.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Sjoerd Simons <sjoerd.simons@collabora.co.uk>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>,
 Ken Lin <Ken.Lin@advantech.com.tw>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>,
 Marek Vasut <marex@denx.de>, Pascal Linder <pascal.linder@edu.hefr.ch>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Ian Ray <ian.ray@ge.com>,
 Thomas Hebb <tommyhebb@gmail.com>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Heiko Schocher <hs@denx.de>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Tetsuyuki Kobayashi <koba@kmckk.co.jp>,
 Andreas Geisreiter <ageisreiter@dh-electronics.de>,
 Otavio Salvador <otavio@ossystems.com.br>, Thomas Weber <weber@corscience.de>,
 Tim Harvey <tharvey@gateworks.com>,
 Troy Kisky <troy.kisky@boundarydevices.com>, git <git@xilinx.com>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>,
 Akshay Bhat <akshaybhat@timesys.com>, Adam Ford <aford173@gmail.com>,
 Ludwig Zenz <lzenz@dh-electronics.de>, Andreas Dannenberg <dannenberg@ti.com>,
 Igor Opaniuk <igor.opaniuk@toradex.com>, Anatolij Gustschin <agust@denx.de>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Holger Brunck <holger.brunck@ch.abb.com>, Mario Six <mario.six@gdsys.cc>,
 Masakazu Mochizuki <masakazu.mochizuki.wd@hitachi.com>
Subject: Re: [Uboot-stm32] [PATCH] cmd: mem: Remove
	CONFIG_SYS_MEMTEST_SCRATCH mapping
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

On Mon, 4 May 2020 at 05:54, Michal Simek <michal.simek@xilinx.com> wrote:
>
> There is no real need to exactly define space for saving patterns for
> alternate memory test. It is much easier to allocate space on the stack and
> use it instead of trying to find out space where pattern should be saved.
>
> For example if you want to test the whole DDR memory you can't save patter
> to DDR and you need to find it out. On Xilinx devices DDR or OCM addresses
> were chosen but that means that OCM needs to be mapped and U-Boot has
> access permission there.
>
> It is easier to remove this limitation and simply save it on stack because
> it is very clear that memory test can't rewrite U-Boot and U-Boot has also
> full access to memory where runs from.
>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
>
>  README                               | 4 ----
>  cmd/mem.c                            | 9 ++-------
>  include/configs/MigoR.h              | 1 -
>  include/configs/advantech_dms-ba16.h | 1 -
>  include/configs/apalis_imx6.h        | 1 -
>  include/configs/aristainetos2.h      | 1 -
>  include/configs/armadillo-800eva.h   | 1 -
>  include/configs/blanche.h            | 1 -
>  include/configs/cgtqmx6eval.h        | 1 -
>  include/configs/colibri_imx6.h       | 1 -
>  include/configs/dh_imx6.h            | 1 -
>  include/configs/el6x_common.h        | 1 -
>  include/configs/embestmx6boards.h    | 1 -
>  include/configs/ge_bx50v3.h          | 1 -
>  include/configs/gw_ventana.h         | 1 -
>  include/configs/imx6_logic.h         | 1 -
>  include/configs/kzm9g.h              | 1 -
>  include/configs/mx6sabre_common.h    | 1 -
>  include/configs/nitrogen6x.h         | 1 -
>  include/configs/presidio_asic.h      | 1 -
>  include/configs/sh7752evb.h          | 1 -
>  include/configs/sh7753evb.h          | 1 -
>  include/configs/sh7757lcr.h          | 1 -
>  include/configs/stm32mp1.h           | 1 -
>  include/configs/tao3530.h            | 1 -
>  include/configs/tricorder.h          | 1 -
>  include/configs/xilinx_versal.h      | 1 -
>  include/configs/xilinx_versal_mini.h | 1 -
>  include/configs/xilinx_zynqmp.h      | 4 ----
>  include/configs/xilinx_zynqmp_mini.h | 1 -
>  include/configs/xilinx_zynqmp_r5.h   | 1 -
>  scripts/config_whitelist.txt         | 1 -
>  32 files changed, 2 insertions(+), 44 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
