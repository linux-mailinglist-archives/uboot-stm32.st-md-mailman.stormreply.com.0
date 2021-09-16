Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC4140DD70
	for <lists+uboot-stm32@lfdr.de>; Thu, 16 Sep 2021 17:00:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 976D9C5A4D4;
	Thu, 16 Sep 2021 15:00:30 +0000 (UTC)
Received: from mail.nic.cz (lists.nic.cz [217.31.204.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FF7BC5718F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Sep 2021 15:00:26 +0000 (UTC)
Received: from thinkpad (unknown [172.20.6.87])
 by mail.nic.cz (Postfix) with ESMTPSA id 89B47140664;
 Thu, 16 Sep 2021 17:00:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
 t=1631804425; bh=8DJEsPQs3zIpmQL1jYxwKuj3fEplPp69RRkKjNvAELc=;
 h=Date:From:To;
 b=KaiWJSI6YXjxQJ9CsnQB9r9ijNHSH19GFMH367rYJ+Q0M0gqe7SjIbffDjZ0Q0mHJ
 63wPB9HaP+UJc34ZtEj9Tm62q+9WQUEuS3hbXULRa1GF20taqAcm99ke35JTJnieoX
 woO3o4m1opZew+70u3K26P2G0z3Sne5sVcUCy8OY=
Date: Thu, 16 Sep 2021 17:00:24 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <marek.behun@nic.cz>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210916170024.20e9faa9@thinkpad>
In-Reply-To: <20210913094034.1.I73dae4b93f0587dc130e512e95a1f4794e0b0233@changeid>
References: <20210913094034.1.I73dae4b93f0587dc130e512e95a1f4794e0b0233@changeid>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
 USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
 autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Cc: Vignesh R <vigneshr@ti.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>, u-boot@lists.denx.de,
 Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH] mtd: spi: nor: force mtd name to "nor%d"
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

On Mon, 13 Sep 2021 09:40:50 +0200
Patrick Delaunay <patrick.delaunay@foss.st.com> wrote:

You can select by of path, i.e.

mtd /soc/spi@58003000/mx66l51235l@0

see patch
https://source.denx.de/u-boot/u-boot/-/commit/dcb9a80359d699cf659c95b9b6e6604e2d68adb9

Tom said that mtdparts is deprecated and all instances should be
converted to OF.

Marek
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
