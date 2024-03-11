Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F415D8788F4
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Mar 2024 20:32:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA255C6DD9D;
	Mon, 11 Mar 2024 19:32:18 +0000 (UTC)
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B973CC6DD73
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 19:32:17 +0000 (UTC)
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id 831C620A8B;
 Mon, 11 Mar 2024 20:32:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
 s=default; t=1710185536;
 bh=ynRtQgnBWOHR99aAzab83ZBliyAvchxySkBa5UYZh2k=; h=From:To:Subject;
 b=T8fmovKP3gQ9tFrarVRd35J1l4jEVEQfR4lsDC34oKHJqyjU0n/AO5hsBcWoCd+3q
 Lk5FZpxLFrbU0V24gFB3vun6acFKT+LMqYERZCTApUoJmWtuXJr5cGHfcFbovZ8Zc6
 FUIR3Pddk99Oe6PWMZ4VmmM5hnIsBUrSTcD8o0OfZp2Fl9fxSWVMj3OCBxzRiP6xjh
 /+jcaZJaXiVN9inCFhd34XRFYOcqeMOCpSx9NwQFJK4FbCGAYohX3/veWPUIlzJW21
 jI/wX47H2PMXl5ksXV7ag5bVn+Ui9SOl+QglWULIO70/c/DYzSaDe/ITSwZ85Pjxd4
 3vnvvB6En/SLA==
Date: Mon, 11 Mar 2024 20:32:11 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <20240311193211.GA4582@francesco-nb>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240311143918.2927406-2-patrice.chotard@foss.st.com>
 <20240311143918.2927406-1-patrice.chotard@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>, Udit Kumar <u-kumar1@ti.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Kumar Gala <galak@kernel.crashing.org>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Michal Simek <michal.simek@amd.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] lmb: Avoid to add identical region in
 lmb_add_region_flags()
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

Hello Patrice,

On Mon, Mar 11, 2024 at 03:39:17PM +0100, Patrice Chotard wrote:
> In case lmb_add_region_flags() is called with the same parameter than
> an already existing lmb and this lmb is adjacent to its previous lmb with
> different flag, this lmb is added again.

Is this

On Mon, Mar 11, 2024 at 03:39:18PM +0100, Patrice Chotard wrote:
> In case a new region is adjacent to a previous region with
> similar flag, this region is merged with its predecessor, but no
> check are done if this new added region is overlapping another region
> present in lmb (see reserved[3] which overlaps reserved[4]).

or this, related to some

ERROR: reserving fdt memory region failed

message in your opinion?

More details in https://lore.kernel.org/all/fe9431c5-6806-1b7a-f9f4-dbe97ee13bba@toradex.com/

Francesco

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
