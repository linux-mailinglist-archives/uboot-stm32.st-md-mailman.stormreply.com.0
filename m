Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 722F91C3DD4
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 May 2020 16:59:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 258E4C36B0B
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 May 2020 14:59:31 +0000 (UTC)
Received: from mx2.mailbox.org (mx2.mailbox.org [80.241.60.215])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64F53C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 May 2020 14:59:30 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id 63948A59CC;
 Mon,  4 May 2020 16:59:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
 [80.241.56.115]) (amavisd-new, port 10030)
 with ESMTP id jFJ9-d9uskaO; Mon,  4 May 2020 16:59:17 +0200 (CEST)
To: Michal Simek <michal.simek@xilinx.com>, u-boot@lists.denx.de,
 git@xilinx.com
References: <f5214e0dd5f7a2c713f18d75727cc112d2d5e88b.1588593276.git.michal.simek@xilinx.com>
From: Stefan Roese <sr@denx.de>
Message-ID: <ad0a201b-ec3d-6619-a966-c54c22433351@denx.de>
Date: Mon, 4 May 2020 16:59:08 +0200
MIME-Version: 1.0
In-Reply-To: <f5214e0dd5f7a2c713f18d75727cc112d2d5e88b.1588593276.git.michal.simek@xilinx.com>
Content-Language: de-DE
X-Rspamd-Queue-Id: 6634D1738
X-Rspamd-Score: -3.75 / 15.00 / 15.00
Cc: Joel Johnson <mrjoel@lixil.net>,
 Hannes Schmelzer <hannes.schmelzer@br-automation.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Sjoerd Simons <sjoerd.simons@collabora.co.uk>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 =?UTF-8?Q?Eric_B=c3=a9nard?= <eric@eukrea.com>,
 Ken Lin <Ken.Lin@advantech.com.tw>, uboot-stm32@st-md-mailman.stormreply.com,
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>,
 Pascal Linder <pascal.linder@edu.hefr.ch>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Ian Ray <ian.ray@ge.com>,
 Thomas Hebb <tommyhebb@gmail.com>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Anatolij Gustschin <agust@denx.de>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Tetsuyuki Kobayashi <koba@kmckk.co.jp>,
 Andreas Geisreiter <ageisreiter@dh-electronics.de>,
 Otavio Salvador <otavio@ossystems.com.br>, Thomas Weber <weber@corscience.de>,
 Tim Harvey <tharvey@gateworks.com>,
 Troy Kisky <troy.kisky@boundarydevices.com>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>,
 Akshay Bhat <akshaybhat@timesys.com>, Adam Ford <aford173@gmail.com>,
 Ludwig Zenz <lzenz@dh-electronics.de>, Andreas Dannenberg <dannenberg@ti.com>,
 Igor Opaniuk <igor.opaniuk@toradex.com>, Heiko Schocher <hs@denx.de>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Simon Glass <sjg@chromium.org>, Holger Brunck <holger.brunck@ch.abb.com>,
 Mario Six <mario.six@gdsys.cc>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 04.05.20 13:54, Michal Simek wrote:
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
>   README                               | 4 ----
>   cmd/mem.c                            | 9 ++-------
>   include/configs/MigoR.h              | 1 -
>   include/configs/advantech_dms-ba16.h | 1 -
>   include/configs/apalis_imx6.h        | 1 -
>   include/configs/aristainetos2.h      | 1 -
>   include/configs/armadillo-800eva.h   | 1 -
>   include/configs/blanche.h            | 1 -
>   include/configs/cgtqmx6eval.h        | 1 -
>   include/configs/colibri_imx6.h       | 1 -
>   include/configs/dh_imx6.h            | 1 -
>   include/configs/el6x_common.h        | 1 -
>   include/configs/embestmx6boards.h    | 1 -
>   include/configs/ge_bx50v3.h          | 1 -
>   include/configs/gw_ventana.h         | 1 -
>   include/configs/imx6_logic.h         | 1 -
>   include/configs/kzm9g.h              | 1 -
>   include/configs/mx6sabre_common.h    | 1 -
>   include/configs/nitrogen6x.h         | 1 -
>   include/configs/presidio_asic.h      | 1 -
>   include/configs/sh7752evb.h          | 1 -
>   include/configs/sh7753evb.h          | 1 -
>   include/configs/sh7757lcr.h          | 1 -
>   include/configs/stm32mp1.h           | 1 -
>   include/configs/tao3530.h            | 1 -
>   include/configs/tricorder.h          | 1 -
>   include/configs/xilinx_versal.h      | 1 -
>   include/configs/xilinx_versal_mini.h | 1 -
>   include/configs/xilinx_zynqmp.h      | 4 ----
>   include/configs/xilinx_zynqmp_mini.h | 1 -
>   include/configs/xilinx_zynqmp_r5.h   | 1 -
>   scripts/config_whitelist.txt         | 1 -
>   32 files changed, 2 insertions(+), 44 deletions(-)

Reviewed-by: Stefan Roese <sr@denx.de>

Thanks,
Stefan
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
