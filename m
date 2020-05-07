Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E64381C808A
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 May 2020 05:33:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F9C4C36B0C
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 May 2020 03:33:52 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D09AC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2020 03:33:51 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 49HfFN0KMCz1qs0B;
 Thu,  7 May 2020 05:33:42 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 49HfFK4LjTz1qqkd;
 Thu,  7 May 2020 05:33:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id Fe-ayUqQ_4vN; Thu,  7 May 2020 05:33:36 +0200 (CEST)
X-Auth-Info: Dq1o+aCX2lC7J+wZlnEWHmzUd2O/73X6rEwPTfD46TA=
Received: from [192.168.1.106] (91-82-169-45.pool.digikabel.hu [91.82.169.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu,  7 May 2020 05:33:36 +0200 (CEST)
To: Michal Simek <michal.simek@xilinx.com>, git@xilinx.com
References: <f5214e0dd5f7a2c713f18d75727cc112d2d5e88b.1588593276.git.michal.simek@xilinx.com>
From: Heiko Schocher <hs@denx.de>
Message-ID: <e519e51b-d05e-949e-343c-3cb4e606d3c4@denx.de>
Date: Thu, 7 May 2020 05:33:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <f5214e0dd5f7a2c713f18d75727cc112d2d5e88b.1588593276.git.michal.simek@xilinx.com>
Content-Language: en-US
Cc: Joel Johnson <mrjoel@lixil.net>,
 Hannes Schmelzer <hannes.schmelzer@br-automation.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Sjoerd Simons <sjoerd.simons@collabora.co.uk>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 =?UTF-8?Q?Eric_B=c3=a9nard?= <eric@eukrea.com>,
 Ken Lin <Ken.Lin@advantech.com.tw>, uboot-stm32@st-md-mailman.stormreply.com,
 Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>,
 Marek Vasut <marex@denx.de>, Pascal Linder <pascal.linder@edu.hefr.ch>,
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
 Igor Opaniuk <igor.opaniuk@toradex.com>,
 Philippe Reynes <philippe.reynes@softathome.com>, u-boot@lists.denx.de,
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
Reply-To: hs@denx.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hello Michal,

Am 04.05.2020 um 13:54 schrieb Michal Simek:
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

Hmm.. I think this is from old powerpc times, but I do not see a
powerpc board in the list, so this makes sense.

Reviewed-by: Heiko Schocher <hs@denx.de>

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
