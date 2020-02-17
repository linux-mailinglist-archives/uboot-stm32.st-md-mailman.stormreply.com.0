Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C9F160954
	for <lists+uboot-stm32@lfdr.de>; Mon, 17 Feb 2020 04:55:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69AD1C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 17 Feb 2020 03:55:59 +0000 (UTC)
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 140B4C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2020 03:55:57 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id l136so15454451oig.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Feb 2020 19:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fY38joiEp8m93gDe0c419pvQAxjpF6CTdKPEC9mImSU=;
 b=B3Gmutr+Qg3YRETKtNJ58BSujInYl2eTic6RnR3+vaCslEqEBq1rOlKcY5WzpBHNcd
 DOK8k4mR8RIpEYhtW9mnnyR62vJXhA+FDZgsHYHfyphrgzZrUF0zuCwhch8wQ1MHKLfy
 BRZVV8G04qqLkMu9lv3W9xZybZdMVEynZRdcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fY38joiEp8m93gDe0c419pvQAxjpF6CTdKPEC9mImSU=;
 b=V1E3okqfafwsgL9G7LTwCtNg6Glhvclx4I3PKRrNJ1zDO5a1l0rXB+dZ9FOb6n7L5b
 oVu/wjtoo5IuaPJKXQ6wPIzxGTScolt6N6Yaq7bGQp6AlEVYKg+8mO0DvRXIfZv5FquM
 j1Q7Qsd6J62WaP63uW23syJZLT3uWhN0H+oMQF1F1foXvcz3qD/KYeQ6qGX9nLvHWch+
 eDwejCebhTBXsHnFIMXUro80AYHGQYl9Gx1Ry2/ICTh83xN+Z4vf2phK6/5NGx0b87Kw
 qCaKOZ9v7su8OcjtW5bEb84K5wQL3CRmpwBYFgLRWbIxckW4ep1Tv3+d83WnxlX6EQ0R
 LfZw==
X-Gm-Message-State: APjAAAVpgluPsR0+FdyRFzPZgDXN54gKXnEnFGO7Ky1LhI40/l3IpYGL
 5ghInYEJMzRWgI166EraDbUeecq6N7NtpBCpH0P+Ew==
X-Google-Smtp-Source: APXvYqwmqjANNCY2rWVczUuj4GFneOjYNekfJQ+0VDR2ebBZvzgWR5k3oVxi7bLoRa6Rl8lzUk5z+CC6k11wytAXEkA=
X-Received: by 2002:a54:4f16:: with SMTP id e22mr9077608oiy.170.1581911755344; 
 Sun, 16 Feb 2020 19:55:55 -0800 (PST)
MIME-Version: 1.0
References: <20200213184800.13968-1-patrick.delaunay@st.com>
In-Reply-To: <20200213184800.13968-1-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 16 Feb 2020 20:55:44 -0700
Message-ID: <CAPnjgZ0oAPNwJFbEwQyE8CnxjGF3G96APJF249gTtXUt1QLMUg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Jens Wiklander <jens.wiklander@linaro.org>, Rajan Vaja <rajan.vaja@xilinx.com>
Subject: Re: [Uboot-stm32] [PATCH v2] dm: core: Move "/chosen" and
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

Hi Patrick,

On Thu, 13 Feb 2020 at 11:48, Patrick Delaunay <patrick.delaunay@st.com> wrote:
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
> ---
>
> Changes in v2:
> - update commit message (Serie-cc => Series-cc)
>
>  drivers/core/root.c | 52 +++++++++++++++------------------------------
>  1 file changed, 17 insertions(+), 35 deletions(-)


This looks good to me, but please can you address the test failure
(make qcheck)?

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
