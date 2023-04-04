Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 771C26D6899
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 Apr 2023 18:18:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E5F7C6A602;
	Tue,  4 Apr 2023 16:18:10 +0000 (UTC)
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2337CC0D2C0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Apr 2023 16:18:09 +0000 (UTC)
Received: from francesco-nb.int.toradex.com (31-10-206-125.static.upc.ch
 [31.10.206.125])
 by mail11.truemail.it (Postfix) with ESMTPA id A5F1020779;
 Tue,  4 Apr 2023 18:18:07 +0200 (CEST)
Date: Tue, 4 Apr 2023 18:18:03 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Tom Rini <trini@konsulko.com>
Message-ID: <ZCxNuw72/CrWSn6z@francesco-nb.int.toradex.com>
References: <20230206224838.75963-1-francesco@dolcini.it>
 <20230206224838.75963-2-francesco@dolcini.it>
 <Y+GKi9MlruCvNZLZ@bill-the-cat>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+GKi9MlruCvNZLZ@bill-the-cat>
Cc: Marek Vasut <marex@denx.de>, Parthiban Nallathambi <parthiban@linumiz.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Simon Glass <sjg@chromium.org>,
 Niel Fourie <lusus@denx.de>, Enric Balletbo i Serra <eballetbo@gmail.com>,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Javier =?iso-8859-1?Q?Mart=EDnez?= Canillas <javier@dowhile0.org>,
 Tim Harvey <tharvey@gateworks.com>, sbabic@denx.de,
 Nikita Kiryanov <nikita@compulab.co.il>
Subject: Re: [Uboot-stm32] [PATCH v2 1/3] fdt: validate/fix cells count on
	mtdpart fixup
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

+Stefano

On Mon, Feb 06, 2023 at 06:17:31PM -0500, Tom Rini wrote:
> On Mon, Feb 06, 2023 at 11:48:36PM +0100, Francesco Dolcini wrote:
> 
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > 
> > Fixup #size-cells value when updating the MTD partitions, this is
> > required to prevent issues in case the MTD parent set #size-cells to
> > zero.
> > This could happen for example in the legacy case in which the partitions
> > are created as direct child of the mtd node and that specific node has
> > no children. Recent clean-up on Linux device tree files created a boot
> > regression on colibri-imx7 [0].
> > 
> > This fixup has the limitation to assume 32-bit (#size-cells=1)
> > addressing, therefore it will not work with device bigger than 4GiB.
> > 
> > This change also enforce #address-cells to be the same as #size-cells,
> > this was already silently enforced by fdt_node_set_part_info(), now this
> > is checked explicitly and partition fixup will just fail in such case.
> > 
> > When the partition list is static the preferred way to pass the mtd
> > partition list to the kernel is to either define those in the source DTS
> > file or use mtdparts= in the command line.
> > Tweaking the DT from U-Boot should be avoided, unless some dynamic
> > changes are required, since it proved to be problematic when not
> > following the evolution of the "standard".
> > 
> > Link: https://lore.kernel.org/all/Y4dgBTGNWpM6SQXI@francesco-nb.int.toradex.com/
> > Link: https://lore.kernel.org/all/20221202071900.1143950-1-francesco@dolcini.it/
> > Cc: Marek Vasut <marex@denx.de>
> > Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> > v2: improved commit message
> > ---
> >  common/fdt_support.c | 45 ++++++++++++++++++++++++++++++++++----------
> >  1 file changed, 35 insertions(+), 10 deletions(-)
> 
> I'm dropping the linux-mtd list here and adding a bunch more platform
> maintainers. In general, calling fdt_fixup_mtdparts is the wrong choice.
> I see we do have a few cases in U-Boot where we're clearly doing
> something dynamic to the partition table, but it looks like at first
> glance most callers are using this hook when they should either be
> having the partition map in the device tree properly (and using one of
> the appropriate bindings) or passing the map in via the kernel command
> line. I would like to ask everyone I've added to the list here to
> please audit your platform and update it as needed. Thanks!

Hello Tom,
what should we do with this patch? No feedback so far, apart this email
from you.

Stefano: maybe you can pick patches 2 and 3 ?

Francesco



_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
