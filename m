Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D35F176AB6
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Mar 2020 03:46:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C5D9C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Mar 2020 02:46:10 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7E10C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Mar 2020 02:46:08 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id a22so1434684oid.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Mar 2020 18:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:from:in-reply-to:references:date:message-id
 :subject:to:cc;
 bh=Ljx5D9F76B79FS90sG73wTzHmCks4xUWtCn3QbKPnHc=;
 b=CZZSz32Iv52Wjnm9I6S6kJAFAOWAn92rx52+nvvGrpXJUIC6wtLkKAMk5LxaPIONQc
 4s/tW0gZHh29Gd7XwSELejwH9Qhnzu1SPwMnYIH1Cge5XC0a/ekQ+/Wg7YnvCqP1+FZE
 Lgj124jsyZ8riZrE4flaKy5REf/cFKv1e/5zf/2i+v1PvGm7QBSNwnVmvusQJ8HiMQhU
 R6BN3bBtpf8FANHTe4497etLxRjfGxpDVfYKJ+FF5tpPhzOdqbgzE9myRpXPQnmhfThe
 s2J53txbEbY56nZyJD02FMP0xLsmhTw6xaKsTlNvPtDkErXeSb5xT31iuUNm0DmWNiAB
 OlgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:in-reply-to:references
 :date:message-id:subject:to:cc;
 bh=Ljx5D9F76B79FS90sG73wTzHmCks4xUWtCn3QbKPnHc=;
 b=AOE4TdGwTLmGgE/QIcigmmaq7cX56f76VwMp0EqIDSwC6jOBAy2sHSFWfHTDUMEu3l
 /10FlQ5Cngq/MXgtO+xyKqn5GFZNvkFaTBF2vLtIpVXSe+C0Qio41ZNN8C5XZ36n1vua
 Q7egzaq9E/m0Jvkqkv4Zv+ECKTsBe3cXWbomW0kV7fsGUYIBnscm61BSFUPY3Yg2uJ2d
 Iwf/21R+AiktnGS6dxvP8KLqLREoXoXS1fsZ1kA65L9fDDDlTVaXNYDrVy7L/DgQnR2k
 G6RBzMNpC2vnvYJJdr2efm6+N3TmPLjf54VbEhs1A/MuaVyAfJPg3faX82BWs934G+4S
 M3BA==
X-Gm-Message-State: ANhLgQ121GEPhAcXa3aRvPWb26byyIcVVLEXy1Ep+oMfBtEJOBm5q9qE
 bE01dYqWBgnx6Sgit+SGoYo4Jg+S8y5dS+1EciLrXg==
X-Google-Smtp-Source: ADFU+vs5vXlZPI3OS6nIcgPDf3ESmzZzFvxGBU5n5DM1RbQZRR2h8ahUeUl6ZRZEBs54JU2cxIeVZvb13u+ikfpB8Go=
X-Received: by 2002:aca:130c:: with SMTP id e12mr1007334oii.122.1583203567085; 
 Mon, 02 Mar 2020 18:46:07 -0800 (PST)
Received: from 480794996271 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 3 Mar 2020 02:46:06 +0000
MIME-Version: 1.0
From: sjg@google.com
In-Reply-To: <CAPnjgZ1SMJ+Vt-ZuqLbG+pHjY-dyNF4ZM5hvqPXKoz_q_8ATPA@mail.gmail.com>
References: <CAPnjgZ1SMJ+Vt-ZuqLbG+pHjY-dyNF4ZM5hvqPXKoz_q_8ATPA@mail.gmail.com>
 <20200218144346.13441-1-patrick.delaunay@st.com>
Date: Tue, 3 Mar 2020 02:46:06 +0000
X-Google-Sender-Auth: 21nUTPWqxSGsx3CTifKY60HHXWk
Message-ID: <CAPnjgZ3cSmpeOY1wvuNo7v3gdy48AL9sGhS0oD430B4WjdpKOA@mail.gmail.com>
To: Simon Glass <sjg@chromium.org>
Cc: Michal Simek <monstr@monstr.eu>, Rajan Vaja <rajan.vaja@xilinx.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jens Wiklander <jens.wiklander@linaro.org>
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

Applied to u-boot-dm, thanks!
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
