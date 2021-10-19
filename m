Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D03433042
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 Oct 2021 09:56:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63B59C5C849;
	Tue, 19 Oct 2021 07:56:33 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 018CDC5C848
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 07:56:31 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id v127so10991949wme.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 00:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JCijkpm+MDVEv2aCCE8gcjIEY2wS1dmhV7v4Y14Uno8=;
 b=Kyy8FX+6Cw1Dg8fZkToGIXV+n9oq1EXKZhye0hsy5AEbd5ryzQJ15rfBJkXJeOhbRM
 S0Hb6+u6Ib3s7RWKHT0r++1oZR2tjYmZIed///WlWubaSoV1tbolKAiDgvpB5+XvPwzr
 IFa/JA/heRYfbNKdiOd+hPri8CvS1DoJ151XPaARRDC91T7uSnQppOcZrQrLNOCZrMAS
 eS1AtbH/sKKzMujBpKHWfn+lgXNo4OHDRuc7GMJ4SVGJEmVd8KSo51UF3W5hC4rYbwDD
 swibJUDZrgBSYeYkFrgYxSICEpPw2yuTjMYyqXycO5zIjcZljFClK9EwbLVE1VpFrySZ
 Z3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JCijkpm+MDVEv2aCCE8gcjIEY2wS1dmhV7v4Y14Uno8=;
 b=JIDOpM3oTl45CMsIsxjgTi40OYEPIG7WPtPSqYjYUBuatgibVgZu1hgQcyfWehkJaa
 seK3pmjoJFkcz2c+AP1xHp+FAeasmrsB7tWFl7FhoXKlBr2AnYHAY+zIAMYTosSn4pFB
 nRBE1EfnKczeMGMEjBguWCskGXRGCyjQMJgUNFWEHP4BvWvDcQ6CRDVs4+K6XkYNEZXU
 lOCawsHwBsgbzn+eO/PkCJFggAvRFC9sbTMOJImMDB2my4Q1gDR35/THf9S37LVotp9R
 H+GtWssTDaoQ0+H96JhtKPNpD83wKgTRjX9LniU4iS54o9oQHhhjSsY/gvy2mXeu5DFq
 WWNQ==
X-Gm-Message-State: AOAM532ozyUg8xLfW9NNsCp+fknYCnvH0rjKa5KMrc31/JFeNNpOd6jl
 xeT3awiNuYqOixxeTX8P+Ggo5Q==
X-Google-Smtp-Source: ABdhPJy3tWWgPZ15I93iX7dQ1HExAR5w9KqhYMWspBesKHb6ljgicYWHOSW8Tbbu/UMZg8ll7aRaYw==
X-Received: by 2002:a1c:740e:: with SMTP id p14mr4286873wmc.109.1634630191501; 
 Tue, 19 Oct 2021 00:56:31 -0700 (PDT)
Received: from apalos.home (ppp-94-66-220-13.home.otenet.gr. [94.66.220.13])
 by smtp.gmail.com with ESMTPSA id g2sm14314995wrq.62.2021.10.19.00.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 00:56:30 -0700 (PDT)
Date: Tue, 19 Oct 2021 10:56:26 +0300
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: Tom Rini <trini@konsulko.com>
Message-ID: <YW56KurTNFyaMnAY@apalos.home>
References: <20211015084243.285423-1-ilias.apalodimas@linaro.org>
 <20211018205033.GA3078606@bill-the-cat>
 <20211019002924.GW7964@bill-the-cat>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211019002924.GW7964@bill-the-cat>
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

On Mon, Oct 18, 2021 at 08:29:24PM -0400, Tom Rini wrote:
> On Mon, Oct 18, 2021 at 04:50:33PM -0400, Tom Rini wrote:
> > On Fri, Oct 15, 2021 at 11:42:40AM +0300, Ilias Apalodimas wrote:
> > 
> > > OF_HOSTFILE is used on sandbox configs only.  Although it's pretty
> > > unique and rarely causes confusion,  we are better of having simpler
> > > config options for the DTB.
> > > 
> > > So let's replace that with the existing OF_BOARD.  U-Boot would then
> > > have only three config options for the DTB origin.
> > > - OF_SEPARATE, build separately from U-Boot
> > > - OF_BOARD, board specific way of providing the DTB
> > > - OF_EMBED embedded in the u-boot binary(should not be used in production)
> > > 
> > > Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> > > ---
> > > Note that this must be applied on top of
> > > https://lore.kernel.org/u-boot/20211011210016.135929-1-ilias.apalodimas@linaro.org/
> > > changes since v2:
> > > - Rebased on top of the updated OF_BOARD patchset
> > > Changes since v1:
> > > - Added internal error value on board_fdt_blob_setup().  Arguably
> > >   we can just check against NULL and simplify this even more if we
> > >   don't care about the errno
> > > - OF_BOARD is now default for sandbox builds
> > 
> > With the previous series applied, this breaks xilinx_zynq_virt:
> > https://source.denx.de/u-boot/u-boot/-/jobs/337428 
> > 
> > I had a little trouble in general getting the board to run locally, even
> > without the patches, so I didn't debug further yet.
> 
> Here's another thing, that might be related.  The dependency series has
> minor size changes, in basically expected platforms and places.  This
> patch adds tons of size changes on virtually all platforms.  That might
> provide a clue or two as to what's going on.

I'll have a look. What changes here is an extra argument to preserve the
errno (which we can get rid of).

> 

Is it the OF_HOSTFILE patch that breaks it?  There's one thing this patch
changes in functionality.  In the new version fdtdec_setup() will return an
error if the DTB is not found.  
Can I reproduce this locally?

Thanks!
/Ilias
> -- 
> Tom


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
