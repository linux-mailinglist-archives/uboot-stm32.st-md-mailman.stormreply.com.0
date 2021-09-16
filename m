Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8283840DD71
	for <lists+uboot-stm32@lfdr.de>; Thu, 16 Sep 2021 17:00:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 492A4C597BE;
	Thu, 16 Sep 2021 15:00:36 +0000 (UTC)
Received: from mail.nic.cz (mail.nic.cz [217.31.204.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16B72C5718F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Sep 2021 15:00:30 +0000 (UTC)
Received: from thinkpad (unknown [172.20.6.87])
 by mail.nic.cz (Postfix) with ESMTPSA id 82C95140664;
 Thu, 16 Sep 2021 17:00:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
 t=1631804429; bh=OMPDpO9lti8C5RXJv40kUe13cvJj8OulFsVd+ya5mIE=;
 h=Date:From:To;
 b=J7w0Tc71Lp4iDymcBU5eU7iWprA4Vf3d10RqGsVUGpN85M2ssvekNkj30bhgaxhur
 PajbzGf0mODvNIyXxsFOCLA96FcDvflWD9pHKhhECu/s+EED6PtU9Vb3XcXDPPQR+H
 pSRkadrXOQPtSezUeOPz8w5OK+YfRW0cCs2tEB/A=
Date: Thu, 16 Sep 2021 17:00:28 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <marek.behun@nic.cz>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, Marek Vasut
 <marex@denx.de>, Tom Rini <trini@konsulko.com>
Message-ID: <20210916170028.28005d26@thinkpad>
In-Reply-To: <20210916155040.v3.2.Ia461e670c7438478aa8f8939209d45c818ccd284@changeid>
References: <20210916140118.874028-1-patrick.delaunay@foss.st.com>
 <20210916155040.v3.2.Ia461e670c7438478aa8f8939209d45c818ccd284@changeid>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
 USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
 autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Cc: Vignesh R <vigneshr@ti.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, u-boot@lists.denx.de,
 Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>, Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH v3 2/2] mtd: spi: nor: force mtd name to
	"nor%d"
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

Hi Marek, Patrick,

the patches that made this change also include patch
https://source.denx.de/u-boot/u-boot/-/commit/dcb9a80359d699cf659c95b9b6e6604e2d68adb9

This patch was added so that when there are multiple identical SPI-NOR
chips on the board, you can still select between them in the `mtd`
command via the OF path. That's why the `mtd list` command lists OF
path.

In the discussion with Tom, we also were talking about backwards
compatibility with mtdparts, and if I remember correctly, the
conclusion was that mtdparts is deprecated:
- many configs with MTDPARTS can now be converted to define the
  partitions via OF
- the remaining which can't need their mtd driver updated

Afterwards there will be no need for mtdpart.

I think this is the correct solution here. Not the one where we are
returning back to the "norN" names.

Marek
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
