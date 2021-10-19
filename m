Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92425433489
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 Oct 2021 13:17:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45AC1C5C84C;
	Tue, 19 Oct 2021 11:17:03 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A433AC57183
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 11:17:01 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id i20so11361634edj.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 04:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PhyxchF7/J3efrYGZ7+wUBePuJ814MLwUDzTwQOHnFQ=;
 b=IktIWJ5C66t+VdFw4pZGJQaEoLsqykCCbT5U1URx6cva4/adltnRobq+bnG8yzNC5M
 DVhpa+zoF2K2crSEPf2bAnEvu9ShCGyrQaX6NnAHgkS5Bek75fgH6UWvxwzPJhUve2eW
 cDL3UBsGQZ145eNP/9NZEzGrj/rjuqzgxGPRNoeMD641mqSr8Pw2MHLVKsaUilE4pVnB
 ToBNSYhbXPfyZC13A0FfQX251DRizQ75HpJ7MU4rz62pd8SQpfX0MhqkJwxjcaHb6hOS
 DFYu9Z6I2dwIHXZmn9AhK6WROCXbEjhRNg5xS5gMXTl6BQMcOqi+ndykULsstEx8kNYu
 HH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PhyxchF7/J3efrYGZ7+wUBePuJ814MLwUDzTwQOHnFQ=;
 b=Eh8riQEmX5cSm5a9cH4kL1Y+VwrLrH1WMogGgbFwDoxgPiq4Gjv2Lojd4KcnDCdoKF
 0OcRzwdmHr1wAZEBypFgd1h8ffDK1Z3+luyqmSRAz2pqxrwViCw/Yvs/F5HBEAVhMqd9
 mxJSHjte2JFQJjz1IMvsazlB5DjNZcigbG33nsRVRbkkiuY8iE8KsWoZo0AWtEyE3tIY
 qrCQmpv3IQ/gp9NIaKVsQTBHvz8+N8+ohs3fWrnQFRSokr1GYLRmnYs+KsZJqE5SQ0U8
 G8ioAC/iXNd+Qj1tyLs8wzFTCWCuwuu6nYuKcocEafU82WiQ9LH5bRlGKp4iPHjEuIKe
 suaQ==
X-Gm-Message-State: AOAM530npDb7Dmj8igDBPUDmJChsDU96DzlrVsIx2PYHWbyFjZ8KLNYY
 dQgrX+zhhT+/KNb/nmMc9ReClA==
X-Google-Smtp-Source: ABdhPJwPH1UcqULScfiE7asflEIPJ/2HSh2U6je+OV1+eKm+1khQpQPJB0Eg/1S+rupEeGhh4Q8w4Q==
X-Received: by 2002:aa7:d29a:: with SMTP id w26mr2069156edq.96.1634642217139; 
 Tue, 19 Oct 2021 04:16:57 -0700 (PDT)
Received: from apalos.home (ppp-94-66-220-13.home.otenet.gr. [94.66.220.13])
 by smtp.gmail.com with ESMTPSA id f12sm11797863edx.90.2021.10.19.04.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 04:16:56 -0700 (PDT)
Date: Tue, 19 Oct 2021 14:16:52 +0300
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: Tom Rini <trini@konsulko.com>
Message-ID: <YW6pJHHgbPI85uui@apalos.home>
References: <20211015084243.285423-1-ilias.apalodimas@linaro.org>
 <20211018205033.GA3078606@bill-the-cat>
 <20211019002924.GW7964@bill-the-cat> <YW56KurTNFyaMnAY@apalos.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YW56KurTNFyaMnAY@apalos.home>
Cc: Liviu Dudau <liviu.dudau@foss.arm.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>, Rick Chen <rick@andestech.com>,
 Sean Anderson <seanga2@gmail.com>, u-boot@lists.denx.de,
 Zong Li <zong.li@sifive.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Stefan Roese <sr@denx.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Heiko Schocher <hs@denx.de>,
 Asherah Connor <ashe@kivikakk.ee>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Ramon Fried <rfried.dev@gmail.com>, Peter Robinson <pbrobinson@gmail.com>,
 "Ivan T. Ivanov" <iivanov@suse.de>, Wasim Khan <wasim.khan@nxp.com>,
 Harald Seiler <hws@denx.de>, Nandor Han <nandor.han@vaisala.com>,
 Andre Przywara <andre.przywara@arm.com>, Tim Harvey <tharvey@gateworks.com>,
 Green Wan <green.wan@sifive.com>, Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Steffen Jaeckel <jaeckel-floss@eyet-services.de>,
 T Karthik Reddy <t.karthik.reddy@xilinx.com>, Michal Simek <monstr@monstr.eu>,
 Matthias Brugger <mbrugger@suse.com>, Leo Yu-Chi Liang <ycliang@andestech.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, sjg@chromium.org,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v3] sandbox: Remove OF_HOSTFILE
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

On Tue, Oct 19, 2021 at 10:56:26AM +0300, Ilias Apalodimas wrote:
> On Mon, Oct 18, 2021 at 08:29:24PM -0400, Tom Rini wrote:
> > On Mon, Oct 18, 2021 at 04:50:33PM -0400, Tom Rini wrote:
> > > On Fri, Oct 15, 2021 at 11:42:40AM +0300, Ilias Apalodimas wrote:
> > > 
> > > > OF_HOSTFILE is used on sandbox configs only.  Although it's pretty
> > > > unique and rarely causes confusion,  we are better of having simpler
> > > > config options for the DTB.
> > > > 
> > > > So let's replace that with the existing OF_BOARD.  U-Boot would then
> > > > have only three config options for the DTB origin.
> > > > - OF_SEPARATE, build separately from U-Boot
> > > > - OF_BOARD, board specific way of providing the DTB
> > > > - OF_EMBED embedded in the u-boot binary(should not be used in production)
> > > > 
> > > > Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> > > > ---
> > > > Note that this must be applied on top of
> > > > https://lore.kernel.org/u-boot/20211011210016.135929-1-ilias.apalodimas@linaro.org/
> > > > changes since v2:
> > > > - Rebased on top of the updated OF_BOARD patchset
> > > > Changes since v1:
> > > > - Added internal error value on board_fdt_blob_setup().  Arguably
> > > >   we can just check against NULL and simplify this even more if we
> > > >   don't care about the errno
> > > > - OF_BOARD is now default for sandbox builds
> > > 
> > > With the previous series applied, this breaks xilinx_zynq_virt:
> > > https://source.denx.de/u-boot/u-boot/-/jobs/337428 
> > > 
> > > I had a little trouble in general getting the board to run locally, even
> > > without the patches, so I didn't debug further yet.
> > 
> > Here's another thing, that might be related.  The dependency series has
> > minor size changes, in basically expected platforms and places.  This
> > patch adds tons of size changes on virtually all platforms.  That might
> > provide a clue or two as to what's going on.
> 
> I'll have a look. What changes here is an extra argument to preserve the
> errno (which we can get rid of).
> 
> > 
> 
> Is it the OF_HOSTFILE patch that breaks it?  There's one thing this patch
> changes in functionality.  In the new version fdtdec_setup() will return an
> error if the DTB is not found.  
> Can I reproduce this locally?

Right, I did find a way to reproduce it locally.  It's indeed the change in
fdtdec_setup() that break this platform.  Specifically
board_fdt_blob_setup() in board/xilinx/common/board.c will return -ENXIO if
the DTB is not found.  Apparently that's ok for this platform so returning
0 there fixes the boot. It's also another reason why we need the errno
instead of just checking the pointer ....
Want me to send a v4 of the OF_HOSTFILE version?

Cheers
/Ilias
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
