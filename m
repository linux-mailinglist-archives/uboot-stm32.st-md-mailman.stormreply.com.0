Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF80162E96
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Feb 2020 19:31:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DDBEC36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Feb 2020 18:31:40 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E260FC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2020 18:31:38 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id p8so20442970oth.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2020 10:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iiMc82Z7Un95C+xlwUSoFhEA24ltgzEEpquT02LDohc=;
 b=mN8S3FWRCvwJQZOfg/nWZ0LyOS5SvqqnO0M7e2sGE3uzNG6LMWhTpCMwfGzXNSu6Ep
 bsbgjcSytNfdfwvYIji4f1n/2jT9TEg3QolW9FUcluoQjgeU6o0OJnEyn+Huqg5ZY6A0
 pAoiQ0sDpvOzo3vR7KNGehT/UHiFvF6kGyNW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iiMc82Z7Un95C+xlwUSoFhEA24ltgzEEpquT02LDohc=;
 b=RPmPo6Y3hbRQPvfezj05L1+uKDA+FDJst5NVEL6lAl/XOEB1dCxVHMfwoBNGyNlL/s
 0zda8ZCHGZAhgytVV1+cnMT58jrnfaFuUbO3hT3s5DIlLZ3JKuRyexeHa5LrVhALdC7m
 QgXA2BQOAO/iKyFKnfnIkN3FMBnPRjbehx4r/gdlZ2iGk7oiWEuXQSCpIRXNZJvgPTYG
 AWtjiMboQcV/xIRJmO9qO/+zuUcy8uCXMjIkmC7NcPQNt0RijNrOpGNzInsczK5KS77a
 O4gvQJ2dmcNScAjlhzJg9njHZcNKN0a/5A3+W1MT6vzzZumjTKAvwmSHNFl1BavhtG8k
 K8ZQ==
X-Gm-Message-State: APjAAAXHj/FGK9kbhCd8CJjzlW/lna+mxDU09E0JWGdUr50KnD9DMvFX
 N2/gIGxYseIu6FfTC+aWOR0/rEqGN/OygFRnufsDFQ==
X-Google-Smtp-Source: APXvYqybcy+CH+CDqNhEwMf/OiRWaBbMZezhu3Wz3aIMiPOU0hRWfAkU2cRHsSFFYooY0ngSvNe4y7EfRwPDhto7iFA=
X-Received: by 2002:a9d:2dea:: with SMTP id g97mr16868986otb.33.1582050697163; 
 Tue, 18 Feb 2020 10:31:37 -0800 (PST)
MIME-Version: 1.0
References: <20200218144346.13441-1-patrick.delaunay@st.com>
In-Reply-To: <20200218144346.13441-1-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 18 Feb 2020 11:31:24 -0700
Message-ID: <CAPnjgZ1SMJ+Vt-ZuqLbG+pHjY-dyNF4ZM5hvqPXKoz_q_8ATPA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Michal Simek <monstr@monstr.eu>,
 Jens Wiklander <jens.wiklander@linaro.org>, Rajan Vaja <rajan.vaja@xilinx.com>
Subject: Re: [Uboot-stm32] [PATCH v3] dm: core: Move "/chosen" and
	"/firmware" node scan
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

On Tue, 18 Feb 2020 at 07:44, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Use the new function dm_scan_fdt_ofnode_path() to scan all the nodes
> which aren't devices themselves but may contain some:
> - "/chosen"
> - "/clocks"
> - "/firmware"
>
> The patch removes the strcmp call in recursive function dm_scan_fdt_live()
> and also corrects a conflict with the 2 applied patches in
> the commit 1712ca21924b ("dm: core: Scan /firmware node by default")
> and in the commit 747558d01457 ("dm: fdt: scan for devices under
> /firmware too"): the subnodes of "/firmware" (optee for example)
> are bound 2 times.
>
> For example the dm tree command result on STM32MP1 is:
>
> STM32MP> dm tree
>  Class     Index  Probed  Driver                Name
>  -----------------------------------------------------------
>  root          0  [ + ]   root_driver           root_driver
>  firmware      0  [   ]   psci                  |-- psci
>  sysreset      0  [   ]   psci-sysreset         |   `-- psci-sysreset
>  simple_bus    0  [ + ]   generic_simple_bus    |-- soc
> ...
>  tee           0  [ + ]   optee                 |-- optee
> ...
>  tee           1  [   ]   optee                 `-- optee
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Tested-by: Michal Simek <michal.simek@xilinx.com>
> ---
>
> Also reported here:
> https://lists.denx.de/pipermail/u-boot/2020-January/395427.html
>
>
> Changes in v3:
> - update test-fdt: use dm_extended_scan_fdt instead of dm_scan_fdt
>
> Changes in v2:
> - update commit message (Serie-cc => Series-cc)
>
>  drivers/core/root.c | 52 +++++++++++++++------------------------------
>  test/dm/test-fdt.c  |  2 +-
>  2 files changed, 18 insertions(+), 36 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
